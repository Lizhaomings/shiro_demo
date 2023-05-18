package cn.tellsea.frame.core.shiro.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import cn.tellsea.frame.core.shiro.filter.AjaxFilter;
import cn.tellsea.frame.core.shiro.filter.SystemConfigAccessControllerFilter;
import cn.tellsea.frame.core.shiro.realm.ShiroRealm;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro 权限配置
 *
 * @author Tellsea
 * @date 2019/7/13
 * 参考文章：
 * https://blog.csdn.net/qq_34021712/column/info/26947
 * https://www.cnblogs.com/caichaoqi/p/8900677.html
 */
@Slf4j
@Configuration
public class ShiroConfig {

    /**
     * 配置Shiro生命周期处理器
     *
     * @return
     */
    @Bean
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * 配置拦截规则
     *
     * @param securityManager
     * @return
     */
    @Bean
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setLoginUrl("/login");
        shiroFilterFactoryBean.setSuccessUrl("/");
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");
        // 自定义拦截器
        LinkedHashMap<String, Filter> filtersMap = new LinkedHashMap<>();
        filtersMap.put("ajax", new AjaxFilter());
        filtersMap.put("sysConfig", systemConfigAccessControllerFilter());
        shiroFilterFactoryBean.setFilters(filtersMap);

        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/logout", "anon");
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/druid", "anon");
        filterChainDefinitionMap.put("/Captcha.jpg", "anon");
        filterChainDefinitionMap.put("/403", "anon");
        filterChainDefinitionMap.put("/404", "anon");
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/upload/**", "anon");
        filterChainDefinitionMap.put("/monitor/websocket/tailLog", "anon");
        filterChainDefinitionMap.put("/**", "ajax,user,sysConfig");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

        shiroFilterFactoryBean.setSecurityManager(securityManager);
        return shiroFilterFactoryBean;
    }

    /**
     * 配置核心安全事务管理器
     *
     * @return
     */
    @Bean
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //设置自定义realm.
        securityManager.setRealm(getShiroRealm());
        //配置记住我
        securityManager.setRememberMeManager(rememberMeManager());
        return securityManager;
    }

    /**
     * 身份认证realm
     *
     * @return
     */
    @Bean
    public Realm getShiroRealm() {
        ShiroRealm shiroRealm = new ShiroRealm();
        shiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
        return shiroRealm;
    }
    /** ===================================================================================================== 增加redis */


    /**
     * ===================================================================================================== 记住我
     */

    @Bean
    public SystemConfigAccessControllerFilter systemConfigAccessControllerFilter() {
        return new SystemConfigAccessControllerFilter();
    }

    /**
     * cookie对象;会话Cookie模板 ,默认为: JSESSIONID 问题: 与SERVLET容器名冲突,重新定义为sid或rememberMe，自定义
     *
     * @return
     */
    @Bean
    public SimpleCookie rememberMeCookie() {
        // 这个参数是cookie的名称，对应前端的checkbox的name = rememberMe
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        // setcookie的httponly属性如果设为true的话，会增加对xss防护的安全系数。它有以下特点：

        // setcookie()的第七个参数
        // 设为true后，只能通过http访问，javascript无法访问
        // 防止xss读取cookie
        simpleCookie.setHttpOnly(true);
        simpleCookie.setPath("/");
        // <!-- 记住我cookie生效时间30天 ,单位秒;-->
        simpleCookie.setMaxAge(2592000);
        return simpleCookie;
    }

    /** ===================================================================================================== 以下基础配置 */

    /**
     * cookie管理对象;记住我功能,rememberMe管理器
     *
     * @return
     */
    @Bean
    public CookieRememberMeManager rememberMeManager() {
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        // rememberMe cookie加密的密钥 建议每个项目都不一样 默认AES算法 密钥长度(128 256 512 位)
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }

    /**
     * 配置密码比较器
     *
     * @return
     */
    @Bean("credentialsMatcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("MD5");
        hashedCredentialsMatcher.setHashIterations(2);
        return hashedCredentialsMatcher;
    }

    /**
     * 必须（thymeleaf页面使用shiro标签控制按钮是否显示）
     *
     * @return
     */
    @Bean
    public ShiroDialect shiroDialect() {
        return new ShiroDialect();
    }

    /**
     * 开启Shiro的注解(如@RequiresRoles,@RequiresPermissions)
     * 配置以下两个bean(DefaultAdvisorAutoProxyCreator和AuthorizationAttributeSourceAdvisor)即可实现此功能
     *
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator advisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        advisorAutoProxyCreator.setProxyTargetClass(true);
        return advisorAutoProxyCreator;

    }

    /**
     * 开启shiro 注解模式
     *
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
