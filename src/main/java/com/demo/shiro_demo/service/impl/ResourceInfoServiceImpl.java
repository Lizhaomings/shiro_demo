package com.demo.shiro_demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.common.dto.layuimini.CheckArr;
import com.demo.shiro_demo.common.dto.layuimini.DTree;
import com.demo.shiro_demo.common.dto.layuimini.MenuInfo;
import com.demo.shiro_demo.mapper.ResourceInfoMapper;
import com.demo.shiro_demo.entity.ResourceInfo;
import com.demo.shiro_demo.service.ResourceInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.shiro_demo.vo.ResourceInfoVo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
* 资源表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class ResourceInfoServiceImpl extends ServiceImpl<ResourceInfoMapper, ResourceInfo> implements ResourceInfoService {

    @Override
    public List<ResourceInfoVo> listByTable() {
        return baseMapper.listByTable();
    }

    @Override
    public List<MenuInfo> listAllByMenu() {
        List<ResourceInfo> list = baseMapper.selectList(new LambdaQueryWrapper<ResourceInfo>()
                .orderByAsc(ResourceInfo::getSort).eq(ResourceInfo::getType, 1)
                .eq(ResourceInfo::getIsVisible, 1));
        return treeMenuList(list, 0);
    }

    @Override
    public Map<String, Object> listByDTree() {
        List<ResourceInfo> list = baseMapper.selectList(new LambdaQueryWrapper<ResourceInfo>()
                .orderByAsc(ResourceInfo::getSort));
        return ResponseResult.dTree(dTreeList(list, 0));
    }

    public List<MenuInfo> treeMenuList(List<ResourceInfo> list, int parentId) {
        List<MenuInfo> resultList = new ArrayList<>();
        for (ResourceInfo resList : list) {
            if (resList.getPid().equals(parentId)) {
                resultList.add(new MenuInfo()
                        .setTitle(resList.getName())
                        .setIcon(resList.getIcon())
                        .setHref(resList.getUrl())
                        .setTarget(resList.getTarget())
                        .setChild(treeMenuList(list, resList.getId())));
            }
        }
        return resultList;
    }

    public List<DTree> dTreeList(List<ResourceInfo> list, int parentId) {
        List<DTree> resultList = new ArrayList<>();
        for (ResourceInfo resList : list) {
            if (resList.getPid().equals(parentId)) {
                resultList.add(new DTree()
                        .setId(resList.getId())
                        .setTitle(resList.getName())
                        .setSpread(true)
                        .setParentId(resList.getPid())
                        .setCheckArr(Arrays.asList(new CheckArr().setType(0).setChecked(0)))
                        .setChildren(dTreeList(list, resList.getId())));
            }
        }
        return resultList;
    }
}
