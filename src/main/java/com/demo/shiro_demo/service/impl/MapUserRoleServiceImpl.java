package com.demo.shiro_demo.service.impl;

import com.demo.shiro_demo.mapper.MapUserRoleMapper;
import com.demo.shiro_demo.entity.MapUserRole;
import com.demo.shiro_demo.service.MapUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
* 用户角色关联表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class MapUserRoleServiceImpl extends ServiceImpl<MapUserRoleMapper, MapUserRole> implements MapUserRoleService {

}
