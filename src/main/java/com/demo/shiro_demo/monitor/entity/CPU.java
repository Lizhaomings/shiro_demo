package com.demo.shiro_demo.monitor.entity;

import lombok.Data;

/**
 * CPU 相关信息
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:29 PM
 */
@Data
public class CPU {

    /**
     * 核心数
     */
    private int cpuNum;

    /**
     * CPU总的使用率
     */
    private double total;

    /**
     * CPU系统使用率
     */
    private double sys;

    /**
     * CPU用户使用率
     */
    private double used;

    /**
     * CPU当前等待率
     */
    private double wait;

    /**
     * CPU当前空闲率
     */
    private double free;
}
