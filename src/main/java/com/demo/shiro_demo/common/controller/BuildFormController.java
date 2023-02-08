package com.demo.shiro_demo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 3:11 PM
 *
 * 构建表单
 */
@Controller
@RequestMapping("/common/buildForm")
public class BuildFormController {

    @GetMapping("/init")
    public String init() {
        return "common/build_form/build_form_init";
    }
}
