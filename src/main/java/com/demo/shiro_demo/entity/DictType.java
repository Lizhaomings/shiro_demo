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
 * 字典类型表 实体类
 *
 * @author Jerry
 * @date 2022-12-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dict_type")
@ApiModel(value = "DictType对象", description = "")
public class DictType extends BaseEntity {

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "字典名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "字典类型")
    @TableField("type")
    private String type;

    @ApiModelProperty(value = "备注")
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
