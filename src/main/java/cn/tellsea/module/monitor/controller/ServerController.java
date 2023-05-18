package cn.tellsea.module.monitor.controller;

import cn.tellsea.module.monitor.config.ServerConfig;
import cn.tellsea.module.monitor.consts.MonitorPerms;
import cn.tellsea.module.monitor.entity.Server;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 服务器监控
 *
 * @author Tellsea
 * @date 2021/04/06
 */
@Controller
@RequestMapping("/monitor/server")
public class ServerController {

    @Autowired
    private ServerConfig serverConfig;

    @RequiresPermissions(MonitorPerms.Server.VIEW)
    @GetMapping("init")
    public String init(Model model) {
        Server server = new Server();
        try {
            server.copyTo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("server", server);
        return "monitor/server/server_detail";
    }

    @GetMapping("tailLog")
    public String tailLog(Model model) {
        model.addAttribute("wsServerUrl", serverConfig.getUrl("ws") + "/monitor/websocket/tailLog");
        return "monitor/server/tail_log";
    }
}
