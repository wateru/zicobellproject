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
import org.zico.domain.Member;
import org.zico.service.LoginService;
import org.zico.service.MemberService;

@Controller
@RequestMapping("/login/*")
public class MemberController {


	@Autowired
	LoginService loginmapper;
	
	@Autowired
	MemberService memberservice;
	
	@GetMapping("/insertmember")
	public void home1() {
		
	}
	
	@PostMapping("/insertmember")
	public String insertmember(Member member) {
		memberservice.memberinsert(member);
		
		return "/home";
	}
	
	
	
	@PostMapping("/logout")
	public String logoutGet( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("로그아웃");
		
		Object obj = session.getAttribute("id");
		System.out.println("obj"+obj);
		if (obj != null) {
			session.removeAttribute("id");
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
		
		
	
		 return "/home";
	
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
		Integer checkStoreNo = loginmapper.getStoreNo(vo.getMember_id());
		System.out.println("storeno: " + checkStoreNo);
		if(check !=null) {
		model.addAttribute("id",vo.getMember_id());
		System.out.println("아이디 :"+vo.getMember_id());
		model.addAttribute("password",vo.getMember_password());
		model.addAttribute("remember",vo.getRemember());
		//storeno 확인
			if(check != null) {
				model.addAttribute("storeno",checkStoreNo);
			}
			
		 return "/home";
		}
		
		return "/home";
	}
}
