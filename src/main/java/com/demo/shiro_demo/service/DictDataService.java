package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.DictData;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* 字典数据表 Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface DictDataService extends IService<DictData> {

    ResponseResult listByTable(DictData entity);

    ResponseResult saveDictData(DictData entity);

    ResponseResult updateDictData(DictData entity);
}
