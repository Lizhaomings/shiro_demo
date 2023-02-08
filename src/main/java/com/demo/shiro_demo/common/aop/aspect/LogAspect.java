package com.demo.shiro_demo.common.aop.aspect;

import com.alibaba.fastjson.JSON;
import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SessionConst;
import com.demo.shiro_demo.entity.SystemLog;
import com.demo.shiro_demo.entity.UserInfo;
import com.demo.shiro_demo.service.SystemLogService;
import com.demo.shiro_demo.util.AddressUtils;
import com.demo.shiro_demo.util.AopUtils;
import com.demo.shiro_demo.util.ShiroUtils;
import com.demo.shiro_demo.util.SpringContextUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * @Author Jerry
 * @Description 操作日志切面
 * @Create 23/12/2022 3:27 PM
 */
@Slf4j
@Aspect
@Component
@SuppressWarnings("all")
public class LogAspect {

    @Autowired
    private SystemLogService systemLogService;

    @Pointcut("@annotation(com.demo.shiro_demo.common.aop.annotation.Log)")
    public void systemLogAspect(){

    }

    @Around("systemLogAspect()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) {
        Object result = null;
        MethodSignature signature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = signature.getMethod();
        long startTime = System.currentTimeMillis();
        try {
            result = proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
        Map<String, Object> fieldsName = AopUtils.getFieldsName((proceedingJoinPoint));
        fieldsName.remove("request");
        UserInfo userSession = (UserInfo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
        Log annotation = method.getAnnotation(Log.class);
        String ip = AddressUtils.getIpAddr(request);
        SystemLog systemLog = new SystemLog()
                .setUserName(userSession.getName())
                .setOperation(annotation.value())
                .setType(request.getMethod())
                .setTime((int) (System.currentTimeMillis() - startTime))
                .setMethod(String.valueOf(proceedingJoinPoint.getSignature()))
                .setParams(JSON.toJSONString(fieldsName))
                .setIp(ip)
                .setLocation(AddressUtils.getAddress(ip));
        systemLogService.save(systemLog);
        return result;
    }
}
