package cn.tellsea.frame.core.aop.aspect;

import cn.tellsea.frame.core.aop.util.AopUtils;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.frame.common.util.AddressUtils;
import cn.tellsea.frame.common.util.SpringContextUtils;
import cn.tellsea.module.system.entity.LoginLog;
import cn.tellsea.module.system.service.LoginLogService;
import com.alibaba.fastjson.JSON;
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
 * 登录日志切面
 *
 * @author Tellsea
 * @date 2019/7/18
 */
@Slf4j
@Aspect
@Component
@SuppressWarnings("all")
public class LoginLogAspect {

    @Autowired
    private LoginLogService loginLogService;

    @Pointcut("@annotation(cn.tellsea.frame.common.aop.annotation.LoginLog)")
    public void loginLogAspect() {
    }

    @Around("loginLogAspect()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws JsonProcessingException {
        Object result = null;
        HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
        LoginLog loginLog = new LoginLog();
        Map<String, Object> fieldsName = AopUtils.getFieldsName(proceedingJoinPoint);
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
