package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.RoleInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.shiro_demo.vo.RoleInfoVo;

/**
* 角色表 Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface RoleInfoService extends IService<RoleInfo> {

    /**
     * 分页查询角色
     * @param entity
     * @return
     */
    ResponseResult listByTable(RoleInfoVo entity);

    /**
     * 新增角色
     * @param entity
     * @return
     */
    ResponseResult saveRole(RoleInfoVo entity);

    /**
     * 修改角色
     * @param entity
     * @return
     */
    ResponseResult updateRole(RoleInfoVo entity);

}
