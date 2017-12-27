package org.zico.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@GetMapping("/home")
	public void home(String status, Model m) {
		m.addAttribute("loginstatus", status);
	}
	
}
