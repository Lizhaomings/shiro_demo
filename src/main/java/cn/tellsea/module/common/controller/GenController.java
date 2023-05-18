package cn.tellsea.module.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 代码生成
 *
 * @author Tellsea
 * @date 2021/04/08
 */
@Controller
@RequestMapping("/common/gen")
public class GenController {

    @GetMapping("init")
    public String init() {
        return "common/gen/gen_init";
    }
}
