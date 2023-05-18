package cn.tellsea.module.system.controller;


import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.SystemLog;
import cn.tellsea.module.system.service.SystemLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 系统日志表 前端控制器
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
@Controller
@RequestMapping("/system/systemLog")
public class SystemLogController {

    @Autowired
    private SystemLogService systemLogService;

    @RequiresPermissions(SystemPerms.SystemLog.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/system_log/system_log_list";
    }

    @RequiresPermissions(SystemPerms.SystemLog.LIST)
    @PostMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(SystemLog entity) {
        return systemLogService.listByTable(entity);
    }

    @Log("删除操作日志")
    @RequiresPermissions(SystemPerms.SystemLog.DELETE)
    @PostMapping("deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        systemLogService.removeById(id);
        return ResponseResult.success("删除成功");
    }

    @Log("清空操作日志")
    @RequiresPermissions(SystemPerms.SystemLog.CLAEN)
    @GetMapping("deleteAll")
    @ResponseBody
    public ResponseResult deleteAll() {
        systemLogService.deleteAll();
        return ResponseResult.success("清空成功");
    }
}
