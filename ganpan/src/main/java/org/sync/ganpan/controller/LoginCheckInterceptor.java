package org.sync.ganpan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("mvo") == null) {
			String uri = request.getRequestURI();
			System.out.println("핸들러 인터셉서 실행" + uri);
			response.sendRedirect(request.getContextPath() + "/go_etc/bad_access.do");
			return false; // 컨트롤러 가기 전에 걸러준다.
		}
		return true;
	}
}
