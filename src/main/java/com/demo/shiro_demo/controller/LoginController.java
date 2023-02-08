package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.LoginLog;
import com.demo.shiro_demo.common.consts.SessionConst;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.service.SystemConfigService;
import com.demo.shiro_demo.service.UserInfoService;
import com.demo.shiro_demo.util.ShiroUtils;
import io.swagger.annotations.ApiOperation;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.Date;

/**
 * 登录控制器
 *
 * @Author Jerry
 * @Description
 * @Create 16/01/2023 2:11 PM
 */
@Slf4j
@Controller
public class LoginController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private SystemConfigService systemConfigService;

    @ApiOperation("跳转登录页")
    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("systemConfig", systemConfigService.getById(1));
        return "system/login";
    }

    @ApiOperation("登录")
    @PostMapping("/login")
    @ResponseBody
    @LoginLog
    public ResponseResult login(@RequestParam("userName") String userName,
                                @RequestParam("password") String password,
                                @RequestParam(value = "rememberMe", required = false) boolean rememberMe,
                                @RequestParam("captcha") String captcha,
                                HttpServletRequest request) {
        // 校验验证码
        String sessionCaptcha = (String) ShiroUtils.getSessionAttribute(SessionConst.KEY_CAPTCHA);
        if (captcha == null || !captcha.equalsIgnoreCase(sessionCaptcha)) {
            return ResponseResult.error("验证码错误！");
        }

        UsernamePasswordToken token = new UsernamePasswordToken(userName, password, rememberMe);
        // 获取当前subject
        Subject subject = SecurityUtils.getSubject();

        // 执行登录
        subject.login(token);
        log.info("登陆成功：{}", userName);
        return ResponseResult.success("登陆成功");

    }
}
