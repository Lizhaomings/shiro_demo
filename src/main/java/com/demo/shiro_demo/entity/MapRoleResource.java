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
 * 角色资源关联表 实体类
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_map_role_resource")
@ApiModel(value = "MapRoleResource对象", description = "")
public class MapRoleResource extends BaseEntity {

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "角色ID")
    @TableField("role_id")
    private Integer roleId;

    @ApiModelProperty(value = "菜单/按钮ID")
    @TableField("resource_id")
    private Integer resourceId;
}
