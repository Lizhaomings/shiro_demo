package com.demo.shiro_demo.service.impl;

import com.demo.shiro_demo.common.consts.SessionConst;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.MapUserRole;
import com.demo.shiro_demo.mapper.MapUserRoleMapper;
import com.demo.shiro_demo.mapper.ResourceInfoMapper;
import com.demo.shiro_demo.mapper.RoleInfoMapper;
import com.demo.shiro_demo.mapper.UserInfoMapper;
import com.demo.shiro_demo.entity.UserInfo;
import com.demo.shiro_demo.service.MapUserRoleService;
import com.demo.shiro_demo.service.UserInfoService;
import com.demo.shiro_demo.util.ShiroUtils;
import com.demo.shiro_demo.vo.UserInfoVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.catalina.User;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


/**
* 用户表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

    @Autowired
    private MapUserRoleService mapUserRoleService;

    @Autowired
    private MapUserRoleMapper mapUserRoleMapper;

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Autowired
    private ResourceInfoMapper resourceInfoMapper;

    @Override
    public ResponseResult listByTable(UserInfoVo entity) {
        return ResponseResult.table(baseMapper.countByTable(entity), baseMapper.listByTable(entity));
    }

    @Override
    public ResponseResult saveEntity(UserInfoVo entity) {
        List<UserInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<UserInfo>()
                .eq(UserInfo::getName, entity.getName()));
        if (CollectionUtils.isNotEmpty(existList)) {
            return ResponseResult.error("用户名已存在：" + entity.getName());
        }
        // 密码加密
        entity.setSalt(ShiroUtils.genRandomSalt());
        entity.setPassword(ShiroUtils.genPassword("123456", entity.getSalt()));
        entity.setIsLock(1);
        baseMapper.insert(entity);
        saveBatchMapUserRole(entity);
        return ResponseResult.success("新增用户成功！");
    }

    @Override
    public ResponseResult resetPwd(UserInfoVo entity) {
        if (entity.getId() != null && entity.getId() > 0) {
            List<UserInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<UserInfo>()
                    .eq(UserInfo::getId, entity.getId()));
            if (CollectionUtils.isEmpty(existList)) {
                return ResponseResult.error("用户不存在");
            }
            entity.setSalt(ShiroUtils.genRandomSalt());
            entity.setPassword(ShiroUtils.genPassword("123456", entity.getSalt()));
            return ResponseResult.success("重置成功");
        } else {
            return ResponseResult.success("重置失败，ID不能为空");
        }
    }

    @Override
    public ResponseResult updateEntity(UserInfoVo entity) {
        List<UserInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<UserInfo>()
                .eq(UserInfo::getName, entity.getName()));
        if (CollectionUtils.isNotEmpty(existList) && existList.size() > 1) {
            return ResponseResult.error("数据库存在多个用户名：" + entity.getName());
        } else if (existList.size() == 1 && !existList.get(0).getId().equals(entity.getId())){
            return  ResponseResult.error("用户名已存在：" + entity.getName());
        } else {
            baseMapper.updateById(entity);
            if (StringUtils.isNotEmpty(entity.getRoleIds())) {
                mapUserRoleMapper.delete(new LambdaQueryWrapper<MapUserRole>()
                            .eq(MapUserRole::getUserId, entity.getId()));
                saveBatchMapUserRole(entity);
            }
            return ResponseResult.success("更新成功");
        }
    }

    @Override
    public UserInfoVo getByName(String userName) {
        UserInfoVo userInfoVo = new UserInfoVo();
        UserInfo userInfo = baseMapper.selectOne(new LambdaQueryWrapper<UserInfo>()
                            .eq(UserInfo::getName, userName));
        BeanUtils.copyProperties(userInfo, userInfoVo);
        userInfoVo.setRoleInfoList(roleInfoMapper.listByUserId(userInfo.getId()));
        userInfoVo.setResourceInfoList(resourceInfoMapper.listByUserId(userInfo.getId()));
        return userInfoVo;
    }

    @Override
    public ResponseResult updateInfoOrPwdById(UserInfoVo entity) {
        UserInfoVo userInfo = (UserInfoVo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
        entity.setId(userInfo.getId());
        if ("1".equals(entity.getType())) {
            baseMapper.updateById(entity);
            ShiroUtils.setSessionAttribute(SessionConst.USER_INFO_SESSION, getByName(entity.getName()));
            return ResponseResult.success("更新Info成功");
        } else if ("2".equals(entity.getType())) {
            if (StringUtils.isNotEmpty(entity.getOldPassword()) && StringUtils.isNotEmpty(entity.getPassword())) {
                String oldPassword = ShiroUtils.genPassword(entity.getOldPassword(), userInfo.getSalt());
                if (oldPassword.equals(userInfo.getPassword())) {
                    baseMapper.updateById(new UserInfo().setId(userInfo.getId())
                            .setPassword(ShiroUtils.genPassword(entity.getPassword(), userInfo.getSalt())));
                    return ResponseResult.success("修改成功");
                } else {
                    return ResponseResult.error("旧密码输入错误");
                }
            } else {
                return ResponseResult.error("密码不能为空");
            }
        } else {
            return ResponseResult.error("更新类型不能为空");
        }
    }

    private void saveBatchMapUserRole(UserInfoVo entity) {
        List<MapUserRole> list = new ArrayList<>();
        String[] spilt = entity.getRoleIds().split(",");
        for (int i = 0; i < spilt.length; i++) {
            list.add(new MapUserRole().setUserId(entity.getId()).setRoleId(Integer.valueOf(spilt[i])));
        }
        mapUserRoleService.saveBatch(list, list.size());
    }
}
