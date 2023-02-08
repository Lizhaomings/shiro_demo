package com.demo.shiro_demo.common.saft.filter;

import com.google.common.collect.Maps;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import java.util.HashMap;

/**
 * @Author Jerry
 * @Description 防止XSS、SQL注入配置
 * @Create 26/12/2022 11:58 AM
 */
public class XssAndSqlConfig {

    @Bean
    public FilterRegistrationBean xssFilterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new XssAndSqlFilter());
        filterRegistrationBean.setOrder(1);
        filterRegistrationBean.setEnabled(true);
        filterRegistrationBean.addUrlPatterns("/*");
        HashMap<String, String> initParameters = Maps.newHashMap();
        initParameters.put("excludes", "/static/**");
        initParameters.put("isIncludeRichTest", "true");
        filterRegistrationBean.setInitParameters(initParameters);
        return filterRegistrationBean;
    }

}
