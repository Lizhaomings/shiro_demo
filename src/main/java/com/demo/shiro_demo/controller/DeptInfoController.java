package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.DeptInfo;
import com.demo.shiro_demo.service.DeptInfoService;
import com.demo.shiro_demo.vo.DeptInfoVo;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 部门表 控制器
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Controller
@RequestMapping("/deptInfo")
public class DeptInfoController {

    @Autowired
    private DeptInfoService deptInfoService;

    @RequiresPermissions(SystemPerms.DeptInfo.VIEW)
    @GetMapping("/init")
    public String init() {
        return "system/dept_info/deft_info_list";
    }

    @RequiresPermissions(SystemPerms.DeptInfo.LIST)
    @PostMapping("/listByTable")
    @ResponseBody
    public ResponseResult listByTable(DeptInfoVo entity) {
        List<DeptInfoVo> list = deptInfoService.listByTable(entity);
        return ResponseResult.table(list.size(), list);
    }

    @RequiresPermissions(SystemPerms.DeptInfo.LIST)
    @GetMapping("/listByDTree")
    @ResponseBody
    public Map<String,Object> listByDTree() {
        return deptInfoService.listByDTree();
    }

    @Log("新增部门")
    @ApiOperation("新增部门")
    @RequiresPermissions(SystemPerms.DeptInfo.SAVE)
    @PostMapping("/save")
    @ResponseBody
    public ResponseResult save(DeptInfo entity) {
        return deptInfoService.saveDept(entity);
    }

    @Log("修改部门")
    @ApiOperation("修改部门")
    @PostMapping("/updateById")
    @ResponseBody
    public ResponseResult updateDept(DeptInfo entity) {
        return deptInfoService.updateDept(entity);
    }

    @Log("删除部门")
    @ApiOperation("删除部门")
    @GetMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        deptInfoService.removeById(id);
        return ResponseResult.success("删除部门成功");
    }
}