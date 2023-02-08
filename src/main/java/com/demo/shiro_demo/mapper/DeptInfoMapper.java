package com.demo.shiro_demo.mapper;

import com.demo.shiro_demo.entity.DeptInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.shiro_demo.vo.DeptInfoVo;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author Jerry
 * @since 2022-12-23
 */
public interface DeptInfoMapper extends BaseMapper<DeptInfo> {

    List<DeptInfoVo> listByTable(DeptInfoVo entity);
}
