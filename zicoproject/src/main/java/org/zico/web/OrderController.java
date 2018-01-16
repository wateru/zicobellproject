package org.zico.web;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.domain.TempOrder;
import org.zico.domain.TempOrderDetail;
import org.zico.dto.Criteria;
import org.zico.service.TempOrderService;
import org.zico.util.MediaUtils;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private TempOrderService orderService;	
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
	@GetMapping("/getToken")
	public void gettoken(String token,Model m) {
		m.addAttribute("token",token);
	}
	@PostMapping("/order/postpaytest")
	public String postpaytest(String menuName,String menuPrice,String heeSubTotalPrice,String menuheeCount,int totalheekyung,int storeNo,String menuNo
			,String stat, HttpSession session) {
		log.info("StoreNo : " + storeNo);
		log.info("Stat 파라미터값 : " + stat);
		TempOrder order = new TempOrder();
		order.setOrderStoreNo(storeNo);
		order.setOrderTotPrice(totalheekyung);
		order.setOrderStatus("beforepay");
		order.setOrderMemberId(session.getAttribute("id").toString());
		String[] menuNameArr = menuName.split(",");
		String[] menuPriceArr = menuPrice.split(","); 
		String[] heeSubTotalPriceArr =heeSubTotalPrice.split(",");
		String[] menuheeCountArr=menuheeCount.split(",");
		String[] menuNoArr = menuNo.split(",");
		// comparisonCount랑 ordernoselect 합칠수 있는지 테스트 할 것
		if(orderService.comparisonCount(order) == 0) {
			log.info("혹시 요길로 오시나욥?");
			int orderNo = orderService.insert(order);
			log.info("1");
			for(int i=0;i<menuNameArr.length;i++) {
//				OrderDetail orderDetail = new OrderDetail();
				TempOrderDetail orderDetail = new TempOrderDetail();
				orderDetail.setDetailMenuName(menuNameArr[i]);
				orderDetail.setDetailPrice(Integer.parseInt(menuPriceArr[i]));
				orderDetail.setDetailSubTotal(Integer.parseInt(heeSubTotalPriceArr[i]));
				orderDetail.setDetailCount(Integer.parseInt(menuheeCountArr[i]));
				orderDetail.setDetailMenuNo(Integer.parseInt(menuNoArr[i]));
				orderDetail.setDetailOrderNo(orderNo);
				orderDetail.setDetailStoreNo(storeNo);
				log.info("2");
				orderService.detailInsert(orderDetail);			
			}
		}else {
				log.info("똑똑 ? 들어오십니까?");
				int orderNo = orderService.orderNoSelect(order);
				log.info(""+orderNo);
				log.info(""+order);
				orderService.delete(orderNo);
				log.info("3");
				orderService.orderUpdate(order);
				log.info("4");
				for(int i=0;i<menuNameArr.length;i++) {
					TempOrderDetail orderDetail = new TempOrderDetail();
					orderDetail.setDetailMenuName(menuNameArr[i]);
					orderDetail.setDetailPrice(Integer.parseInt(menuPriceArr[i]));
					orderDetail.setDetailSubTotal(Integer.parseInt(heeSubTotalPriceArr[i]));
					orderDetail.setDetailCount(Integer.parseInt(menuheeCountArr[i]));
					orderDetail.setDetailMenuNo(Integer.parseInt(menuNoArr[i]));
					orderDetail.setDetailOrderNo(orderNo);
					orderDetail.setDetailStoreNo(storeNo);
					orderService.detailInsert(orderDetail);						
			}
			}
		log.info("해당 완료");
		return "redirect:/order/paytest?stat="+stat;
	}
	@GetMapping("/order/paytest") 
	public void paytest(HttpSession session,Model model,String stat){
		TempOrder order=new TempOrder();
		TempOrderDetail orderDetail = new TempOrderDetail();
		order.setOrderStatus("beforepay");
		order.setOrderMemberId(session.getAttribute("id").toString());
		orderDetail.setDetailStatus("beforepay");
		orderDetail.setDetailMemberId(session.getAttribute("id").toString());
		model.addAttribute("order",orderService.orderList(order));
		log.info("완료1");
		model.addAttribute("detail",orderService.orderDetailList(orderDetail));
		model.addAttribute("stat",stat);
		log.info("완료2");
	}
	@PostMapping("/order/postapy")
	public void postpay(String menuName,HttpSession session) {
		
	}
	@PostMapping("/order/menuDelete")
	public String menuDelete(@RequestBody String json) {
		JSONObject removeItem = new JSONObject(json);
		TempOrderDetail orderDetail = new TempOrderDetail();
		orderDetail.setDetailMenuNo(removeItem.getInt("removeMenu"));
		orderDetail.setDetailOrderNo(removeItem.getInt("removeOrder"));
		orderService.detailDelete(orderDetail);
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
