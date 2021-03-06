package org.zico.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.zico.domain.Connector;
import org.zico.domain.TempOrder;
import org.zico.domain.TempOrderDetail;
import org.zico.service.ConnectorService;
import org.zico.service.TempOrderService;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class EchoHandler  extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired
	ConnectorService service;
	
	@Autowired
	TempOrderService orderService;
	

	// Connection 연결 성립되고 난 후 바로 이루어지는 작업
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        sessionList.add(session);
        logger.info("{} 연결됨", session.getId());
    }
    //json 생성(연결한 storeID와 SessionID를 연결하여 저장할 data공간 마련)
  	JSONObject socketObject = new JSONObject();
  	//json 파싱(handle된 json을 파싱하는 작업)
  	ObjectMapper mapper = new ObjectMapper();
  	Map<String, Object> map = new HashMap<String, Object>();
    // 서버에서 메시지를 받았을때 이루어지는 작업
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	logger.info("메시지 확인 : " + message.getPayload().toString());
        map = mapper.readValue(message.getPayload(), new TypeReference<Map<String, String>>() {});
        // 처음 넘어온 정보일시(first가 true일시)
		if(map.get("first").equals("true")) {
			JSONArray socketArray = new JSONArray();
			JSONObject socketInfo = new JSONObject();			
			socketInfo.put("SessionInfo", session);
			socketInfo.put("SessionID", session.getId());
			logger.info("socketInfo : " + socketInfo);
			try {				
				socketArray = (JSONArray)socketObject.get(map.get("no").toString());
			} catch (Exception e) {
				logger.info("First");
			}
			socketArray.put(socketInfo);
			socketObject.put(map.get("no").toString(), socketArray);
			logger.info(""+socketObject);
			logger.info(""+socketObject.get(map.get("no").toString()));
		
		// DB에 저장
			Connector connector = new Connector();
			connector.setCsno(Integer.parseInt(map.get("no").toString()));
			connector.setCid(session.getId());
			service.create(connector);
		// 처음에게만 전달해줄 JSON데이터 생성
			List<TempOrder> order = orderService.getOrder(Integer.parseInt(map.get("no").toString()));
			if(order.size() > 0) {
				for(int i = 0; i < order.size(); i++) {
						session.sendMessage(new TextMessage(
								createMessage(order.get(i), orderService.getOrderDetail(order.get(i).getOrderNo())).toString()));
				}
			}
		}
    }

    //메시지 전송을하는 메소드
    @Override
    public boolean supportsPartialMessages() {
    	this.logger.info("call method!");
    	return super.supportsPartialMessages();
    }
    
    public void sendMessage(String message) {
    	for (WebSocketSession session : this.sessionList) {
    		if (session.isOpen()) {
    			try {
    				session.sendMessage(new TextMessage(message));
    			} catch (Exception ignored) {
    				this.logger.error("fail to send message!", ignored);
    			}
    		}
    	}
    }
    
    // Connection 끊길때
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String id = session.getId();
    	String no = service.getStore(id).toString();
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		if(no != null) {
		socketArray = (JSONArray)socketObject.get(no);
		logger.info("" + socketArray.length());
		}
		for(int i = 0; i < socketArray.length(); i++) {
			socketInfo = (JSONObject)socketArray.get(i);
			if(socketInfo.get("SessionID") == id) socketArray.remove(i);
		}
		logger.info("삭제후  : " + socketArray);
		service.delete(id);
		
	logger.info("{} 연결 끊김", session.getId());
    }
	

    
	@PostMapping("/clientorder")
	@ResponseBody
	public String postClientOrder(@RequestBody String json, Model m) throws Exception { 
		TempOrder order = new TempOrder();
		TempOrderDetail orderDetail = new TempOrderDetail();
		JSONObject receipt = new JSONObject(json);
		receipt.put("message", "order");
		
		// DB 수정 부분
		order.setOrderNo(Integer.parseInt(receipt.get("orderno").toString()));
		order.setOrderPay(receipt.get("pay").toString());
		// people가 널이면 문제 발생
		// 예약시간 넣어주어야 함
		order.setOrderPeople(receipt.getInt("people")); 
		order.setOrderStatus(receipt.getString("status"));
		order.setOrderStoreNo(receipt.getInt("no"));
		order.setOrderToken(receipt.getString("token"));
		order.setOrderTotPrice(receipt.getInt("totalprice"));
		order.setOrderMemberId(receipt.getString("id"));
		logger.info("" + receipt.toString());
		logger.info("" + order.toString());
		orderService.modifyOrder(order);
		
		JSONArray tempArray = (JSONArray)receipt.get("menulist");
		JSONObject tempObject;
		orderDetail.setDetailOrderNo(Integer.parseInt(receipt.get("orderno").toString()));
		for(int i = 0; i < tempArray.length(); i++) {
			tempObject = (JSONObject)tempArray.get(i);
			orderDetail.setDetailMenuName(tempObject.get("menu").toString());
			orderDetail.setDetailCount(Integer.parseInt(tempObject.get("count").toString()));
			orderDetail.setDetailSubTotal(tempObject.getInt("subtotal"));
			orderService.modifyDetailOrder(orderDetail);
			logger.info(orderDetail.toString());
		}

		logger.info(receipt.toString());
		receipt.get("no");
		
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		logger.info("전송부 : " +socketObject.toString());
		try {
			socketArray = (JSONArray)socketObject.get(receipt.get("no").toString());
			for(int i = 0; i < socketArray.length(); i++) {
				socketInfo = (JSONObject)socketArray.get(i);
				sessionList.add((WebSocketSession)socketInfo.get("SessionInfo"));
			}
			for (WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(receipt.toString()));
			}			
		} catch (Exception e) {
			
		} finally {
			sessionList = new ArrayList<WebSocketSession>();			
		}
		return "success";
	}
	
	@PostMapping("/bell")
	public void postBell(String storeno, Model m) throws Exception {
		logger.info(storeno);
		logger.info("페달 누름");
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		logger.info("전송부 : " +socketObject.toString());
		socketArray = (JSONArray)socketObject.get(storeno);
		for(int i = 0; i < socketArray.length(); i++) {
			socketInfo = (JSONObject)socketArray.get(i);
			sessionList.add((WebSocketSession)socketInfo.get("SessionInfo"));
		}
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("{'message':'btn'}"));
		}
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	
	// 주방에서 음성이 처리되는 부분
	@PostMapping("/admin/postorder")
	public void postOrder(@RequestBody String json) throws Exception {
		// 주문 상태 처리
		logger.info(json);
		map = mapper.readValue(json, new TypeReference<Map<String, String>>() {});
		String[] speech = map.get("data").toString().split("번");
		String[] progress = {"주문","쥬문","시작","start"};
		String[] end = {"완료","완뇨","끝","끗","클리어","빨간맛","clear","end"};
		String status = "";
		String token = "";
		JSONObject statusJson = new JSONObject();
		try {
			String current = orderService.getStatus(Integer.parseInt(speech[0]));
			if(current.equals("afterpay")) {
				logger.info("afterpay" + current);
				status = "cooking";
				token = changeStatus(Integer.parseInt(speech[0]), status);
				statusJson.put("status", status);
			}
			if(current.equals("cooking")) {
				logger.info(current);
				status = "done";
				token = changeStatus(Integer.parseInt(speech[0]), status);
				statusJson.put("status", status);
			}
		} catch (Exception e) {
			
		}
				
		/*progress:
		while(status.isEmpty()) {
			if(speech.length == 2) {
			for(int i = 0; i < progress.length; i++) {
				if(speech[1].contains(progress[i])) {
					logger.info("상태 : " + speech[1]);
					
					status = "cooking";
					break progress;
				} 
			}
			for(int j = 0; j < end.length; j++) {
				if(speech[1].contains(end[j])) {
					status = "done";
					break progress;
				} 
			}
			}
			status = "none";
			break progress;
		}*/
		// ORDER에 주문번호로 상태 DB를 수정하는 부분 작성
		
		// 상태결과 json 으로 만들어주는 부분
		
		statusJson.put("message", "status");
		statusJson.put("orderno", speech[0]);
		statusJson.put("token", token);
		
		// json뽑아서 확인할 것
		logger.info(statusJson.toString());
		
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		socketArray = (JSONArray)socketObject.get(map.get("no").toString());
		for(int i = 0; i < socketArray.length(); i++) {
			socketInfo = (JSONObject)socketArray.get(i);
			sessionList.add((WebSocketSession)socketInfo.get("SessionInfo"));
		}
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(statusJson.toString()));
		}
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	//JSON 제작 Method
	private JSONObject createMessage(TempOrder order, List<TempOrderDetail> detail) {
		JSONObject receipt = new JSONObject();
		JSONArray receiptArray = new JSONArray();
		TempOrderDetail tempOrderDetail = new TempOrderDetail();
		
		receipt.put("no", order.getOrderNo());
		receipt.put("orderno", order.getOrderNo());
		receipt.put("totalprice", order.getOrderTotPrice());
		receipt.put("people", order.getOrderPeople());
		receipt.put("id", order.getOrderMemberId());
		receipt.put("pay", order.getOrderPay());
		receipt.put("status", order.getOrderStatus());
		receipt.put("token", order.getOrderToken());
		receipt.put("message", "order");
			
		for(int i = 0; i < detail.size(); i++) {
			JSONObject receiptDetail = new JSONObject();
			tempOrderDetail = detail.get(i);
			receiptDetail.put("menu", tempOrderDetail.getDetailMenuName());
			receiptDetail.put("count", tempOrderDetail.getDetailCount());
			receiptArray.put(i, receiptDetail);
		}
		receipt.put("menulist", receiptArray);
	
		return receipt;
	}
	private String changeStatus(int orderNo, String status) {
		TempOrder order = new TempOrder();
		order.setOrderNo(orderNo);
		order.setOrderStatus(status);
		String token = orderService.modifyStatus(order);
		System.out.println(token);
		return token;
	}

}



