package com.sbs.exam.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sbs.exam.demo.interceptor.BeforeActionInterceptor;
import com.sbs.exam.demo.interceptor.NeedLoginInterceptor;

@Configuration
public class MyWebConfig implements WebMvcConfigurer {

	// BeforeActionInterceptor 인터셉터 불러오기
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;
	// needLoginInterceptor 인터셉터 불러오기
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;
	// 인터셉터를 적용하는 메서드
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		InterceptorRegistration interceptroRegistration = registry.addInterceptor(beforeActionInterceptor);
		interceptroRegistration.addPathPatterns("/**").excludePathPatterns("/resource/**");
		
		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/usr/article/doAdd")
		.addPathPatterns("/usr/article/doDelete").addPathPatterns("/usr/article/Modify")
		.addPathPatterns("/usr/article/doModify");
	}
}