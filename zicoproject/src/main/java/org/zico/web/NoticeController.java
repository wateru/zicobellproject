package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zico.domain.Notice;
import org.zico.dto.Criteria;
import org.zico.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/list/{page}")
	public String list(@PathVariable("page") int pageNum, Model m) {
		Criteria cri = new Criteria(pageNum, 10);
		m.addAttribute("list", service.getList(cri));
		m.addAttribute("total", service.getDetailCount());
		m.addAttribute("criteria", cri);
		return "/notice/list";
	}
	@GetMapping("/list")
	public void list(Model m) {
		Criteria cri = new Criteria();
		m.addAttribute("list", service.getList(cri));
		m.addAttribute("total", service.getDetailCount());
		m.addAttribute("criteria", cri);
	}
	@GetMapping("/delete")
	public String delete(Integer nno) {
		service.remove(nno);
		return "redirect:/notice/list";
	}
	@GetMapping("/detail")
	public void detail(Integer nno, Model m) {
		service.addHits(nno);
		m.addAttribute("detail", service.get(nno));
	}
	@GetMapping("/update")
	/*public void update() {
	}*/
	public void update(Integer nno, Model m) {
		System.out.println(service.get(nno).toString());
		m.addAttribute("update", service.get(nno));
	}
	@PostMapping("/postupdate")
	public String update(Notice notice) {
		service.modify(notice);
		return "redirect:list";
	}
	@GetMapping("/insert")
	public void insert(Integer nno) {
	}
	@PostMapping("/postinsert")
	public String insert(Notice notice) {
		service.add(notice);
		return "redirect:list";
	}
}
