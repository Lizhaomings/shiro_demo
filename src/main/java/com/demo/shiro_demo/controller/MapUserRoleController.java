package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.service.MapUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 用户角色关联表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/mapUserRole")
public class MapUserRoleController {

    @Autowired
    private MapUserRoleService mapUserRoleService;
}