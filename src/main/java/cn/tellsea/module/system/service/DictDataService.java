package cn.tellsea.module.system.service;

import cn.tellsea.frame.common.dto.ResponseResult;
import cn.tellsea.module.system.entity.DictData;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 字典数据表 Service接口
 *
 * @author Tellsea
 * @date 2021-04-09
 */
public interface DictDataService extends IService<DictData> {

    ResponseResult listByTable(DictData entity);

    ResponseResult saveEntity(DictData entity);

    ResponseResult updateEntity(DictData entity);
}
