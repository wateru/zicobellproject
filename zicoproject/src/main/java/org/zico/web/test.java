package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zico.dto.Criteria;
import org.zico.service.NoticeService;

@Controller
@RequestMapping("/admin/*")
public class test {
	
	@Autowired
	NoticeService nservice;
	
	@GetMapping("/dashboard")
	public void test(Model m) {
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
	
	
	
}
