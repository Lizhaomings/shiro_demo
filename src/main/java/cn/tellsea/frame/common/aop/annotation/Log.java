package cn.tellsea.frame.common.aop.annotation;

import java.lang.annotation.*;

/**
 * 操作日志自定义注解
 *
 * @author Tellsea
 * @date 2019/7/17
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    String value();
}
