package com.demo.shiro_demo.mapper;

import com.demo.shiro_demo.entity.ResourceInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.shiro_demo.vo.ResourceInfoVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 资源表 Mapper 接口
 * </p>
 *
 * @author Jerry
 * @since 2022-12-23
 */
public interface ResourceInfoMapper extends BaseMapper<ResourceInfo> {

    List<ResourceInfo> listByUserId(@Param("userId") Integer userId);

    List<ResourceInfoVo> listByTable();
}
