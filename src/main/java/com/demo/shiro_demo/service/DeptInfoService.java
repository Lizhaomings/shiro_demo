package com.demo.shiro_demo.service;

import com.demo.shiro_demo.common.dto.ResponseResult;
import com.demo.shiro_demo.entity.DeptInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.shiro_demo.vo.DeptInfoVo;

import java.util.List;
import java.util.Map;

/**
* 部门表 Service接口
*
* @author Jerry
* @date 2022-12-23
*/
public interface DeptInfoService extends IService<DeptInfo> {

    List<DeptInfoVo> listByTable(DeptInfoVo entity);

    Map<String,Object> listByDTree();

    /**
     * 新增部门
     * @param entity
     * @return
     */
    ResponseResult saveDept(DeptInfo entity);

    /**
     * 修改部门
     * @param entity
     * @return
     */
    ResponseResult updateDept(DeptInfo entity);
}
