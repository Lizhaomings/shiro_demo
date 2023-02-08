package com.demo.shiro_demo.shiro.service.impl;

import com.demo.shiro_demo.shiro.service.ShiroService;
import com.demo.shiro_demo.util.ShiroUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @Author Jerry
 * @Description shiro service 实现类
 * @Create 26/12/2022 2:07 PM
 *
 * 参考文章：https://blog.csdn.net/batter_hwb/article/details/83792775
 */
@Service("shiro")
@Slf4j
public class ShiroServiceImpl implements ShiroService {


    @Override
    public Boolean isPerms(String permission) {
        return ShiroUtils.getSubject().isPermitted(permission);
    }

    @Override
    public String hasPerms(String permission) {
        return isPerms(permission) ? "" : "hidden";
    }
}
