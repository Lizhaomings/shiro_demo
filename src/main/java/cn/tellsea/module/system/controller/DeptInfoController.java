package cn.tellsea.module.system.controller;

import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.DeptInfo;
import cn.tellsea.module.system.service.DeptInfoService;
import cn.tellsea.module.system.vo.DeptInfoVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 部门表 控制器
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Controller
@RequestMapping("/system/deptInfo")
public class DeptInfoController {

    @Autowired
    private DeptInfoService deptInfoService;

    @RequiresPermissions(SystemPerms.DeptInfo.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/dept_info/dept_info_list";
    }

    @RequiresPermissions(SystemPerms.DeptInfo.LIST)
    @GetMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(DeptInfoVo entity) {
        List<DeptInfoVo> list = deptInfoService.listByTable(entity);
        return ResponseResult.table(list.size(), list);
    }

    @RequiresPermissions(SystemPerms.DeptInfo.LIST)
    @PostMapping("listByDTree")
    @ResponseBody
    public Map<String, Object> listByDTree() {
        return deptInfoService.listByDTree();
    }

    @Log("新增用户")
    @RequiresPermissions(SystemPerms.DeptInfo.SAVE)
    @PostMapping("save")
    @ResponseBody
    public ResponseResult save(DeptInfo entity) {
        return deptInfoService.saveEntity(entity);
    }

    @Log("更新用户")
    @RequiresPermissions(SystemPerms.DeptInfo.UPDATE)
    @PostMapping("updateById")
    @ResponseBody
    public ResponseResult updateById(DeptInfo entity) {
        return deptInfoService.updateEntity(entity);
    }

    @Log("删除用户")
    @RequiresPermissions(SystemPerms.DeptInfo.DELETE)
    @PostMapping("deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        deptInfoService.removeById(id);
        return ResponseResult.success("删除成功");
    }
}
