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
 * 字典数据表 实体类
 *
 * @author Tellsea
 * @date 2021-04-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dict_data")
@ApiModel(value = "DictData对象", description = "")
public class DictData extends BaseEntity {

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "字典类型")
    @TableField("type")
    private String type;

    @ApiModelProperty(value = "字典名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "字典值")
    @TableField("value")
    private String value;

    @ApiModelProperty(value = "备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty(value = "是否启用 1-启用 2-停用")
    @TableField("is_enable")
    private Integer isEnable;

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
