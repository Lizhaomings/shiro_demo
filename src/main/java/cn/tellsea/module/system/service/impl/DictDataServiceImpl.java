package cn.tellsea.module.system.service.impl;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.DictData;
import cn.tellsea.module.system.mapper.DictDataMapper;
import cn.tellsea.module.system.service.DictDataService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 字典数据表 Service接口实现类
 *
 * @author Tellsea
 * @date 2021-04-09
 */
@Service("dict")
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements DictDataService {

    @Override
    public ResponseResult listByTable(DictData entity) {
        LambdaQueryWrapper<DictData> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(entity.getName())) {
            wrapper.like(DictData::getName, entity.getName());
        }
        if (StringUtils.isNotEmpty(entity.getType())) {
            wrapper.like(DictData::getType, entity.getType());
        }
        if (entity.getIsEnable() != null && entity.getIsEnable() > 0) {
            wrapper.eq(DictData::getIsEnable, entity.getIsEnable());
        }
        wrapper.orderByAsc(DictData::getSort);
        Page<DictData> page = baseMapper.selectPage(new Page<>(entity.getPage(), entity.getLimit()), wrapper);
        return ResponseResult.table((int) page.getTotal(), page.getRecords());
    }

    @Override
    public ResponseResult saveEntity(DictData entity) {
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<DictData>().eq(DictData::getName, entity.getName())
                .or().eq(DictData::getValue, entity.getValue()));
        if (count > 0) {
            return ResponseResult.error("字典数据已存在");
        }
        baseMapper.insert(entity);
        return ResponseResult.success("新增成功");
    }

    @Override
    public ResponseResult updateEntity(DictData entity) {
        List<DictData> list = baseMapper.selectList(new LambdaQueryWrapper<DictData>().eq(DictData::getName, entity.getName())
                .eq(DictData::getValue, entity.getValue()));
        if (!CollectionUtils.isEmpty(list) && list.size() > 1) {
            return ResponseResult.error("字典数据已存在多个：" + entity.getName());
        } else if (list.size() == 1 && !list.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("字典数据已存在");
        } else {
            baseMapper.updateById(entity);
            return ResponseResult.success("更新成功");
        }
    }

    /**
     * 根据type查询所有列表
     *
     * @param type
     * @return
     */
    public List<DictData> listAll(String type) {
        return baseMapper.selectList(new LambdaQueryWrapper<DictData>().eq(DictData::getType, type));
    }

    /**
     * 根据name、value翻译中文
     *
     * @param type
     * @param value
     * @return
     */
    public String getName(String type, String value) {
        DictData dictData = baseMapper.selectOne(new LambdaQueryWrapper<DictData>()
                .eq(DictData::getType, type).eq(DictData::getValue, value));
        return dictData.getName();
    }
}
