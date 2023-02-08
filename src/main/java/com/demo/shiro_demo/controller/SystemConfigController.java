package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.service.SystemConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 系统配置 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/systemConfig")
public class SystemConfigController {

    @Autowired
    private SystemConfigService systemConfigService;
}