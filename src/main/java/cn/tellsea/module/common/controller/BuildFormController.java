package cn.tellsea.module.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 构建表单
 *
 * @author Tellsea
 * @date 2021/04/08
 */
@Controller
@RequestMapping("/common/buildForm")
public class BuildFormController {

    @GetMapping("init")
    public String init() {
        return "common/build_form/build_form_init";
    }
}
