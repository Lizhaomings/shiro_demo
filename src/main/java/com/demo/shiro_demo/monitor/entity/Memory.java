package com.demo.shiro_demo.monitor.entity;

import com.demo.shiro_demo.util.ArithUtils;
import lombok.Data;

/**
 * 內存相关信息
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:24 PM
 */
@Data
public class Memory {

    /**
     * 内存总量
     */
    private double total;

    /**
     * 已用内存
     */
    private double used;

    /**
     * 剩余内存
     */
    private double free;

    /**
     * 获取使用量
     * @return
     */
    public double getUsage() {
        return ArithUtils.mul(ArithUtils.div(used, total, 4), 100);
    }
}
