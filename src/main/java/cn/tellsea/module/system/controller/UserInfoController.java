package cn.tellsea.module.system.controller;


import cn.tellsea.frame.common.aop.annotation.Log;
import cn.tellsea.frame.common.consts.SessionConst;
import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.frame.common.util.ShiroUtils;
import cn.tellsea.module.system.consts.SystemPerms;
import cn.tellsea.module.system.service.UserInfoService;
import cn.tellsea.module.system.vo.UserInfoVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author Tellsea
 * @since 2021-03-29
 */
@Controller
@RequestMapping("/system/userInfo")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @RequiresPermissions(SystemPerms.UserInfo.VIEW)
    @GetMapping("init")
    public String init() {
        return "system/user_info/user_info_list";
    }

    @RequiresPermissions(SystemPerms.UserInfo.LIST)
    @PostMapping("listByTable")
    @ResponseBody
    public ResponseResult listByTable(UserInfoVo entity) {
        return userInfoService.listByTable(entity);
    }

    @Log("新增用户")
    @RequiresPermissions(SystemPerms.UserInfo.SAVE)
    @PostMapping("save")
    @ResponseBody
    public ResponseResult save(UserInfoVo entity) {
        return userInfoService.saveEntity(entity);
    }

    @Log("更新用户")
    @RequiresPermissions(SystemPerms.UserInfo.UPDATE)
    @PostMapping("updateById")
    @ResponseBody
    public ResponseResult updateById(UserInfoVo entity) {
        return userInfoService.updateEntity(entity);
    }

    @Log("重置用户密码")
    @RequiresPermissions(SystemPerms.UserInfo.RESET_PWD)
    @PostMapping("resetPwd")
    @ResponseBody
    public ResponseResult resetPwd(UserInfoVo entity) {
        return userInfoService.resetPwd(entity);
    }

    @Log("删除用户")
    @RequiresPermissions(SystemPerms.UserInfo.DELETE)
    @PostMapping("deleteById")
    @ResponseBody
    public ResponseResult deleteById(int id) {
        userInfoService.removeById(id);
        return ResponseResult.success("删除成功");
    }

    @GetMapping("updateSetting")
    public String updateSetting(Model model) {
        UserInfoVo userInfoVo = (UserInfoVo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
        model.addAttribute("userInfoVo", userInfoVo);
        return "system/user_info/user_info_setting";
    }

    @Log("更新个人信息")
    @PostMapping("updateInfoOrPwdById")
    @ResponseBody
    public ResponseResult updateInfoOrPwdById(UserInfoVo entity) {
        return userInfoService.updateInfoOrPwdById(entity);
    }

}
