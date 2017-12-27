package org.zico.web;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;
import org.zico.domain.Check;
import org.zico.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {


	@Autowired
	LoginService loginmapper;
	
	
	@GetMapping("/loginpage")
	public void idcehck() {
		System.out.println("이동되냐");
	}
	
	@GetMapping("/final")
	public void fianl() {
		System.out.println("파이널 페이지 ");
	}
	
	@GetMapping("/cookiecheck")
	public void test() {
		
	}
	@GetMapping("/cookiecheck2")
	public void test2() {
		
	}
	@GetMapping("/homepage")
	public void home() {
		
	}
	
	
	
	@PostMapping("/logout")
	public String logoutGet( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("로그아웃");
		
		Object obj = session.getAttribute("loginid2");
		System.out.println("obj"+obj);
		if (obj != null) {
			session.removeAttribute("loginid2");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginid");
			System.out.println("로그아웃2");

			if (loginCookie != null) {
				System.out.println("쿠키삭제");
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				// log.info("삭제 후 쿠키: " + loginCookie.getValue());
				response.addCookie(loginCookie);
			}
		}
		
		
	
		 return "/login/final";
	
	}

	
	@GetMapping("/loginurl")
	public String loginurl(String url,Model model) {
		
		
		model.addAttribute("url", url);
		
		System.out.println("url "+url);
		
		return "/login/checktest";
	}
	
	
	@PostMapping("/idcheck")
	public String loginpost(Check vo ,Model model) {
		System.out.println("아이디체크오나");
		Check check = loginmapper.idcheck(vo);
		
		if(check !=null) {
		model.addAttribute("id",vo.getMember_id());
		System.out.println("아이디 :"+vo.getMember_id());
		model.addAttribute("password",vo.getMember_password());
		model.addAttribute("remember",vo.getRemember());
				 
		 return "/home";
		}
		
		return "/home";
	}
}
