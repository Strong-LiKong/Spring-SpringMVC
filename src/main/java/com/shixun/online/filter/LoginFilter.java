package com.shixun.online.filter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;

		// 还需要添加密保问题等找回密码的关键 uri 以及其他白名单
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("resource");
		arrayList.add("login");
		arrayList.add(request.getServletContext().getContextPath()+"/ums");
		arrayList.add("register");
		arrayList.add("toCheckQuestion");
		arrayList.add("checkQuestion");
		arrayList.add("updatePassword");

		String requestURI = httpServletRequest.getRequestURI();
		for (String string : arrayList) {
			if (requestURI.contains(string)) {
				chain.doFilter(request, response);
				return;
			}
		}

		// 判断 session 中是否包含登录的用户信息，如果包含说明已经登录,可以访问
		Object user = httpServletRequest.getSession().getAttribute("currentLoginUser");
		if (user != null) {
			chain.doFilter(request, response);
			return;
		}

		// 重定向到登录页面
		httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/ums");

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
