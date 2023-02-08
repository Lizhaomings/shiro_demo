package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.layuimini.MenuInfo;
import com.demo.shiro_demo.entity.ResourceInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.shiro_demo.vo.ResourceInfoVo;

import java.util.List;
import java.util.Map;

/**
* 资源表 Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface ResourceInfoService extends IService<ResourceInfo> {

    List<ResourceInfoVo> listByTable();

    List<MenuInfo> listAllByMenu();

    Map<String, Object> listByDTree();
}
