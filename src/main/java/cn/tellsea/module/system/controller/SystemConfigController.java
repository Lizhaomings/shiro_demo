package cn.tellsea.module.system.controller;

import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.consts.SessionConst;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.frame.common.util.ShiroUtils;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.SystemConfig;
import cn.tellsea.module.system.service.SystemConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 系统配置 控制器
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Controller
@RequestMapping("/system/systemConfig")
public class SystemConfigController {

    @Autowired
    private SystemConfigService systemConfigService;

    @RequiresPermissions(SystemPerms.SystemConfig.UPDATE_PAGE)
    @GetMapping("updatePage")
    public String updatePage(Model model) {
        model.addAttribute("entity", systemConfigService.getById(1));
        return "system/system_config/system_config_update";
    }

    @Log("更新系统配置")
    @RequiresPermissions(SystemPerms.SystemConfig.UPDATE)
    @PostMapping("updateById")
    @ResponseBody
    public ResponseResult updateById(SystemConfig entity) {
        systemConfigService.updateById(entity);
        ShiroUtils.setSessionAttribute(SessionConst.SYSTEM_CONFIG, entity);
        return ResponseResult.success("更新成功");
    }
}
