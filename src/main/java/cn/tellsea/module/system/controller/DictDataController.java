package cn.tellsea.module.system.controller;

import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.entity.DictData;
import cn.tellsea.module.system.service.DictDataService;
import cn.tellsea.module.system.service.DictTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 字典数据表 控制器
 *
 * @author Tellsea
 * @date 2021-04-09
 */
@Controller
@RequestMapping("/system/dictData")
public class DictDataController {

    @Autowired
    private DictDataService dictDataService;
    @Autowired
    private DictTypeService dictTypeService;

    @RequiresPermissions(SystemPerms.DictData.VIEW)
    @GetMapping("init")
    public String init(String type, Model model) {
        model.addAttribute("type", type);
        model.addAttribute("dictTypeList", dictTypeService.list());
        return "system/dict_data/dict_data_list";
    }

    //    @RequiresPermissions(SystemPerms.DictData.LIST)
    @PostMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(DictData entity) {
        return dictDataService.listByTable(entity);
    }

    @Log("新增字典数据")
//    @RequiresPermissions(SystemPerms.DictData.SAVE)
    @PostMapping("save")
    @ResponseBody
    public ResponseResult save(DictData entity) {
        return dictDataService.saveEntity(entity);
    }

    @Log("更新字典数据")
//    @RequiresPermissions(SystemPerms.DictData.UPDATE)
    @PostMapping("updateById")
    @ResponseBody
    public ResponseResult updateById(DictData entity) {
        return dictDataService.updateEntity(entity);
    }

    @Log("删除字典数据")
//    @RequiresPermissions(SystemPerms.DictData.DELETE)
    @PostMapping("deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        dictDataService.removeById(id);
        return ResponseResult.success("删除成功");
    }
}
