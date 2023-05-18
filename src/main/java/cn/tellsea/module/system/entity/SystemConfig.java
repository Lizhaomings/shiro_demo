package cn.tellsea.module.system.entity;

import cn.tellsea.frame.common.dto.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 系统配置 实体类
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_system_config")
@ApiModel(value = "SystemConfig对象", description = "")
public class SystemConfig extends BaseEntity {

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "系统Logo")
    @TableField("logo")
    private String logo;

    @ApiModelProperty(value = "系统名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "系统简称")
    @TableField("short_name")
    private String shortName;

    @ApiModelProperty(value = "系统简称")
    @TableField("keywords")
    private String keywords;

    @ApiModelProperty(value = "系统描述")
    @TableField("description")
    private String description;

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
