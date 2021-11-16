package com.sbs.exam.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sbs.exam.demo.interceptor.BeforeActionInterceptor;

@Configuration
public class MyWebConfig implements WebMvcConfigurer {

	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		InterceptorRegistration interceptroRegistration = registry.addInterceptor(beforeActionInterceptor);
		interceptroRegistration.addPathPatterns("/**").excludePathPatterns("/resource/**");
	}

}