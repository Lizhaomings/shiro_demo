package com.demo.shiro_demo.shiro.service;

/**
 * @Author Jerry
 * @Description shiro service 接口
 * @Create 26/12/2022 2:06 PM
 */
public interface ShiroService {

    /**
     * 是否有权限，返回布尔值
     * @param permission
     * @return
     */
    Boolean isPerms(String permission);

    /**
     * 是否有权限，返回是否隐藏
     * @param permission
     * @return
     */
    String hasPerms(String permission);
}
