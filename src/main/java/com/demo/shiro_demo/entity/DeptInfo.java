package com.demo.shiro_demo.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.demo.shiro_demo.common.dto.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 部门表 实体类
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dept_info")
@ApiModel(value = "DeptInfo对象", description = "")
public class DeptInfo extends BaseEntity {

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "父级ID")
    @TableField("pid")
    private Integer pid;

    @ApiModelProperty(value = "用户名")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "描述")
    @TableField("remark")
    private String remark;

    @ApiModelProperty(value = "排序")
    @TableField("sort")
    private Integer sort;

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
