package com.demo.shiro_demo.monitor.entity;

import lombok.Data;

/**
 * 系统相关信息
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:24 PM
 */
@Data
public class Sys {

    /**
     * 服务器名称
     */
    private String computerName;

    /**
     * 服务器Ip
     */
    private String computerIp;

    /**
     * 项目路径
     */
    private String userDir;

    /**
     * 操作系统
     */
    private String osName;

    /**
     * 系统架构
     */
    private String osArch;
}
