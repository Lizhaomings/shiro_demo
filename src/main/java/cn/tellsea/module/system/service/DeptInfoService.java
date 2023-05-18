package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.DeptInfo;
import cn.tellsea.module.system.vo.DeptInfoVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 部门表 Service接口
 *
 * @author Tellsea
 * @date 2021-04-06
 */
public interface DeptInfoService extends IService<DeptInfo> {

    List<DeptInfoVo> listByTable(DeptInfoVo entity);

    ResponseResult saveEntity(DeptInfo entity);

    ResponseResult updateEntity(DeptInfo entity);

    Map<String, Object> listByDTree();
}
