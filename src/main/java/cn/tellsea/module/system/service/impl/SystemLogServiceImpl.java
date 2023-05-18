package cn.tellsea.module.system.service.impl;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.SystemLog;
import cn.tellsea.module.system.mapper.SystemLogMapper;
import cn.tellsea.module.system.service.SystemLogService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统日志表 服务实现类
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
@Service
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {

    @Override
    public ResponseResult listByTable(SystemLog entity) {
        LambdaQueryWrapper<SystemLog> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(entity.getUserName())) {
            wrapper.like(SystemLog::getUserName, entity.getUserName());
        }
        if (StringUtils.isNotEmpty(entity.getOperation())) {
            wrapper.like(SystemLog::getOperation, entity.getOperation());
        }
        if (StringUtils.isNotEmpty(entity.getType())) {
            wrapper.eq(SystemLog::getType, entity.getType());
        }
        if (StringUtils.isNotEmpty(entity.getMethod())) {
            wrapper.eq(SystemLog::getMethod, entity.getMethod());
        }
        if (StringUtils.isNotEmpty(entity.getLocation())) {
            wrapper.like(SystemLog::getLocation, entity.getLocation());
        }
        wrapper.orderByDesc(SystemLog::getCreateTime);
        Page<SystemLog> page = baseMapper.selectPage(new Page<>(entity.getPage(), entity.getLimit()), wrapper);
        return ResponseResult.table((int) page.getTotal(), page.getRecords());
    }

    @Override
    public void deleteAll() {
        baseMapper.delete(new LambdaQueryWrapper<SystemLog>().gt(SystemLog::getId, 0));
    }
}
