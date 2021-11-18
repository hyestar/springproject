package com.sbs.exam.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.sbs.exam.demo.vo.Rq;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Rq rq = (Rq)request.getAttribute("rq");

		if(!rq.isLogined()) {

			rq.printHistoryBackJs("로그인 후 이용해주세요!");
			//System.out.println("NeedLogin 처리");
			return false;

		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}