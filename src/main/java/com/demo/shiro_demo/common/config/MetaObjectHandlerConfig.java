package com.demo.shiro_demo.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Configuration;

import java.util.Date;

/**
 * @Author Jerry
 * @Description 元对象处理器 配置
 *  对象字段自动填充
 * @Create 23/12/2022 6:14 PM
 */
@Configuration
public class MetaObjectHandlerConfig implements MetaObjectHandler{

    @Override
    public void insertFill(MetaObject metaObject) {
        setFieldValByName("createUser", 1, metaObject);
        setFieldValByName("createTime", new Date(), metaObject);
        setFieldValByName("status", 1, metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {

    }
}
