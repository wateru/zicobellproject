package org.zico.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		model.addAttribute("store", ss.getList(cri));
		model.addAttribute("total", ss.getListCount());
	}
	
	// 매장 상세 조회
	@GetMapping("/detail")
	public void detail(@ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {
		int sno = (int) session.getAttribute("storeno");
		
		model.addAttribute("store", ss.detail(sno));
	}
	
	// 매장 등록
	@GetMapping("/insert")
	public void insertGet(Criteria cri) {}
	
	@PostMapping("/postinsert")
	public String insertPost(Store store, Criteria cri, RedirectAttributes rttr
							, MultipartFile imgFile, Model model, HttpSession session) {
		String uuid = UUID.randomUUID().toString();
		String uploadName = uuid + "_" + imgFile.getOriginalFilename();
		model.addAttribute("uploadName", uploadName);
		
		try {
			OutputStream out = new FileOutputStream("c:\\uploadImage\\" + uploadName);
			FileCopyUtils.copy(imgFile.getInputStream(), out);
			
			if(imgFile.getContentType().startsWith("image")) {
				model.addAttribute("isImage", imgFile.getContentType().startsWith("image"));
				makeThumnail(uploadName);
			}
		} catch(Exception e) {
			log.warning(e.getMessage());
		}
		
		store.setSimage(uploadName);
		store.setSid(session.getAttribute("id").toString());
		
		ss.create(store);
		
		return "redirect:/admin/dashboard";
	}
	
	// 매장 수정
	@GetMapping("/update")
	public void updateGet(@ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {
		int sno = (int) session.getAttribute("storeno");
		
		model.addAttribute("store", ss.detail(sno));
	}
	@PostMapping("/postupdate")
	public String updatePost(Store store, Criteria cri, RedirectAttributes rttr
							, MultipartFile imgFile, Model model, HttpSession session) {
		
		String uuid = UUID.randomUUID().toString();
		String uploadName = uuid + "_" + imgFile.getOriginalFilename();
		model.addAttribute("uploadName", uploadName);
		
		try {
			OutputStream out = new FileOutputStream("c:\\uploadImage\\" + uploadName);
			FileCopyUtils.copy(imgFile.getInputStream(), out);
			
			if(imgFile.getContentType().startsWith("image")) {
				model.addAttribute("isImage", imgFile.getContentType().startsWith("image"));
				makeThumnail(uploadName);
			}
		} catch(Exception e) {
			log.warning(e.getMessage());
		}
		
		store.setSimage(uploadName);
		store.setSid(session.getAttribute("id").toString());
		
		ss.update(store);
		return "redirect:/store/detail";
	}
	
	// 매장 삭제
	@PostMapping("/delete")
	public String delete(Criteria cri, RedirectAttributes rttr, HttpSession session) {
		int sno = (int)session.getAttribute("storeno");
		ss.remove(sno);
		
		session.setAttribute("storeno", "");
		return "redirect:/admin/dashboard";
	}
	
	private String makeThumnail(String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File("c:\\uploadImage\\", fileName));
		
		BufferedImage destImg
			= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 368);
		
		String thumnailName = "c:\\uploadImage\\" + File.separator + "s_" + fileName;
		
		File newFile = new File(thumnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumnailName;
	}
	
	@ResponseBody
	@GetMapping(value="/display", produces="image/jpeg")
	public byte[] display(String name) {
		try {
			FileInputStream in = new FileInputStream("c:\\uploadImage\\" + name);
			ByteArrayOutputStream bas = new ByteArrayOutputStream();
			FileCopyUtils.copy(in, bas);
			
			return bas.toByteArray();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
