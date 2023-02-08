package com.demo.shiro_demo.monitor.thread;

import lombok.extern.slf4j.Slf4j;

import javax.websocket.Session;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * 实时日志查看监控客户端工具
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 5:51 PM
 */
@Slf4j
public class TailLogThread extends Thread{

    private BufferedReader reader;
    private Session session;

    public TailLogThread(InputStream in, Session session) {
        this.reader = new BufferedReader(new InputStreamReader(in));
        this.session = session;
    }

    @Override
    public void run() {
        String line;
        try {
            while ((line = reader.readLine()) != null) {
                // 将实时日志通过WebSocket发送给客户端，给每一行添加一个Html换行
                session.getBasicRemote().sendText(line + "<br>");
            }
            try {
                //每0.5秒执行一次
                Thread.sleep(500);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
