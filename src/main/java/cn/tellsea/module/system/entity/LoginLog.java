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
 * <p>
 *
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_login_log")
@ApiModel(value = "LoginLog对象", description = "")
public class LoginLog extends BaseEntity {


    @ApiModelProperty(value = "编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户名")
    @TableField("user_name")
    private String userName;

    @ApiModelProperty(value = "IP地址")
    @TableField("ip")
    private String ip;

    @ApiModelProperty(value = "登录地点")
    @TableField("location")
    private String location;

    @ApiModelProperty(value = "登录设备")
    @TableField("device")
    private String device;

    @ApiModelProperty(value = "状态码")
    @TableField("code")
    private Integer code;

    @ApiModelProperty(value = "消息")
    @TableField("message")
    private String message;

    @ApiModelProperty(value = "登录时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "状态 1-正常 2-删除")
    @TableField(value = "status", fill = FieldFill.INSERT)
    private Integer status;
}
