package com.demo.shiro_demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.common.dto.layuimini.CheckArr;
import com.demo.shiro_demo.common.dto.layuimini.DTree;
import com.demo.shiro_demo.entity.ResourceInfo;
import com.demo.shiro_demo.mapper.DeptInfoMapper;
import com.demo.shiro_demo.entity.DeptInfo;
import com.demo.shiro_demo.service.DeptInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.shiro_demo.vo.DeptInfoVo;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
* 部门表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class DeptInfoServiceImpl extends ServiceImpl<DeptInfoMapper, DeptInfo> implements DeptInfoService {

    @Override
    public List<DeptInfoVo> listByTable(DeptInfoVo entity) {
        return baseMapper.listByTable(entity);
    }

    @Override
    public Map<String,Object> listByDTree() {
        List<DeptInfo> list = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>().
                orderByAsc(DeptInfo::getSort));
        return ResponseResult.dTree(dTreeList(list,0));
    }

    @Override
    public ResponseResult saveDept(DeptInfo entity) {
        List<DeptInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>()
                .eq(DeptInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(existList)) {
            return ResponseResult.error("部门名称已存在");
        }
        baseMapper.insert(entity);
        return ResponseResult.success("新增部门成功");
    }

    @Override
    public ResponseResult updateDept(DeptInfo entity) {
        List<DeptInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>()
                .eq(DeptInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(existList) && existList.size() > 1) {
            return ResponseResult.error("该部门名称已存在多个: " + entity.getName());
        } else if (existList.size() == 1 && !existList.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("该部门名称不存在： " + entity.getName());
        } else {
            baseMapper.updateById(entity);
        }
        return ResponseResult.success("修改部门成功");
    }

    public List<DTree> dTreeList(List<DeptInfo> list, int parentId) {
        List<DTree> resultList = new ArrayList<>();
        for (DeptInfo deptInfo : list) {
            if (deptInfo.getPid().equals(parentId)) {
                resultList.add(new DTree()
                        .setId(deptInfo.getId())
                        .setTitle(deptInfo.getName())
                        .setSpread(true)
                        .setParentId(deptInfo.getPid())
                        .setCheckArr(Arrays.asList(new CheckArr().setType(0).setChecked(0)))
                        .setChildren(dTreeList(list,deptInfo.getId())));
            }
        }
        return resultList;
    }
}
