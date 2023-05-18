package cn.tellsea.module.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Tellsea
 * @date 2021/04/13
 */
@Controller
@RequestMapping("/common/jqueryWeUi")
public class JqueryWeUiController {

    @GetMapping("init")
    public String init() {
        return "app/demo/init";
    }
}
