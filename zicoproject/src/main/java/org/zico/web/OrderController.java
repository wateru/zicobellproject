package org.zico.web;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zico.dto.Criteria;
import org.zico.service.OrderService;
import org.zico.util.MediaUtils;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@GetMapping("/order/list") 
	public void list(){
		
	}
	
	@GetMapping("/order/menulist") 
	public void menulist(){
		
	}
	@GetMapping("/order/test") 
	public void test(){
		
	}
	@GetMapping("/order/pay") 
	public void pay(){
		
	}
	@GetMapping("/order/paytest") 
	public void paytest(){
		
	}
	@GetMapping("/order/mlist") 
	public void mlist(Criteria cri, Model model,@RequestParam(name="sno")int storeNo){
		cri.setStoreNo(storeNo);
		System.out.println("컨트롤러들어옴");
		System.out.println(cri.getStoreNo() +" 넣어줌");
		System.out.println("매장번호 넣어줌");
		model.addAttribute("menu", service.getMenuList(cri));
	}
	
	@GetMapping("/order/store") 
	public void store(Criteria cri, Model model){
		model.addAttribute("store", service.getList(cri));
		model.addAttribute("total", service.getListCount());
	}
	
	
	   @Resource(name = "uploadPath")
	   private String uploadPath;
	  
	   
	   @ResponseBody
	   @RequestMapping("/order/displayFile")
	   public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{

	      InputStream in = null; 
	      ResponseEntity<byte[]> entity = null;

	      log.info("uploadPath : " + uploadPath);
	      log.info("FILE NAME: " + fileName);

	      try{

	         String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

	         MediaType mType = MediaUtils.getMediaType(formatName);

	         HttpHeaders headers = new HttpHeaders();

	         in = new FileInputStream(uploadPath+fileName);

	         if(mType != null){
	            headers.setContentType(mType);
	            
	         }else{

	            fileName = fileName.substring(fileName.indexOf("_")+1);       
	            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	            headers.add("Content-Disposition", "attachment; filename=\""+ 
	                  new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	         }

	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	               headers, 
	               HttpStatus.CREATED);
	      }catch(Exception e){
	         e.printStackTrace();
	         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	      }finally{
	         in.close();
	      }
	      return entity;    
	   }
	     
	     
	
}
