package com.demo.shiro_demo.entity;

import com.demo.shiro_demo.common.dto.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 用户表 实体类
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user_info")
@ApiModel(value = "UserInfo对象", description = "")
public class UserInfo extends BaseEntity {

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "部门id")
    @TableField("dept_id")
    private Integer deptId;

    @ApiModelProperty(value = "用户名")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "账户，登录名，不可更改")
    @TableField("nick_name")
    private String nickName;

    @ApiModelProperty(value = "密码")
    @TableField("password")
    private String password;

    @ApiModelProperty(value = "盐值")
    @TableField("salt")
    private String salt;

    @ApiModelProperty(value = "头像")
    @TableField("avatar")
    private String avatar;

    @ApiModelProperty(value = "手机")
    @TableField("phone")
    private String phone;

    @ApiModelProperty(value = "性别 1男 2女")
    @TableField("sex")
    private Integer sex;

    @ApiModelProperty(value = "账号状态 1-正常 2-锁定")
    @TableField("is_lock")
    private Integer isLock;

    @ApiModelProperty(value = "描述")
    @TableField("description")
    private String description;

    @ApiModelProperty(value = "最后登录时间")
    @TableField("last_login_time")
    private Date lastLoginTime;

    @ApiModelProperty(value = "登录次数")
    @TableField("login_times")
    private Integer loginTimes;

    @ApiModelProperty(value = "创建人")
    @TableField(value = "create_user", fill = FieldFill.INSERT)
    private Integer createUser;

    @ApiModelProperty(value = "创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "状态 1-正常 2-删除")
    @TableField(value = "status", fill = FieldFill.INSERT)
    private Integer status;
}
