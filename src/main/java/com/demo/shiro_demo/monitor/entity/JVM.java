package com.demo.shiro_demo.monitor.entity;

import cn.hutool.core.date.BetweenFormater;
import cn.hutool.core.date.DateUtil;
import lombok.Data;

import java.lang.management.ManagementFactory;
import java.util.Date;

/**
 * JVM相关信息
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:24 PM
 */
@Data
public class JVM {

    /**
     * 当前JVM占用的内存总数(M)
     */
    private double total;

    /**
     * JVM最大可用内存总数(M)
     */
    private double max;

    /**
     * JVM空闲内存(M)
     */
    private double free;

    /**
     * JDK版本
     */
    private String version;

    /**
     * JDK路径
     */
    private String home;

    /**
     * 获取JDK名称
     */
    public String getName() {
        return ManagementFactory.getRuntimeMXBean().getVmName();
    }

    /**
     * JDK启动时间
     */
    public String getStartTime() {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime();
        return DateUtil.format(new Date(time), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * JDK运行时间
     */
    public String getRunTime() {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime();
        return DateUtil.formatBetween(new Date(), new Date(time), BetweenFormater.Level.SECOND);
    }
}
