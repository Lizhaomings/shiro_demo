package cn.tellsea.frame.core.aop.aspect;

import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.core.aop.util.AopUtils;
import cn.tellsea.frame.common.consts.SessionConst;
import cn.tellsea.frame.common.util.ShiroUtils;
import cn.tellsea.frame.common.util.AddressUtils;
import cn.tellsea.frame.common.util.SpringContextUtils;
import cn.tellsea.module.system.entity.SystemLog;
import cn.tellsea.module.system.service.SystemLogService;
import cn.tellsea.module.system.vo.UserInfoVo;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
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
 * 操作日志切面
 *
 * @author Tellsea
 * @date 2019/7/18
 */
@Slf4j
@Aspect
@Component
@SuppressWarnings("all")
public class LogAspect {

    @Autowired
    private SystemLogService systemLogService;

    @Pointcut("@annotation(cn.tellsea.frame.common.aop.annotation.Log)")
    public void systemLogAspect() {
    }

    @Around("systemLogAspect()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws JsonProcessingException {
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
        UserInfoVo userSession = (UserInfoVo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
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
