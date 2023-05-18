package cn.tellsea.module.system.vo;

import cn.tellsea.module.system.entity.DeptInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author Tellsea
 * @date 2021/04/02
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class DeptInfoVo extends DeptInfo {

    private String pidName;
}
