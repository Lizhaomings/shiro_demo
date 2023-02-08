package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.service.RoleInfoService;
import com.demo.shiro_demo.vo.RoleInfoVo;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 角色表 控制器
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Controller
@RequestMapping("/roleInfo")
public class RoleInfoController {

    @Autowired
    private RoleInfoService roleInfoService;

    @RequiresPermissions(SystemPerms.RoleInfo.VIEW)
    @GetMapping("/init")
    public String init() {
        return "system/role_info/role_info_list";
    }

    @RequiresPermissions(SystemPerms.RoleInfo.LIST)
    @PostMapping("/listByTable")
    @ResponseBody
    public ResponseResult listByTable(RoleInfoVo entity) {
        return roleInfoService.listByTable(entity);
    }

    @RequiresPermissions(SystemPerms.RoleInfo.LIST)
    @GetMapping("/listByAll")
    @ResponseBody
    public ResponseResult listByAll() {
        return ResponseResult.success("查询成功", roleInfoService.list());
    }

    @Log("新增角色")
    @ApiOperation("新增角色")
    @RequiresPermissions(SystemPerms.RoleInfo.SAVE)
    @PostMapping("/save")
    public ResponseResult save(RoleInfoVo entity) {
        return roleInfoService.saveRole(entity);
    }

    @Log("修改角色")
    @ApiOperation("修改角色")
    @RequiresPermissions(SystemPerms.RoleInfo.UPDATE)
    @PostMapping("/updateById")
    @ResponseBody
    public ResponseResult updateById(RoleInfoVo entity) {
        return roleInfoService.updateRole(entity);
    }

    @Log("删除角色")
    @ApiOperation("删除角色")
    @RequiresPermissions(SystemPerms.RoleInfo.DELETE)
    @GetMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        roleInfoService.removeById(id);
        return ResponseResult.success("删除角色成功");
    }
}