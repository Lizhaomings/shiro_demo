package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.LoginLog;
import com.demo.shiro_demo.service.LoginLogService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
*  控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/loginLog")
public class LoginLogController {

    @Autowired
    private LoginLogService loginLogService;

    @ApiOperation("跳转日志")
    @RequiresPermissions(SystemPerms.LoginLog.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/login_log/login_log_list";
    }

    @RequiresPermissions(SystemPerms.LoginLog.LIST)
    @ResponseBody
    @GetMapping("/listByTable")
    public ResponseResult listByTable(LoginLog entity) {
        return loginLogService.listByTable(entity);
    }

    @Log("删除登录日志")
    @ApiOperation("删除登录日志")
    @RequiresPermissions(SystemPerms.LoginLog.DELETE)
    @PostMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        loginLogService.removeById(id);
        return ResponseResult.success("删除日志成功");
    }

    @Log("清空登录日志")
    @ApiOperation("清空登录日志")
    @RequiresPermissions(SystemPerms.LoginLog.CLEAN)
    @PostMapping("/deleteAll")
    @ResponseBody
    public ResponseResult deleteAll() {
        loginLogService.deleteAll();
        return ResponseResult.success("清空日志成功");
    }
}