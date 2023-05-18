package cn.tellsea.module.system.controller;

import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.DictType;
import cn.tellsea.module.system.service.DictTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 字典类型表 控制器
 *
 * @author Tellsea
 * @date 2021-04-26
 */
@Controller
@RequestMapping("/system/dictType")
public class DictTypeController {

    @Autowired
    private DictTypeService dictTypeService;

    @RequiresPermissions(SystemPerms.DictType.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/dict_type/dict_type_list";
    }

    @RequiresPermissions(SystemPerms.DictType.LIST)
    @PostMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(DictType entity) {
        return dictTypeService.listByTable(entity);
    }

    @Log("新增字典类型")
    @RequiresPermissions(SystemPerms.DictType.SAVE)
    @PostMapping("save")
    @ResponseBody
    public ResponseResult save(DictType entity) {
        return dictTypeService.saveEntity(entity);
    }

    @Log("更新字典类型")
    @RequiresPermissions(SystemPerms.DictType.UPDATE)
    @PostMapping("updateById")
    @ResponseBody
    public ResponseResult updateById(DictType entity) {
        return dictTypeService.updateEntity(entity);
    }

    @Log("删除字典类型")
    @RequiresPermissions(SystemPerms.DictType.DELETE)
    @PostMapping("deleteByType")
    @ResponseBody
    public ResponseResult deleteByType(String type) {
        return dictTypeService.deleteByType(type);
    }
}
