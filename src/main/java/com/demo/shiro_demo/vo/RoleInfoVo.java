package com.demo.shiro_demo.vo;

import com.demo.shiro_demo.entity.RoleInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 角色表 Vo类
*
* @author Jerry
* @date 2022-12-23
*/
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class RoleInfoVo extends RoleInfo {

    private String resourceIds;
}
