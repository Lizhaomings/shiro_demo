package com.demo.shiro_demo.vo;

import com.demo.shiro_demo.entity.LoginLog;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
*  Vo类
*
* @author Jerry
* @date 2022-12-23
*/
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class LoginLogVo extends LoginLog {

}
