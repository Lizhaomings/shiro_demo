package com.demo.shiro_demo.shiro.aop.aspect;

import com.demo.shiro_demo.shiro.service.ShiroService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Author Jerry
 * @Description 动态更新shiro切面
 * @Create 26/12/2022 1:58 PM
 */
@Slf4j
@Aspect
@Component
@SuppressWarnings("all")
public class DynamicShiroAspect {

    @Autowired
    private ShiroService shiroService;

    /**
     * 权限更新切点
     */
    @Pointcut("@annotation(com.demo.shiro_demo.shiro.aop.annotation.DynamicShiro)")
    public void DynamicShiroAspect() {

    }

    @After("dynamicShiroAspect()")
    public void after() {
        log.info("DynamicShiroAspect: shiro 动态更新权限成功...");
    }
}
