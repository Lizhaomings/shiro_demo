package com.demo.shiro_demo.service.impl;

import com.demo.shiro_demo.mapper.SystemLogMapper;
import com.demo.shiro_demo.entity.SystemLog;
import com.demo.shiro_demo.service.SystemLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
* 系统日志表 Service接口实现类
*
* @author Jerry
* @date 2022-12-23
*/
@Service
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {

}
