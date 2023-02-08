package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.LoginLog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
*  Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface LoginLogService extends IService<LoginLog> {

    ResponseResult listByTable(LoginLog entity);

    void deleteAll();
}
