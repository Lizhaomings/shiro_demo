package com.demo.shiro_demo.mapper;

import com.demo.shiro_demo.entity.RoleInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.shiro_demo.vo.RoleInfoVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author Jerry
 * @since 2022-12-23
 */
public interface RoleInfoMapper extends BaseMapper<RoleInfo> {

    int countByTable(@Param("entity") RoleInfoVo entity);

    List<RoleInfoVo> listByTable(@Param("entity") RoleInfoVo entity);

    List<RoleInfo> listByUserId(@Param("userId") Integer userId);

}
