package org.zico.web;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zico.domain.ChartOrder;
import org.zico.domain.ChartOrderDetail;
import org.zico.domain.SearchChart;
import org.zico.dto.Criteria;
import org.zico.service.ChartService;
import org.zico.service.NoticeService;
import org.zico.service.StoreService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	NoticeService nservice;
	@Autowired
	StoreService storeService;
	@Autowired
	ChartService chartService;
	
	@GetMapping("/dashboard")
	public void test(Model m, HttpSession session) {
		System.out.println(session.getAttribute("storeno"));
		Criteria cri = new Criteria();
		m.addAttribute("list", nservice.getList(cri));
		if(session.getAttribute("storeno") != null) {
			ChartOrder tempOrder = new ChartOrder();
			List<ChartOrderDetail> chartOrderDetailList = new ArrayList<ChartOrderDetail>();
			
			String open = storeService.detail(Integer.parseInt(session.getAttribute("storeno").toString())).getOpenTime();
			String close = storeService.detail(Integer.parseInt(session.getAttribute("storeno").toString())).getCloseTime();
			Date openTime = new Date();
			Date closeTime = new Date();
			
			openTime.setSeconds(0);
			if(open.contains("PM")) {
				openTime.setHours( Integer.parseInt(open.split(":")[0]) + 12 );
			} else {
				openTime.setHours( Integer.parseInt(open.split(":")[0]) );
			}
			openTime.setMinutes( Integer.parseInt(open.split(":")[1].substring(0, 2)) );
			
			closeTime.setSeconds(0);
			if(close.contains("PM")) {
				closeTime.setHours( Integer.parseInt(close.split(":")[0]) + 12 );
			} else {
				closeTime.setHours( Integer.parseInt(close.split(":")[0]) );			
			}
			closeTime.setMinutes( Integer.parseInt(close.split(":")[1].substring(0, 2)) );

			int last = (int)Math.ceil( ( (double)closeTime.getHours() - (double)openTime.getHours() ) /2 );
			SimpleDateFormat chartFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			SimpleDateFormat chartDetailFormat = new SimpleDateFormat("yyyy-MM-dd");
			SearchChart search = new SearchChart();
			search.setStartTime(chartFormat.format(openTime));
			search.setCloseTime(chartFormat.format(closeTime));
			search.setStatus("done");
			search.setStoreNo(Integer.parseInt(session.getAttribute("storeno").toString()));
			
			chartOrderDetailList = chartService.getChartOrderDetail(search);
			JSONArray chartOrderDetailArray = new JSONArray();
			chartOrderDetailArray.put(0, chartDetailFormat.format(openTime));
			for(int i = 0; i < chartOrderDetailList.size(); i++) {
				JSONObject chartOrderDetail = new JSONObject();
				ChartOrderDetail tempOrderDetail = new ChartOrderDetail();
				tempOrderDetail = chartOrderDetailList.get(i);
				chartOrderDetail.put("count", tempOrderDetail.getDetailCount());
				chartOrderDetail.put("menu", tempOrderDetail.getMenu());
				chartOrderDetail.put("subPrice", tempOrderDetail.getSubPrice());
				chartOrderDetailArray.put(i+1,chartOrderDetail);
			}
			
			JSONArray chartOrderArray = new JSONArray();
			for(int i = 0; i < last; i++) {
				search.setStartTime(chartFormat.format(openTime));
				Date temp =  new Date();
				temp.setTime(openTime.getTime());
				temp.setHours(temp.getHours()+2);
				search.setCloseTime(chartFormat.format(temp));
				tempOrder = chartService.getChartOrder(search);
				JSONObject chartOrder = new JSONObject();
				chartOrder.put("people", tempOrder.getPeople());
				chartOrder.put("totalPrice", tempOrder.getTotalPrice());
				chartOrder.put("count", tempOrder.getOrderCount());
				chartOrder.put("time", openTime.getHours()+"-"+temp.getHours());
				chartOrderArray.put(i, chartOrder);
				openTime = temp;
			}
			m.addAttribute("chartDetail",chartOrderDetailArray);
			m.addAttribute("chartOrder",chartOrderArray);
		} else {
		m.addAttribute("chartDetail",0);
		m.addAttribute("chartOrder",0);
		}
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
	@GetMapping("/order")
	public void order() {
		
	};
	@GetMapping("/speech")
	public void speech() {
		
	};
	
	
	
}
