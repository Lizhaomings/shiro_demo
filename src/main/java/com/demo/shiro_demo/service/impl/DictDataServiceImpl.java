package com.demo.shiro_demo.service.impl;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.mapper.DictDataMapper;
import com.demo.shiro_demo.entity.DictData;
import com.demo.shiro_demo.service.DictDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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
        return null;
    }

    @Override
    public ResponseResult saveDictData(DictData entity) {
        return null;
    }

    @Override
    public ResponseResult updateDictData(DictData entity) {
        return null;
    }
}
