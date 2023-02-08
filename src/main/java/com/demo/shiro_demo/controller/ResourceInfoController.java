package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.ResourceInfo;
import com.demo.shiro_demo.service.ResourceInfoService;
import com.demo.shiro_demo.vo.ResourceInfoVo;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
* 资源表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("/resourceInfo")
public class ResourceInfoController {

    @Autowired
    private ResourceInfoService resourceInfoService;

    @RequiresPermissions(SystemPerms.ResourceInfo.VIEW)
    @GetMapping("/init")
    public String init() {
        return "system/resource_info/resource_info_list";
    }

    @RequiresPermissions(SystemPerms.ResourceInfo.LIST)
    @GetMapping("/listByTable")
    @ResponseBody
    public ResponseResult listByTable() {
        List<ResourceInfoVo> list = resourceInfoService.listByTable();
        return ResponseResult.table(list.size(), list);
    }

    @RequiresPermissions(SystemPerms.ResourceInfo.LIST)
    @GetMapping("/listByDTree")
    @ResponseBody
    public Map<String, Object> listByDTree() {
        return resourceInfoService.listByDTree();
    }

    @Log("新增资源")
    @ApiOperation("新增资源")
    @RequiresPermissions(SystemPerms.ResourceInfo.SAVE)
    @PostMapping("/save")
    @ResponseBody
    public ResponseResult save(ResourceInfo entity) {
        resourceInfoService.save(entity);
        return ResponseResult.success("新增资源成功");
    }

    @Log("修改资源")
    @ApiOperation("修改资源")
    @RequiresPermissions(SystemPerms.ResourceInfo.UPDATE)
    @PostMapping("/updateById")
    @ResponseBody
    public ResponseResult updateById(ResourceInfo entity) {
        resourceInfoService.updateById(entity);
        return ResponseResult.success("修改资源成功");
    }

    @Log("删除资源")
    @ApiOperation("删除资源")
    @RequiresPermissions(SystemPerms.ResourceInfo.DELETE)
    @GetMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        resourceInfoService.removeById(id);
        return ResponseResult.success("删除资源成功");
    }
}