package cn.tellsea.module.system.vo;

import cn.tellsea.module.system.entity.SystemConfig;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 系统配置 Vo类
 *
 * @author Tellsea
 * @date 2021-04-06
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class SystemConfigVo extends SystemConfig {

}
