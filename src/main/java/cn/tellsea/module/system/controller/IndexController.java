package cn.tellsea.module.system.controller;

import cn.tellsea.frame.common.dto.layuimini.HomeInfo;
import cn.tellsea.frame.common.dto.layuimini.LoginInfo;
import cn.tellsea.module.system.entity.SystemConfig;
import cn.tellsea.module.system.service.ResourceInfoService;
import cn.tellsea.module.system.service.SystemConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Tellsea
 * @date 2021/03/29
 */
@Controller
public class IndexController {

    @Autowired
    private ResourceInfoService resourceInfoService;
    @Autowired
    private SystemConfigService systemConfigService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("systemConfig", systemConfigService.getById(1));
        return "system/index";
    }

    @GetMapping("initData")
    @ResponseBody
    public Map initData() {
        SystemConfig systemConfig = systemConfigService.getById(1);
        Map<String, Object> map = new HashMap<>(16);
        map.put("homeInfo", new HomeInfo().setTitle("首页").setHref("/home"));
        map.put("logoInfo", new LoginInfo()
                .setTitle(systemConfig.getShortName())
                .setImage(systemConfig.getLogo())
                .setHref("/"));
        map.put("menuInfo", resourceInfoService.listAllByMenu());
        return map;
    }

    @GetMapping("home")
    public String home() {
        return "system/home";
    }
}
