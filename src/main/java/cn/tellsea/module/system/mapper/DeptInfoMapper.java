package cn.tellsea.module.system.mapper;

import cn.tellsea.module.system.entity.DeptInfo;
import cn.tellsea.module.system.vo.DeptInfoVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author Tellsea
 * @since 2021-04-06
 */
public interface DeptInfoMapper extends BaseMapper<DeptInfo> {

    List<DeptInfoVo> listByTable(@Param("entity") DeptInfoVo entity);
}
