package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.service.MapRoleResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 角色资源关联表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/mapRoleResource")
public class MapRoleResourceController {

    @Autowired
    private MapRoleResourceService mapRoleResourceService;
}