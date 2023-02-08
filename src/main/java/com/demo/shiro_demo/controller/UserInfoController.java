package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SessionConst;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.service.UserInfoService;
import com.demo.shiro_demo.util.ShiroUtils;
import com.demo.shiro_demo.vo.UserInfoVo;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* 用户表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/system/userInfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @RequiresPermissions(SystemPerms.UserInfo.VIEW)
    @GetMapping("/init")
    public String init() {
        return "system/user_info/user_info_init";
    }

    @RequiresPermissions(SystemPerms.UserInfo.LIST)
    @PostMapping("/list")
    @ResponseBody
    public ResponseResult listByTable(UserInfoVo entity) {
        return userInfoService.listByTable(entity);
    }

    @Log("新增用户")
    @ApiOperation("新增用户")
    @RequiresPermissions(SystemPerms.UserInfo.SAVE)
    @PostMapping("/save")
    @ResponseBody
    public ResponseResult save(UserInfoVo entity) {
        return userInfoService.saveEntity(entity);
    }

    @Log("更新用户")
    @ApiOperation("更新用户")
    @RequiresPermissions(SystemPerms.UserInfo.UPDATE)
    @PostMapping("/updateById")
    @ResponseBody
    public ResponseResult updateById(UserInfoVo entity) {
        return userInfoService.updateEntity(entity);
    }

    @Log("重置密码")
    @ApiOperation("重置密码")
    @RequiresPermissions(SystemPerms.UserInfo.RESET_PWD)
    @PostMapping("/resetPwd")
    @ResponseBody
    public ResponseResult resetPwd(UserInfoVo entity) {
        return userInfoService.resetPwd(entity);
    }

    @Log("删除用户")
    @ApiOperation("删除用户")
    @RequiresPermissions(SystemPerms.UserInfo.DELETE)
    @PostMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        userInfoService.removeById(id);
        return ResponseResult.success("删除成功");
    }

    @Log("更新设置信息")
    @ApiOperation("更新设置信息")
    @GetMapping("/updateSetting")
    public String updateSetting(Model model) {
        UserInfoVo userInfoVo = (UserInfoVo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
        model.addAttribute("userInfoVo", userInfoVo);
        return "system/user_info/user_info_setting";
    }

    @Log("更新个人信息")
    @ApiOperation("更新个人信息")
    @PostMapping("/updateInfoOrPwdById")
    @ResponseBody
    public ResponseResult updateInfoOrPwdById(UserInfoVo entity) {
        return userInfoService.updateInfoOrPwdById(entity);
    }
}