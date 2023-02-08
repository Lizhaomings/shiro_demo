package com.demo.shiro_demo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 3:12 PM
 */
@Controller
@RequestMapping("/common/jqueryWeUi")
public class JqueryWeUiController {

    @GetMapping("/init")
    public String init() {
        return "app/demo/init";
    }
}
