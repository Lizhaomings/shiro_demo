package com.demo.shiro_demo.common.handle;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.common.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.expression.spel.SpelEvaluationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileNotFoundException;

/**
 * @Author Jerry
 * @Description 全局异常处理
 * @Create 23/12/2022 3:17 PM
 */
@Slf4j
@ControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandle {

    @ExceptionHandler(value = AuthorizationException.class)
    public String handleAuthorizationException(AuthorizationException e, Model model) {
        model.addAttribute("code", 403);
        model.addAttribute("msg", "您没有权限访问，请联系管理员");
        log.error("【未授权】{}", e.getMessage());
        return "system/error";
    }

    @ExceptionHandler(value = SpelEvaluationException.class)
    public String handleSpelEvaluationException(SpelEvaluationException e, Model model) {
        model.addAttribute("code", 500);
        model.addAttribute("msg", "【模板解析错误】" + e.getMessage());
        log.error("【模板解析错误】{}", e.getMessage());
        return "system/error";
    }

    @ExceptionHandler(value = FileNotFoundException.class)
    public String handleFileNotFoundException(FileNotFoundException e, Model model) {
        model.addAttribute("code", 404);
        model.addAttribute("msg", e.getMessage());
        log.error("【文件未找到】{}", e.getMessage());
        return "system/error";
    }

    @ExceptionHandler(value = BusinessException.class)
    @ResponseBody
    public ResponseResult handleBusinessException(BusinessException e) {
        return ResponseResult.error(e.getMessage());
    }
}
