package cn.tellsea.module.system.service.impl;

import cn.tellsea.module.system.entity.SystemConfig;
import cn.tellsea.module.system.mapper.SystemConfigMapper;
import cn.tellsea.module.system.service.SystemConfigService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 系统配置 Service接口实现类
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Service
public class SystemConfigServiceImpl extends ServiceImpl<SystemConfigMapper, SystemConfig> implements SystemConfigService {

}
