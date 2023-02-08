package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.common.aop.annotation.Log;
import com.demo.shiro_demo.common.consts.SystemPerms;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.DictData;
import com.demo.shiro_demo.service.DictDataService;
import com.demo.shiro_demo.service.DictTypeService;
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
 * 字典数据表 控制器
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Controller
@RequestMapping("/dictData")
public class DictDataController {

    @Autowired
    private DictDataService dictDataService;

    @Autowired
    private DictTypeService dictTypeService;

    @RequiresPermissions(SystemPerms.DictDate.VIEW)
    @GetMapping("/init")
    public String init(String type, Model model) {
        model.addAttribute("type", type);
        model.addAttribute("dictTypeList", dictTypeService.list());
        return "system/dict_data/dict_data_list";
    }

    @RequiresPermissions(SystemPerms.DictDate.LIST)
    @PostMapping("/listByTable")
    @ResponseBody
    public ResponseResult listByTable(DictData entity) {
        return dictDataService.listByTable(entity);
    }

    @Log("新增字典数据")
    @ApiOperation("新增字典数据")
    @RequiresPermissions(SystemPerms.DictDate.SAVE)
    @PostMapping("/saveDictData")
    @ResponseBody
    public ResponseResult saveDictData(DictData entity) {
        return dictDataService.saveDictData(entity);
    }

    @Log("修改字典数据")
    @ApiOperation("修改字典数据")
    @RequiresPermissions(SystemPerms.DictDate.UPDATE)
    @PostMapping("/updateDictData")
    @ResponseBody
    public ResponseResult updateDictData(DictData entity) {
        return dictDataService.updateDictData(entity);
    }

    @Log("删除字典数据")
    @ApiOperation("删除字典数据")
    @RequiresPermissions(SystemPerms.DictDate.DELETE)
    @GetMapping("/deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        dictDataService.removeById(id);
        return ResponseResult.success("删除字典数据成功");
    }
}