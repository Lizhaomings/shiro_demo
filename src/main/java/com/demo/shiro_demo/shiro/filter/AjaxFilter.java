package com.demo.shiro_demo.shiro.filter;

import cn.hutool.json.JSONUtil;
import com.demo.shiro_demo.common.dto.ResponseResult;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.UserFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @Author Jerry
 * @Description
 * @Create 26/12/2022 2:25 PM
 */
@Log4j2
public class AjaxFilter extends UserFilter {

    /**
     * 判断用户没有登录的时候发出需要权限的请求会跳转到这个方法
     *
     */
    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
       HttpServletRequest servletRequest = (HttpServletRequest) request;
       //判断是否是AJAX 请求
       String header = servletRequest.getHeader("X-Requested-With");
       if (header != null && "XMLHttpRequest".equals(header)) {
           log.info("-------------------这是一个ajax请求-----------------");
           //判断是否登录
           boolean authenticated = SecurityUtils.getSubject().isAuthenticated();
           if(!authenticated) {
               //这个方法设置发送到客户端的响应的内容类型，此时响应还没有提交,给出的内容类型可以包括字符编码说明。
               response.setContentType("application/json;charset=UTF-8");
               response.getWriter().print(JSONUtil.toJsonStr(ResponseResult.error("登录过期，请重新登录")));
           }
       }else {
           // Web 请求重定向到登录页面
           super.redirectToLogin(request, response);
       }
    }
}
