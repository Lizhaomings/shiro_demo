package com.demo.shiro_demo.monitor.entity;

import lombok.Data;

/**
 * 系统文件相关信息
 *
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 4:25 PM
 */
@Data
public class SysFile {

    /**
     * 盘符路径
     */
    private String dirName;

    /**
     * 盘符类型
     */
    private String sysTypeName;

    /**
     * 文件类型
     */
    private String typeName;

    /**
     * 总大小
     */
    private String total;

    /**
     * 剩余大小
     */
    private String free;

    /**
     * 已经使用量
     */
    private String used;

    /**
     * 资源的使用率
     */
    private double usage;
}
