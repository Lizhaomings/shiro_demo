package com.demo.shiro_demo.common.aop.aspect;

import com.alibaba.fastjson.JSON;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.LoginLog;
import com.demo.shiro_demo.service.LoginLogService;
import com.demo.shiro_demo.util.AddressUtils;
import com.demo.shiro_demo.util.AopUtils;
import com.demo.shiro_demo.util.SpringContextUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author Jerry
 * @Description 登录日志切面
 * @Create 23/12/2022 3:27 PM
 */
@Slf4j
@Aspect
@Component
@SuppressWarnings("all")
public class LoginLogAspect {

    @Autowired
    private LoginLogService loginLogService;

    @Pointcut("@annotation(com.demo.shiro_demo.common.aop.annotation.LoginLog)")
    public void loginLogAspect() {

    }

    @Around("loginLogAspect()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) {
        Object result = null;
        HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
        LoginLog loginLog = new LoginLog();
        Map<String, Object> fieldsName = AopUtils.getFieldsName((proceedingJoinPoint));
        fieldsName.entrySet().forEach(temp -> {
            if (StringUtils.equals("userName", temp.getKey())) {
                loginLog.setUserName(temp.getValue().toString());
            }
        });
        try {
            result = proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        String ip = AddressUtils.getIpAddr(request);
        loginLog.setIp(ip);
        loginLog.setLocation(AddressUtils.getAddress(ip));
        ResponseResult rr = (ResponseResult) result;
        loginLog.setCode(rr.getCode());
        loginLog.setMessage(JSON.toJSONString(rr));
        String header = request.getHeader("User-Agent");
        UserAgent userAgent = UserAgent.parseUserAgentString(header);
        Browser browser = userAgent.getBrowser();
        OperatingSystem operatingSystem = userAgent.getOperatingSystem();
        loginLog.setDevice(browser.getName() + " -- " + operatingSystem.getName());
        loginLogService.save(loginLog);
        return result;
    }
}
