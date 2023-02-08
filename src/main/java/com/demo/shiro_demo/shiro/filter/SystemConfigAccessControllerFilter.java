package com.demo.shiro_demo.shiro.filter;

import com.demo.shiro_demo.common.consts.SessionConst;
import com.demo.shiro_demo.entity.SystemConfig;
import com.demo.shiro_demo.service.SystemConfigService;
import com.demo.shiro_demo.util.ShiroUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @Author Jerry
 * @Description
 * @Create 26/12/2022 2:26 PM
 */
public class SystemConfigAccessControllerFilter extends AccessControlFilter {

    @Autowired
    private SystemConfigService systemConfigService;

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        SystemConfig systemConfig = (SystemConfig) ShiroUtils.getSessionAttribute(SessionConst.SYSTEM_CONFIG);
        if (systemConfig == null) {
            ShiroUtils.setSessionAttribute(SessionConst.SYSTEM_CONFIG, systemConfigService.getById(1));
        }
        return true;
    }
}
