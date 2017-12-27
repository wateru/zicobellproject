package org.zico.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import org.zico.util.MediaUtils;
import org.zico.util.UploadFileUtils;

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
		model.addAttribute("total", ss.getListCount());
	}
	
	// 매장 상세 조회
	@GetMapping("/detail")
	public void detail(@RequestParam(name="sno") int sno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.detail(sno));
	}
	
	// 매장 등록
	@GetMapping("/insert")
	public void insertGet(Criteria cri) {}
	
	@PostMapping("/postinsert")
	public String insertPost(Store store, Criteria cri, RedirectAttributes rttr) {
		
		System.out.println(store.toString());
		ss.create(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/list";
	}
	
	// 매장 수정
	@GetMapping("/update")
	public void updateGet(@RequestParam(name="sno") int sno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("store", ss.detail(sno));
	}
	@PostMapping("/postupdate")
	public String updatePost(Store store, Criteria cri, RedirectAttributes rttr) {
		ss.update(store);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/detail?sno=" + store.getSno()
				+ "&page=" + cri.getPage() + "$size=" + cri.getSize();
	}
	
	// 매장 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam(name="sno") int sno, Criteria cri, RedirectAttributes rttr) {
		ss.remove(sno);
		
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/store/list?page=" + cri.getPage() + "&size=" + cri.getSize();
	}
	
	// 파일(이미지) 업로드
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@PostMapping(value="/uploadAjax", produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, Model model) throws Exception {
		
		return new ResponseEntity<> (
				UploadFileUtils.uploadFile(
						uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}
			else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""
							+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]> (
						IOUtils.toByteArray(in),
						headers, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]> (HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String start = fileName.substring(0, 12);
			String end = fileName.substring(14);
			
			new File(uploadPath + (start + end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String> ("deleted", HttpStatus.OK);
	}
	
}
