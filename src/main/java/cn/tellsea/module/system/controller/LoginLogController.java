package cn.tellsea.module.system.controller;


import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.LoginLog;
import cn.tellsea.module.system.service.LoginLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
@Controller
@RequestMapping("/system/loginLog")
public class LoginLogController {

    @Autowired
    private LoginLogService loginLogService;

    @RequiresPermissions(SystemPerms.LoginLog.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/login_log/login_log_list";
    }

    @RequiresPermissions(SystemPerms.LoginLog.LIST)
    @PostMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(LoginLog entity) {
        return loginLogService.listByTable(entity);
    }

    @Log("删除登录日志")
    @RequiresPermissions(SystemPerms.LoginLog.DELETE)
    @PostMapping("deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        loginLogService.removeById(id);
        return ResponseResult.success("删除成功");
    }

    @Log("清空登录日志")
    @RequiresPermissions(SystemPerms.LoginLog.CLAEN)
    @GetMapping("deleteAll")
    @ResponseBody
    public ResponseResult deleteAll() {
        loginLogService.deleteAll();
        return ResponseResult.success("清空成功");
    }
}
