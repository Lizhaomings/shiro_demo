package cn.tellsea.module.system.service.impl;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.DictData;
import cn.tellsea.module.system.entity.DictType;
import cn.tellsea.module.system.mapper.DictDataMapper;
import cn.tellsea.module.system.mapper.DictTypeMapper;
import cn.tellsea.module.system.service.DictTypeService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 字典类型表 Service接口实现类
 *
 * @author Tellsea
 * @date 2021-04-09
 */
@Service
public class DictTypeServiceImpl extends ServiceImpl<DictTypeMapper, DictType> implements DictTypeService {

    @Autowired
    private DictDataMapper dictDataMapper;

    @Override
    public ResponseResult listByTable(DictType entity) {
        LambdaQueryWrapper<DictType> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(entity.getName())) {
            wrapper.like(DictType::getName, entity.getName());
        }
        if (StringUtils.isNotEmpty(entity.getType())) {
            wrapper.eq(DictType::getType, entity.getType());
        }
        wrapper.orderByAsc(DictType::getSort).orderByAsc(DictType::getCreateTime);
        Page<DictType> page = baseMapper.selectPage(new Page<>(entity.getPage(), entity.getLimit()), wrapper);
        return ResponseResult.table((int) page.getTotal(), page.getRecords());
    }

    @Override
    public ResponseResult saveEntity(DictType entity) {
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<DictType>().eq(DictType::getType, entity.getType()));
        if (count > 0) {
            return ResponseResult.error("字典类型已存在：" + entity.getType());
        }
        baseMapper.insert(entity);
        return ResponseResult.success("新增成功");
    }

    @Override
    public ResponseResult updateEntity(DictType entity) {
        List<DictType> list = baseMapper.selectList(new LambdaQueryWrapper<DictType>().eq(DictType::getType, entity.getType()));
        if (!CollectionUtils.isEmpty(list) && list.size() > 1) {
            return ResponseResult.error("字典类型已存在多个：" + entity.getType());
        } else if (list.size() == 1 && !list.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("字典类型已存在：" + entity.getType());
        } else {
            DictType oldEntity = baseMapper.selectById(entity.getId());
            baseMapper.updateById(entity);
            dictDataMapper.update(new DictData().setType(entity.getType()), new LambdaQueryWrapper<DictData>().eq(DictData::getType, oldEntity.getType()));
            return ResponseResult.success("更新成功");
        }
    }

    @Override
    public ResponseResult deleteByType(String type) {
        int count = dictDataMapper.selectCount(new LambdaQueryWrapper<DictData>().eq(DictData::getType, type));
        if (count > 0) {
            return ResponseResult.error("该类型存在字典数据，不能删除");
        }
        baseMapper.delete(new LambdaQueryWrapper<DictType>().eq(DictType::getType, type));
        return ResponseResult.success("删除成功");
    }
}
