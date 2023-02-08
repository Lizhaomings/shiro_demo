package com.demo.shiro_demo.monitor.websocket;

import com.demo.shiro_demo.monitor.thread.TailLogThread;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.InputStream;

/**
 * 运行监控
 *
 * @Author Jerry
 * @Description
 * @Create 16/01/2023 11:57 AM
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
            Runtime.getRuntime().exec("tail -f /Desk/shiro_demo/project.log");
            inputStream = process.getInputStream();
            TailLogThread thread = new TailLogThread(inputStream, session);
            thread.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @OnMessage
    public void onMessage(String msg) {
        log.info("发送消息： " + msg);
    }

    @OnClose
    public void onClose(){
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
