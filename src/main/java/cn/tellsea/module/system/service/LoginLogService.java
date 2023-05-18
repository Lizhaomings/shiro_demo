package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.LoginLog;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-05
 */
public interface LoginLogService extends IService<LoginLog> {

    ResponseResult listByTable(LoginLog entity);

    void deleteAll();
}
