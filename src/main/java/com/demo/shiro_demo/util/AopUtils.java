package com.demo.shiro_demo.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author Jerry
 * @Description
 * @Create 23/12/2022 3:31 PM
 */
public class AopUtils {

    /**
     * 获取参数列表
     * @return
     */
    public static Map<String, Object> getFieldsName(ProceedingJoinPoint proceedingJoinPoint) {

        Object[] args = proceedingJoinPoint.getArgs();
        DefaultParameterNameDiscoverer pnd = new DefaultParameterNameDiscoverer();
        MethodSignature signature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = signature.getMethod();
        String[] parameterNames = pnd.getParameterNames(method);
        Map<String, Object> paramMap = new HashMap<>(32);
        for (int i = 0; i < parameterNames.length; i++) {
            paramMap.put(parameterNames[i], args[i]);
        }
        return paramMap;
    }
}
