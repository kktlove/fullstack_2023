package com.edutech.config;

import jakarta.persistence.EntityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.extras.springsecurity6.dialect.SpringSecurityDialect;

@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //MainController 에서 @GetMapping("/")으로 설정하는 방법도 있지만,
        //WebMvcConfigurer 에서 addViewControllers 메소드에서 해당 뷰를 정할 수 있는 방법이 있음. 둘 중에 하나만 활용바람.
        registry.addViewController("/").setViewName("index");
    }


    //SpringSecurityDialect는 ThymeLeaf 에서 Spring Security를 활용하기 위한 내용을 설정할 수 있음.
    @Bean
    public SpringSecurityDialect securityDialect(){
        return new SpringSecurityDialect();
    }

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedOrigins("http://localhost:5500", "http://localhost:8086");
            }
        };
    }
}
