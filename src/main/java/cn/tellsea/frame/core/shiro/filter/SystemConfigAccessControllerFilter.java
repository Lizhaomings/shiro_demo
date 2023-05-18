package cn.tellsea.frame.core.shiro.filter;

import cn.tellsea.frame.common.consts.SessionConst;
import cn.tellsea.frame.common.util.ShiroUtils;
import cn.tellsea.module.system.entity.SystemConfig;
import cn.tellsea.module.system.service.SystemConfigService;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @author Tellsea
 * @date 2021/04/18
 */
public class SystemConfigAccessControllerFilter extends AccessControlFilter {

    @Autowired
    private SystemConfigService systemConfigService;

    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        SystemConfig systemConfig = (SystemConfig) ShiroUtils.getSessionAttribute(SessionConst.SYSTEM_CONFIG);
        if (systemConfig == null) {
            ShiroUtils.setSessionAttribute(SessionConst.SYSTEM_CONFIG, systemConfigService.getById(1));
        }
        return true;
    }
}
