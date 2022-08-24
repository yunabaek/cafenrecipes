package kr.co.cafenrecipes.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("PRE HANDLER PASS");

		boolean pass = true;

		HttpSession session = request.getSession();
		if (session.getAttribute("loginId") == null) {

			pass = false;

			response.sendRedirect("/cafenrecipes/loginForm");
		}

		return pass;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
		System.out.println("POST HANDLER PASS");
		/*
		 * HttpSession session = request.getSession(); String content = "안녕하세요 "+
		 * session.getAttribute("loginId")+"님 <a href = 'logout'>로그아웃</a> ";
		 * mav.addObject("loginBox",content);
		 */

	}

}
