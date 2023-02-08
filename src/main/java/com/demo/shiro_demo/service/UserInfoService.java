package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.UserInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.shiro_demo.vo.UserInfoVo;

/**
* 用户表 Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface UserInfoService extends IService<UserInfo> {

    ResponseResult listByTable(UserInfoVo entity);

    /**
     * 新增用户
     * @param entity
     * @return
     */
    ResponseResult saveEntity(UserInfoVo entity);

    /**
     * 重置密码
     * @param entity
     * @return
     */
    ResponseResult resetPwd(UserInfoVo entity);

    /**
     * 修改用户信息
     * @param entity
     * @return
     */
    ResponseResult updateEntity(UserInfoVo entity);

    UserInfoVo getByName(String userName);

    /**
     * 修改个人用户信息
     * @param entity
     * @return
     */
    ResponseResult updateInfoOrPwdById(UserInfoVo entity);

}
