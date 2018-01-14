package org.zico.web;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zico.dto.Criteria;
import org.zico.service.NoticeService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	NoticeService nservice;
	
	@GetMapping("/dashboard")
	public void test(Model m, HttpSession session) {
		System.out.println(session.getAttribute("storeno"));
		Criteria cri = new Criteria();
		m.addAttribute("list", nservice.getList(cri));
	};
	@GetMapping("/icons")
	public void icons() {
		
	};
	@GetMapping("/maps")
	public void maps() {
		
	};
	@GetMapping("/notifications")
	public void notifications() {
		
	};
	@GetMapping("/table")
	public void table() {
		
	};
	@GetMapping("/template")
	public void template() {
		
	};
	@GetMapping("/typography")
	public void typography() {
		
	};
	@GetMapping("/upgrade")
	public void upgrade() {
		
	};
	@GetMapping("/user")
	public void user() {
		
	};
	@GetMapping("/order")
	public void order() {
		
	};
	@GetMapping("/speech")
	public void speech() {
		
	};
	
	
	
}
