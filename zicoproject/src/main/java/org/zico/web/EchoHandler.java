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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.zico.domain.Connector;
import org.zico.service.ConnectorService;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class EchoHandler  extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();




	@Autowired
	ConnectorService service;
	

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
    	System.out.println("메시지 확인 : " + message.getPayload().toString());
        map = mapper.readValue(message.getPayload(), new TypeReference<Map<String, String>>() {});
        // 처음 넘어온 정보일시(first가 true일시)
		if(map.get("first").equals("true")) {
			JSONArray socketArray = new JSONArray();
			JSONObject socketInfo = new JSONObject();			
			socketInfo.put("SessionInfo", session);
			socketInfo.put("SessionID", session.getId());
			System.out.println("socketInfo : " + socketInfo);
			try {				
				socketArray = (JSONArray)socketObject.get(map.get("no").toString());
			} catch (Exception e) {
				System.out.println("First");
			}
			socketArray.put(socketInfo);
			socketObject.put(map.get("no").toString(), socketArray);
			System.out.println(socketObject);
			System.out.println(socketObject.get(map.get("no").toString()));
		// DB에 저장
			Connector connector = new Connector();
			connector.setCsno(Integer.parseInt(map.get("no").toString()));
			connector.setCid(session.getId());
			service.create(connector);
		}
    }

    // 메시지 전송을하는 메소드
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
    
    // Connection 끊길때 이루어지는 작업
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String id = session.getId();
    	String no = service.getStore(id).toString();
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		if(no != null) {
		socketArray = (JSONArray)socketObject.get(no);
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


    
    // 해당 URL로 들어왔을시에 Message를 보내는 메소드
    // client가 주문을 전달하는 부분
	@GetMapping("/jaeik")
	public void postChat(String id) throws Exception{
		System.out.println(id);
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		socketArray = (JSONArray)socketObject.get(id);
		for(int i = 0; i < socketArray.length(); i++) {
			socketInfo = (JSONObject)socketArray.get(i);
			sessionList.add((WebSocketSession)socketInfo.get("SessionInfo"));
		}
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("메시지를 보낸닷!"));
		}
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	// 주방에서 주문하는 부분
	@PostMapping("/clientorder")
	public void postOrder(String storeno, Model m) throws Exception { 
		System.out.println(storeno);
		JSONArray socketArray = new JSONArray();
		JSONObject socketInfo = new JSONObject();
		System.out.println("전송부 : " +socketObject.toString());
		socketArray = (JSONArray)socketObject.get(storeno);
		for(int i = 0; i < socketArray.length(); i++) {
			socketInfo = (JSONObject)socketArray.get(i);
			sessionList.add((WebSocketSession)socketInfo.get("SessionInfo"));
		}
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("speech-btn"));
		}
		sessionList = new ArrayList<WebSocketSession>();
	}
	
	/*// 주방에서 버튼을 누르는 부분
	@PostMapping("/clientorder")
	@ResponseBody
	public void postOrder(@RequestBody String name, Model m) { 
		sendMessage(name);
		System.out.println(name);
	}*/
	
}



