package cn.tellsea.module.system.service.impl;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.frame.common.dto.layuimini.CheckArr;
import cn.tellsea.frame.common.dto.layuimini.DTree;
import cn.tellsea.module.system.entity.DeptInfo;
import cn.tellsea.module.system.mapper.DeptInfoMapper;
import cn.tellsea.module.system.service.DeptInfoService;
import cn.tellsea.module.system.vo.DeptInfoVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 部门表 Service接口实现类
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Service
public class DeptInfoServiceImpl extends ServiceImpl<DeptInfoMapper, DeptInfo> implements DeptInfoService {

    @Override
    public List<DeptInfoVo> listByTable(DeptInfoVo entity) {
        return baseMapper.listByTable(entity);
    }

    @Override
    public ResponseResult saveEntity(DeptInfo entity) {
        List<DeptInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>()
                .eq(DeptInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(existList)) {
            return ResponseResult.error("部门名称已存在：" + entity.getName());
        }
        baseMapper.insert(entity);
        return ResponseResult.success("新增成功");
    }

    @Override
    public ResponseResult updateEntity(DeptInfo entity) {
        List<DeptInfo> existList = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>()
                .eq(DeptInfo::getName, entity.getName()));
        if (!CollectionUtils.isEmpty(existList) && existList.size() > 1) {
            return ResponseResult.error("数据库存在多个部门名称：" + entity.getName());
        } else if (existList.size() == 1 && !existList.get(0).getId().equals(entity.getId())) {
            return ResponseResult.error("部门名称已存在：" + entity.getName());
        } else {
            baseMapper.updateById(entity);
        }
        return ResponseResult.success("更新成功");
    }

    @Override
    public Map<String, Object> listByDTree() {
        List<DeptInfo> list = baseMapper.selectList(new LambdaQueryWrapper<DeptInfo>()
                .orderByAsc(DeptInfo::getSort));
        return ResponseResult.dTree(dTreeList(list, 0));
    }

    public List<DTree> dTreeList(List<DeptInfo> list, int parentId) {
        List<DTree> resultList = new ArrayList<>();
        for (DeptInfo res : list) {
            if (res.getPid().equals(parentId)) {
                resultList.add(new DTree()
                        .setId(res.getId())
                        .setTitle(res.getName())
                        .setSpread(true)
                        .setParentId(res.getPid())
                        .setCheckArr(Arrays.asList(new CheckArr().setType(0).setChecked(0)))
                        .setChildren(dTreeList(list, res.getId())));
            }
        }
        return resultList;
    }
}
