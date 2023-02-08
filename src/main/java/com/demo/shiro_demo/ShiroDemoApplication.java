package com.demo.shiro_demo;

import org.apache.shiro.spring.boot.autoconfigure.ShiroAnnotationProcessorAutoConfiguration;
import org.apache.shiro.spring.boot.autoconfigure.ShiroAutoConfiguration;
import org.apache.shiro.spring.boot.autoconfigure.ShiroBeanAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(exclude = {ShiroAnnotationProcessorAutoConfiguration.class, ShiroAutoConfiguration.class, ShiroBeanAutoConfiguration.class})
public class ShiroDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShiroDemoApplication.class, args);
    }

}
