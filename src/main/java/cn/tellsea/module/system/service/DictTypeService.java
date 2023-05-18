package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.DictType;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 字典类型表 Service接口
 *
 * @author Tellsea
 * @date 2021-04-26
 */
public interface DictTypeService extends IService<DictType> {

    ResponseResult listByTable(DictType entity);

    ResponseResult saveEntity(DictType entity);

    ResponseResult updateEntity(DictType entity);

    ResponseResult deleteByType(String type);
}
