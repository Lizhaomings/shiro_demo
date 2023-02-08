package com.demo.shiro_demo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 3:11 PM
 *
 * 代码生成
 */
@Controller
@RequestMapping("/common/gen")
public class GenController {

    @GetMapping("/init")
    public String init() {
        return "common/gen/gen_init";
    }
}
