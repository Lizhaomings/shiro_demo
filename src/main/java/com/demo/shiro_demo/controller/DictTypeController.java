package com.demo.shiro_demo.controller;

import com.demo.shiro_demo.service.DictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* 字典类型表 控制器
*
* @author Jerry
* @date 2022-12-23
*/
@Controller
@RequestMapping("//dictType")
public class DictTypeController {

    @Autowired
    private DictTypeService dictTypeService;
}