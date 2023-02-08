package com.demo.shiro_demo.monitor.config;

import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;


/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 3:54 PM
 *
 * 服务器信息配置
 */
@Component
public class ServerConfig implements ApplicationListener<WebServerInitializedEvent> {

    private int serverPort;

    public String getUrl(String prefix) {
        InetAddress address = null;
        try {
            InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return prefix + "://" + address.getHostAddress() + ":" + this.serverPort;
    }

    @Override
    public void onApplicationEvent(WebServerInitializedEvent event) {
        this.serverPort = event.getWebServer().getPort();
    }
}
