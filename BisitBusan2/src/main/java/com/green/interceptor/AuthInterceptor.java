package com.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("1");
		
		HttpSession  session = request.getSession();
		System.out.println("session: " + session);
		
		String  requestUrl = request.getRequestURL().toString();
		System.out.println("requestUrl: "+ requestUrl);
		
		if(requestUrl.equals("http://localhost:8080/")) { // 로그인 한 상태
			return true;
		}
	
		
		if(requestUrl.contains("/Write")) {  
			return true;  
		}
		
		if(requestUrl.contains("/loginProcess")) {
			 return true;
		}

		
		  System.out.println("예외해당아님");
		
		
		if(requestUrl.contains("/guest")) { // 게스트로 진행
			return true;
		}
		
		
		Object obj = session.getAttribute("home");
		
		Object objguest = session.getAttribute("thisid");
		
		System.out.println("obj : " + obj );
		if ((obj == null) && (objguest == null)) {
	         // 로그인 되어있지 않고 게스트 입장이 아니라면 /login으로 이동하시오
	         response.sendRedirect("/");
	         System.out.println(" null이므로 home 으로 이동 response: " + response);
	         return false; // 더이상 컨트롤러 요청으로 가지 않도록 false를 반환함
	      } else {
	         return true;
	      }
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}


}











