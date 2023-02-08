package com.demo.shiro_demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.MapRoleResource;
import com.demo.shiro_demo.mapper.MapRoleResourceMapper;
import com.demo.shiro_demo.mapper.RoleInfoMapper;
import com.demo.shiro_demo.entity.RoleInfo;
import com.demo.shiro_demo.service.MapRoleResourceService;
import com.demo.shiro_demo.service.RoleInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.shiro_demo.vo.RoleInfoVo;
import com.google.common.base.Joiner;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
* 角色表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class RoleInfoServiceImpl extends ServiceImpl<RoleInfoMapper, RoleInfo> implements RoleInfoService {

    @Autowired
    private MapRoleResourceService mapRoleResourceService;

    @Resource
    private MapRoleResourceMapper mapRoleResourceMapper;

    @Override
    public ResponseResult listByTable(RoleInfoVo entity) {
        List<RoleInfoVo> list = baseMapper.listByTable(entity);
        list.forEach(item -> {
            List<MapRoleResource> mapRoleResources = mapRoleResourceMapper.selectList(
                    new LambdaQueryWrapper<MapRoleResource>().eq(MapRoleResource::getRoleId, item.getId()));
            List<Integer> resourceIds = mapRoleResources.stream().map(MapRoleResource::getResourceId).collect(Collectors.toList());
            item.setResourceIds(Joiner.on(",").join(resourceIds));
        });
        return ResponseResult.table(baseMapper.countByTable(entity), list);
    }

    @Override
    public ResponseResult saveRole(RoleInfoVo entity) {
        List<RoleInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<RoleInfo>()
                .eq(RoleInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(existList)) {
            return ResponseResult.error("角色名称已存在");
        }
        baseMapper.insert(entity);
        saveBatchMapRoleResource(entity);
        return ResponseResult.success("新增角色成功");
    }

    @Override
    public ResponseResult updateRole(RoleInfoVo entity) {
        List<RoleInfo> selectList = baseMapper.selectList(new LambdaQueryWrapper<RoleInfo>()
                .eq(RoleInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(selectList) && selectList.size() > 1) {
            return ResponseResult.error("数据库存在多个相同的角色名称");
        } else if (selectList.size() == 1 && !selectList.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("角色名称不存在");
        } else {
            baseMapper.updateById(entity);
            mapRoleResourceMapper.delete(new LambdaQueryWrapper<MapRoleResource>()
                    .eq(MapRoleResource::getRoleId, entity.getId()));
            saveBatchMapRoleResource(entity);
        }
        return ResponseResult.success("修改角色成功");
    }

    private void saveBatchMapRoleResource(RoleInfoVo entity) {
        if (StringUtils.isEmpty(entity.getResourceIds())) {
            List<MapRoleResource> list = new ArrayList<>();
            String[] spilt = entity.getResourceIds().split(",");
            for (int i = 0; i < spilt.length; i++) {
                list.add(new MapRoleResource().setRoleId(entity.getId()).setResourceId(Integer.valueOf(spilt[i])));
            }
            mapRoleResourceService.saveBatch(list, list.size());
        }
    }
}
