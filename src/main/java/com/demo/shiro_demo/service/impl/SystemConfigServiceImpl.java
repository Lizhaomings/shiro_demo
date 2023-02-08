package com.demo.shiro_demo.service.impl;

import com.demo.shiro_demo.mapper.SystemConfigMapper;
import com.demo.shiro_demo.entity.SystemConfig;
import com.demo.shiro_demo.service.SystemConfigService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
* 系统配置 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class SystemConfigServiceImpl extends ServiceImpl<SystemConfigMapper, SystemConfig> implements SystemConfigService {

}
