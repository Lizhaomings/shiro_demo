package com.demo.shiro_demo.shiro.aop.annotation;

import java.lang.annotation.*;

/**
 * @Author Jerry
 * @Description 动态更新 shiro 自定义注解
 * @Create 26/12/2022 1:55 PM
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DynamicShiro {

}
