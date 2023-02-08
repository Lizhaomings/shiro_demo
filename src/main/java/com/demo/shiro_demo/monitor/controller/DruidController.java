package com.demo.shiro_demo.monitor.controller;

import com.demo.shiro_demo.monitor.consts.MonitorPerms;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 服务器监控
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:13 PM
 */
@Controller
@RequestMapping("/monitor/druid")
public class DruidController {

    @RequiresPermissions(MonitorPerms.Druid.VIEW)
    @GetMapping("/init")
    public String init() {
        return "redirect:/druid/index";
    }
}
