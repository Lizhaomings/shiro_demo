package cn.tellsea.frame.core.shiro.service.impl;

import cn.tellsea.frame.core.shiro.service.ShiroService;
import cn.tellsea.frame.common.util.ShiroUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * shiro service 实现类
 *
 * @author: Tellsea
 * @date: 2019/09/05
 * 参考文章：https://blog.csdn.net/batter_hwb/article/details/83792775
 */
@Slf4j
@Service("shiro")
public class ShiroServiceImpl implements ShiroService {

    /**
     * 是否有权限，返回布尔值
     *
     * @param permission
     * @return
     */
    public Boolean isPerms(String permission) {
        return ShiroUtils.getSubject().isPermitted(permission);
    }

    /**
     * 是否有权限，返回是否隐藏
     *
     * @param permission
     * @return
     */
    public String hasPerms(String permission) {
        return isPerms(permission) ? "" : "hidden";
    }
}
