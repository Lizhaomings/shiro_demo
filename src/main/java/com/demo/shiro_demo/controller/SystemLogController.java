package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 系统日志表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/systemLog")
public class SystemLogController {

    @Autowired
    private SystemLogService systemLogService;
}