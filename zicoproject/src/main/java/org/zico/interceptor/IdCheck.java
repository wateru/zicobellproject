package org.zico.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class IdCheck extends HandlerInterceptorAdapter {

	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
		System.out.println("인터셉터넘어오나");
		
		Object obj  = modelAndView.getModel().get("id");
		Object obj2 = modelAndView.getModel().get("password");
		Object obj3 = modelAndView.getModel().get("storeno");
		Object obj4 = modelAndView.getModel().get("grade");
		if(obj == null) {
			response.sendRedirect("/home?status=fail");
			return;
		}
		response.sendRedirect("/home");
		HttpSession session =  request.getSession();
		session.setAttribute("id", obj);
		session.setAttribute("grade", obj4);
		if(obj3 != null) {
			session.setAttribute("storeno", obj3);
		}
	try { // tryCatch 안해주면 remember없이 로그인시 500에러뜸
		Boolean remember = (Boolean) modelAndView.getModel().get("remember");
		if (remember) {
			Cookie loginCookie = new Cookie("loginid", (String)obj); // 쿠키에는 문자열만 가능
			//	Cookie nicknameCookie = new Cookie("nickname", obj2.toString()); // 쿠키에는 문자열만 가능
			loginCookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
			loginCookie.setPath("/");
		//	nicknameCookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
		//	nicknameCookie.setPath("/");
			response.addCookie(loginCookie);
		//	response.addCookie(nicknameCookie);
			
			System.out.println("쎄션 "+session.getAttribute("loginid2"));
			System.out.println("쿠키 "+loginCookie.getValue());
			
		}
	} catch (Exception e) {
	}
		
		}
	
	}
	

