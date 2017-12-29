package org.zico.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping("/order/list") 
	public void list(){
		
	}
	
	@GetMapping("/order/menulist") 
	public void menulist(){
		
	}
	@GetMapping("/order/mlist") 
	public void mlist(){
		
	}
	@GetMapping("/order/store") 
	public void store(){
		
	}
	
}
