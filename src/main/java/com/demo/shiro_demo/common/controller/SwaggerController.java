package com.demo.shiro_demo.common.controller;

import com.demo.shiro_demo.common.consts.CommonPerms;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Jerry
 * @Description
 * @Create 10/01/2023 3:12 PM
 *
 * 接口文档
 */
@Controller
@RequestMapping("/common/swagger")
public class SwaggerController {

    @RequiresPermissions(CommonPerms.Swagger.VIEW)
    @GetMapping("/init")
    public String init() {
        return "redirect:/doc.html";
    }
}
