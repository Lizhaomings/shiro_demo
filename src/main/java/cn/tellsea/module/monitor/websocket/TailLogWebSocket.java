package cn.tellsea.module.monitor.websocket;

import cn.tellsea.module.monitor.thread.TailLogThread;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.InputStream;

/**
 * 运行监控
 *
 * @author Tellsea
 * @date 2021/04/09
 */
@Slf4j
@Component
@ServerEndpoint("/monitor/websocket/tailLog")
public class TailLogWebSocket {

    private Process process;
    private InputStream inputStream;

    @OnOpen
    public void onOpen(Session session) {
        log.info("连接建立成功");
        try {
            process = Runtime.getRuntime().exec("tail -f /tellsea/project/Straw-Shiro/project.log");
            inputStream = process.getInputStream();
            TailLogThread thread = new TailLogThread(inputStream, session);
            thread.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @OnMessage
    public void OnMessage(String msg) {
        log.info("发送消息：" + msg);
    }

    @OnClose
    public void onClose() {
        log.info("连接关闭");
        try {
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (process != null) {
            process.destroy();
        }
    }

    @OnError
    public void onError(Throwable thr) {
        log.error("发生错误");
        thr.printStackTrace();
    }
}
