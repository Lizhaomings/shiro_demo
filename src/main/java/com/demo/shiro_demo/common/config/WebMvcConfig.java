package com.demo.shiro_demo.common.config;

import com.demo.shiro_demo.util.FileUtils;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @Author Jerry
 * @Description 静态资源配置
 * @Create 23/12/2022 6:15 PM
 */
@Configuration
public class WebMvcConfig  implements WebMvcConfigurer{

    @Bean
    public MappingJackson2HttpMessageConverter jackson2HttpMessageConverter() {
        // json转换器
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        // 对象映射器
        ObjectMapper mapper = new ObjectMapper();
        // 配置规则
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        converter.setObjectMapper(mapper);
        return converter;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(jackson2HttpMessageConverter());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler(FileUtils.ACCESS_PREFIX + "**").addResourceLocations("file:" + FileUtils.UPLOAD_PATH);
    }
}
