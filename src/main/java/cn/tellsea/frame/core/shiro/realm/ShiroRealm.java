package cn.tellsea.frame.core.shiro.realm;

import cn.tellsea.frame.common.consts.SessionConst;
import cn.tellsea.frame.core.shiro.util.ShiroByteSource;
import cn.tellsea.frame.common.util.ShiroUtils;
import cn.tellsea.module.system.entity.ResourceInfo;
import cn.tellsea.module.system.entity.RoleInfo;
import cn.tellsea.module.system.entity.UserInfo;
import cn.tellsea.module.system.service.ResourceInfoService;
import cn.tellsea.module.system.service.UserInfoService;
import cn.tellsea.module.system.vo.UserInfoVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 认证授权验证域
 *
 * @author Tellsea
 * @date 2019/7/13
 * Shiro 事物失效问题：https://blog.csdn.net/finalcola/article/details/81197584
 */
@Slf4j
public class ShiroRealm extends AuthorizingRealm {

    /**
     * 在Realm中Service声明上加入@Lazy注解，延迟Realm实现中Service对象的初始化时间，
     * 这样就可以保证Service实际初始化的时候会被BeanPostProcessor拦截，创建具有事务功能的代理对象
     */
    @Lazy
    @Autowired
    private UserInfoService userInfoService;
    @Lazy
    @Autowired
    private ResourceInfoService resourceInfoService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        UserInfoVo user = (UserInfoVo) ShiroUtils.getSessionAttribute(SessionConst.USER_INFO_SESSION);
        List<String> roleList = null;
        if (!CollectionUtils.isEmpty(user.getRoleInfoList())) {
            roleList = user.getRoleInfoList().stream().map(RoleInfo::getRole).collect(Collectors.toList());
            info.addRoles(roleList);
        }
        List<String> resList;
        if (roleList.contains("admin")) {
            List<ResourceInfo> list = resourceInfoService.list();
            resList = list.stream()
                    .filter(item -> StringUtils.isNotEmpty(item.getPerms()))
                    .distinct()
                    .map(ResourceInfo::getPerms)
                    .collect(Collectors.toList());
        } else {
            resList = user.getResourceInfoList().stream()
                    .filter(item -> StringUtils.isNotEmpty(item.getPerms()))
                    .distinct()
                    .map(ResourceInfo::getPerms)
                    .collect(Collectors.toList());
        }
        if (!CollectionUtils.isEmpty(resList)) {
            info.addStringPermissions(resList);
        }
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName = (String) token.getPrincipal();
        List<UserInfo> list = userInfoService.list(new LambdaQueryWrapper<UserInfo>()
                .eq(UserInfo::getName, userName));
        if (CollectionUtils.isEmpty(list) || list.size() != 1) {
            throw new UnknownAccountException();
        }
        UserInfo user = list.get(0);
        // 防止泄露，shiro将SimpleAuthenticationInfo的第一个参数存入标签中
        return new SimpleAuthenticationInfo(user, user.getPassword(), new ShiroByteSource(user.getSalt()), getName());
    }

    @Override
    public AuthorizationInfo getAuthorizationInfo(PrincipalCollection principals) {
        // 获得当前用户的信息，底层会从先尝试从缓存中取，若不存在会执行 doGetAuthorizationInfo 方法，并写入缓存中
        return super.getAuthorizationInfo(principals);
    }

    /**
     * 重写方法,清除当前用户的的 授权缓存
     *
     * @param principals
     */
    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    /**
     * 重写方法，清除当前用户的 认证缓存
     *
     * @param principals
     */
    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    /**
     * 自定义方法：清除所有 授权缓存
     */
    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    /**
     * 自定义方法：清除所有 认证缓存
     */
    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    /**
     * 自定义方法：清除所有的  认证缓存  和 授权缓存
     */
    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }
}
