package cn.tellsea.frame.core.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * swagger 配置
 *
 * @author Tellsea
 * @date 2021/04/22
 */
@Configuration
@EnableSwagger2
@EnableKnife4j
public class SwaggerConfig {

    @Bean("commonApi")
    public Docket commonApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("公共接口")
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("cn.tellsea.module.common.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    @Bean("monitorApi")
    public Docket monitorApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("系统监控")
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("cn.tellsea.module.monitor.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    @Bean("systemApi")
    public Docket systemApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("系统管理")
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("cn.tellsea.module.system.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("接口文档API")
                .contact(new Contact("Tellsea", "https://gitee.com/tellsea/Straw-Shiro", "3210054449@qq.com"))
                .version("1.0.0")
                .description("接口文档API，采用RestFul风格定义接口")
                .build();
    }
}
