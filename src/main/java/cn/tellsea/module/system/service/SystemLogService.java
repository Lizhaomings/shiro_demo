package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.SystemLog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 系统日志表 服务类
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
public interface SystemLogService extends IService<SystemLog> {

    ResponseResult listByTable(SystemLog entity);

    void deleteAll();
}
