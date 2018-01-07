package org.zico.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.service.StoreService;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/*")
public class ManagerController {

	/*ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> map = new HashMap<String, Object>();
	
	@PostMapping("/postorder")
	public void postorder(@RequestBody String json) throws Exception {
		map = mapper.readValue(json, new TypeReference<Map<String, String>>() {});
		map.get("no").toString();
		String[] speech = map.get("data").toString().split("번");
		log.info("주문 번호 : " + speech[0]);
		log.info("상태 : " + speech[1]);
		String[] progress = {"주문","쥬문"};
		String[] end = {"완료","완뇨","끝","끗","클리어","빨간맛"};
		String status = "";

		progress:
		while(status.isEmpty()) { 
			for(int i = 0; i < progress.length; i++) {
				if(speech[1].contains(progress[i])) {
					status = "progress";
					break progress;
				} 
			}
			for(int j = 0; j < end.length; j++) {
				if(speech[1].contains(end[j])) {
					status = "end";
					break progress;
				} 
			}
			status = "none";
			break progress;
		}

		// ORDER에 주문번호로 수정하는 부분 작성


		log.info("no : " + map.get("no").toString());
		log.info("data : " + map.get("data").toString());
		log.info("상태 : " + status);
	}*/
}
