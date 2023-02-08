package com.demo.shiro_demo.mapper;

import com.demo.shiro_demo.entity.UserInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.shiro_demo.vo.UserInfoVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author Jerry
 * @since 2022-12-23
 */
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    int countByTable(@Param("entity") UserInfoVo entity);

    List<UserInfoVo> listByTable(@Param("entity") UserInfoVo entity);

}
