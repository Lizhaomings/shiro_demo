package com.demo.shiro_demo.common.exception;

/**
 * @Author Jerry
 * @Description 业务通用自定义异常
 * @Create 23/12/2022 3:16 PM
 */
public class BusinessException extends RuntimeException{

    public BusinessException(String message) {
        super(message);
    }
}
