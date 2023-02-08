package com.demo.shiro_demo.common.aop.annotation;

import java.lang.annotation.*;

/**
 * @Author Jerry
 * @Description 登录日志自定义注解
 * @Create 23/12/2022 2:55 PM
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LoginLog {
}
