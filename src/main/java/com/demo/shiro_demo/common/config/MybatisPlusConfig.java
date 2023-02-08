package com.demo.shiro_demo.common.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Author Jerry
 * @Description Mybatis plus 配置
 * @Create 23/12/2022 6:14 PM
 */
@Configuration
@MapperScan("com.demo.shiro_demo.*.mapper")
public class MybatisPlusConfig {

    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }
}
