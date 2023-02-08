package com.demo.shiro_demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.Query;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.mapper.DictDataMapper;
import com.demo.shiro_demo.entity.DictData;
import com.demo.shiro_demo.service.DictDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
* 字典数据表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements DictDataService {

    @Override
    public ResponseResult listByTable(DictData entity) {
        LambdaQueryWrapper<DictData> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(entity.getName())) {
            queryWrapper.like(DictData::getName, entity.getName());
        }
        if (StringUtils.isNotEmpty(entity.getType())) {
            queryWrapper.like(DictData::getType, entity.getType());
        }
        if (entity.getIsEnable() != null && entity.getIsEnable() > 0) {
            queryWrapper.eq(DictData::getIsEnable, entity.getIsEnable());
        }
        queryWrapper.orderByAsc(DictData::getSort);
        Page<DictData> page = baseMapper.selectPage(new Page<>(entity.getPage(), entity.getLimit()), queryWrapper);
        return ResponseResult.table((int) page.getTotal(), page.getRecords());
    }

    @Override
    public ResponseResult saveDictData(DictData entity) {
        Integer count = baseMapper.selectCount(new LambdaQueryWrapper<DictData>().eq(DictData::getName, entity.getName())
                .or().eq(DictData::getValue, entity.getValue()));
        if (count > 0) {
            return ResponseResult.error("数据字典已存在");
        }
        baseMapper.insert(entity);
        return ResponseResult.success("数据字典添加成功");
    }

    @Override
    public ResponseResult updateDictData(DictData entity) {
        List<DictData> list = baseMapper.selectList(new LambdaQueryWrapper<DictData>().eq(DictData::getName, entity.getName())
                .eq(DictData::getValue, entity.getValue()));
        if (!CollectionUtils.isEmpty(list) && list.size() > 1) {
            return ResponseResult.error("数据字典已存在多个: ", entity.getName());
        } else if (list.size() == 1 && !list.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("该数据字典不存在：", entity.getName());
        } else {
            baseMapper.updateById(entity);
            return ResponseResult.success("数据字典更新成功");
        }
    }

    /**
     * 根据 type 查询所有数据字典
     * @param type
     * @return
     */
    public List<DictData> listAll(String type) {
        return baseMapper.selectList(new LambdaQueryWrapper<DictData>().eq(DictData::getType, type));
    }

    /**
     * 根据 type value 查询字典的名称
     * @param type
     * @param value
     * @return
     */
    public String getName (String type, String value) {
        DictData dictData = baseMapper.selectOne(new LambdaQueryWrapper<DictData>().eq(DictData::getType, type)
                                                .eq(DictData::getValue,value));
        return dictData.getName();
    }
}
