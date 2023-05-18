package cn.tellsea.module.system.service.impl;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.LoginLog;
import cn.tellsea.module.system.mapper.LoginLogMapper;
import cn.tellsea.module.system.service.LoginLogService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

    @Override
    public ResponseResult listByTable(LoginLog entity) {
        LambdaQueryWrapper<LoginLog> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(entity.getUserName())) {
            wrapper.like(LoginLog::getUserName, entity.getUserName());
        }
        if (StringUtils.isNotEmpty(entity.getDevice())) {
            wrapper.like(LoginLog::getDevice, entity.getDevice());
        }
        if (entity.getCode() != null) {
            wrapper.eq(LoginLog::getCode, entity.getCode());
        }
        if (StringUtils.isNotEmpty(entity.getMessage())) {
            wrapper.like(LoginLog::getMessage, entity.getMessage());
        }
        wrapper.orderByDesc(LoginLog::getCreateTime);
        Page<LoginLog> page = baseMapper.selectPage(new Page<>(entity.getPage(), entity.getLimit()), wrapper);
        return ResponseResult.table((int) page.getTotal(), page.getRecords());
    }

    @Override
    public void deleteAll() {
        baseMapper.delete(new LambdaQueryWrapper<LoginLog>().gt(LoginLog::getId, 0));
    }
}
