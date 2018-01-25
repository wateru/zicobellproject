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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
import org.zico.domain.Check;
import org.zico.domain.Member;
import org.zico.service.LoginService;
import org.zico.service.MemberService;
import org.zico.service.StoreService;

@Controller
@RequestMapping("/member/*")
public class MemberController {


	@Autowired
	LoginService loginmapper;
	
	@Autowired
	StoreService storeservice;
	
	@Autowired
	MemberService memberservice;
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String insert(Member member) {
		System.out.println(member.getMname());
		System.out.println(member.getMid());
		System.out.println(member.getMquestion());
		System.out.println(member.getMqpassword());
		
		memberservice.memberinsert(member);
		
		return "/home";
	}
	
	
	
	@PostMapping("/logout")
	public String logout( HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("로그아웃");
		
		Object obj = session.getAttribute("id");
		System.out.println("obj"+obj);
		if (obj != null) {
			session.removeAttribute("id");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "id");
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


	@PostMapping("/login")
	public String login(Check vo ,Model model) {
		System.out.println("아이디체크오나");
		Check check = loginmapper.idcheck(vo);
		Integer checkStoreNo = loginmapper.getStoreNo(vo.getMember_id());
		Integer checkGrade = loginmapper.getGrade(vo.getMember_id());
		
		
		if(check !=null) {
		model.addAttribute("id",vo.getMember_id());
		model.addAttribute("password",vo.getMember_password());
		model.addAttribute("remember",vo.getRemember());
		model.addAttribute("grade",checkGrade);
		//storeno 확인
			if(checkStoreNo != null) {
				model.addAttribute("storeno",checkStoreNo);
				model.addAttribute("storename",storeservice.detail(checkStoreNo).getSname());
			}
			
		 return "/home";
		}
		return "/home";
	}
	
	@GetMapping("/mypage")
	public void mypage(Model m,HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member=memberservice.mypage(id);
		m.addAttribute("member",member);
	}
	
	@GetMapping("/duplicatecheck")
	@ResponseBody
	public Integer duplicatecheck(@RequestParam(value="id") String id) {
		return memberservice.getId(id);
	}
}
