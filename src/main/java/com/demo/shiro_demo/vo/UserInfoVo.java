package com.demo.shiro_demo.vo;

import com.demo.shiro_demo.entity.ResourceInfo;
import com.demo.shiro_demo.entity.RoleInfo;
import com.demo.shiro_demo.entity.UserInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
* 用户表 Vo类
*
* @author Jerry
* @date 2022-12-23
*/
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class UserInfoVo extends UserInfo {

    private String type;

    private String roleIds;

    private String roleName;

    private String oldPassword;

    private String deptName;

    private List<RoleInfo> roleInfoList;

    private List<ResourceInfo> resourceInfoList;
}
