package org.zico.web;

import java.io.Console;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.dto.Criteria;
import org.zico.service.OrderService;
import org.zico.util.MediaUtils;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService orderService;	
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
	@PostMapping("/order/postpaytest")
	public String postpaytest(String menuName,String menuPrice,String heeSubTotalPrice,String menuheeCount,int totalheekyung,int storeNo,String menuNo
			,HttpSession session) {
		Order order =new Order();
		order.setStoreNo(storeNo);
		order.setTotalPrice(totalheekyung);
		order.setStatus("주문중");
		order.setMemberId(session.getAttribute("id").toString());
		String[] menuNameArr = menuName.split(",");
		String[] menuPriceArr =menuPrice.split(","); 
		String[] heeSubTotalPriceArr =heeSubTotalPrice.split(",");
		String[] menuheeCountArr=menuheeCount.split(",");
		String[] menuNoArr = menuNo.split(",");
		if(orderService.comparisonCount(order) == 0) {
			log.info("혹시 요길로 오시나욥?");
			int orderNo = orderService.insert(order);	
			for(int i=0;i<menuNameArr.length;i++) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setMenuName(menuNameArr[i]);
				orderDetail.setPrice(Integer.parseInt(menuPriceArr[i]));
				orderDetail.setSubTotal(Integer.parseInt(heeSubTotalPriceArr[i]));
				orderDetail.setCount(Integer.parseInt(menuheeCountArr[i]));
				orderDetail.setMenuNo(Integer.parseInt(menuNoArr[i]));
				orderDetail.setOrderNo(orderNo);
				orderDetail.setStoreNo(storeNo);
				orderService.detailInsert(orderDetail);			
			}
		}else {
				log.info("똑똑 ? 들어오십니까?");
				int orderNo = orderService.orderNoSelect(order);
				
				orderService.detailDelete(orderNo);
				orderService.orderUpdate(order);
				for(int i=0;i<menuNameArr.length;i++) {
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setMenuName(menuNameArr[i]);
					orderDetail.setPrice(Integer.parseInt(menuPriceArr[i]));
					orderDetail.setSubTotal(Integer.parseInt(heeSubTotalPriceArr[i]));
					orderDetail.setCount(Integer.parseInt(menuheeCountArr[i]));
					orderDetail.setMenuNo(Integer.parseInt(menuNoArr[i]));
					orderDetail.setOrderNo(orderNo);
					orderDetail.setStoreNo(storeNo);
					orderService.detailInsert(orderDetail);								
			}
			}
		return "redirect:/order/paytest";
	}
	@GetMapping("/order/paytest") 
	public void paytest(HttpSession session,Model model){
		Order order=new Order();
		OrderDetail orderDetail = new OrderDetail();
		order.setStatus("주문중");
		order.setMemberId(session.getAttribute("id").toString());
		orderDetail.setStatus("주문중");
		orderDetail.setMemberId(session.getAttribute("id").toString());	
		model.addAttribute("order",orderService.orderList(order));
		model.addAttribute("detail",orderService.orderDetailList(orderDetail));
	}
	@PostMapping("/order/postapy")
	public void postpay(String menuName,HttpSession session) {
		
	}
	@PostMapping("/order/menuDelete")
	public String menuDelete(int menuNo) {
		log.info("일단오나 확인");
		return "redirect:/order/paytest";
	}
	
	@GetMapping("/order/mlist") 
	public void mlist(Criteria cri, Model model,@RequestParam(name="sno")int storeNo){
		cri.setStoreNo(storeNo);
		model.addAttribute("menu", orderService.getMenuList(cri));
	}
	
	@GetMapping("/order/store") 
	public void store(Criteria cri, Model model){
		model.addAttribute("store", orderService.getList(cri));
		model.addAttribute("total", orderService.getListCount());
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
