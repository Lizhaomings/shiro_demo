package cn.tellsea.module.monitor.controller;

import cn.tellsea.module.monitor.consts.MonitorPerms;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 服务器监控
 *
 * @author Tellsea
 * @date 2021/04/06
 */
@Controller
@RequestMapping("/monitor/druid")
public class DruidController {

    @RequiresPermissions(MonitorPerms.Druid.VIEW)
    @GetMapping("init")
    public String init() {
        return "redirect:/druid/index";
    }
}
