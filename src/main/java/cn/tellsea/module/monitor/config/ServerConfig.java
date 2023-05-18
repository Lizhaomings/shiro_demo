package cn.tellsea.module.monitor.config;

import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 服务器信息配置
 *
 * @author Tellsea
 * @date 2021/04/09
 */
@Component
public class ServerConfig implements ApplicationListener<WebServerInitializedEvent> {

    private int serverPort;

    public String getUrl(String prefix) {
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
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
