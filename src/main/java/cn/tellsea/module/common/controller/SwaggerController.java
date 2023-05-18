package cn.tellsea.module.common.controller;

import cn.tellsea.module.common.consts.CommonPerms;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 接口文档
 *
 * @author Tellsea
 * @date 2021/04/06
 */
@Controller
@RequestMapping("/common/swagger")
public class SwaggerController {

    @RequiresPermissions(CommonPerms.Swagger.VIEW)
    @GetMapping("init")
    public String init() {
        return "redirect:/doc.html";
    }

}
