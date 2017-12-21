package org.zico.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.service.StoreService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/store/*")
public class StoreController {

	@Autowired
	private StoreService ss;
	
	// 매장 전체 목록
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", ss.getList(cri));
		model.addAttribute("total", ss.getListCount(cri));
	}
	
	// 매장 상세 조회
	@GetMapping("/detail")
	public void detail(@RequestParam(name="storeNo") int storeNo, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.detail(storeNo));
	}
	
	// 매장 등록
	@GetMapping("/insert")
	public void insertGet(Criteria cri) {}
	
	@PostMapping("/insertPost")
	public String insertPost(Store store, Criteria cri, RedirectAttributes rttr) {
		ss.create(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/list";
	}
	
	// 매장 수정
	@GetMapping("/update")
	public void updateGet(@RequestParam(name="storeNo") int storeNo, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.detail(storeNo));
	}
	@PostMapping("/updatePost")
	public String updatePost(Store store, Criteria cri, RedirectAttributes rttr) {
		ss.update(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/detail?storeNo=" + store.getStoreNo()
				+ "&page=" + cri.getPage() + "$size=" + cri.getSize();
	}
	
	// 매장 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam(name="storeNo") int storeNo, Criteria cri, RedirectAttributes rttr) {
		ss.remove(storeNo);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/list?page=" + cri.getPage() + "&size=" + cri.getSize();
	}
	
}
