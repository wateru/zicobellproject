package org.zico.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.zico.domain.Menu;
import org.zico.dto.Criteria;
import org.zico.service.MenuService;
import org.zico.util.MediaUtils;
import org.zico.util.UploadFileUtils;

import lombok.extern.java.Log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Log
public class MenuController {

	@Autowired
	private MenuService serivce;
	
	
	@RequestMapping(value ="/menu/delete", method=RequestMethod.POST)
   public String menuDelete(@RequestParam(name="menuNo")int menuNo){
	   serivce.remove(menuNo);
	   return "redirect:/menu/menulist"; 
   }
	@GetMapping("/menu/menuinsert")
	 public void uploadAjax(){

	   }
	  
	@GetMapping("/menu/menuupdate")
	 public void menuUpdate(@RequestParam(name="menuNo")int menuNo,Model model){
		
		   
		   model.addAttribute("menu",serivce.detali(menuNo));
		    
	   }
	
	@RequestMapping(value="/menu/menuUpdatePost",method=RequestMethod.POST)
	   public String menuUpdatePost(String menuName,int menuPrice,String imgName,int menuNo) {
		   Menu menu=new Menu();
		   log.info("이미지이름 :"+imgName);
		   menu.setMenuName(menuName);
		   menu.setMenuPrice(menuPrice);
		   menu.setImgName(imgName);
		   menu.setMenuNo(menuNo);
		   
		   serivce.update(menu);
		   
		  return "redirect:/menu/menulist";
		   
	   }
	
	
   @RequestMapping(value="/menu/insert",method=RequestMethod.POST)
   public String insertPost(String menuName,int menuPrice,String imgName) {
	   Menu menu=new Menu();
	   log.info("이미지이름 :"+imgName);
	   menu.setMenuName(menuName);
	   menu.setMenuPrice(menuPrice);
	   menu.setImgName(imgName);
	   
	   serivce.create(menu);
	   
	  return "redirect:/menu/menulist";
	   
   }
   
   
   @Resource(name = "uploadPath")
   private String uploadPath;
   
   @ResponseBody
   @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, 
   produces = "text/plain;charset=UTF-8")
   public ResponseEntity<String> uploadAjax(MultipartFile file, Model model)throws Exception{
	   log.info("FILE uploadPath: " + uploadPath);
      log.info("originalName: " + file.getOriginalFilename());

      
      return 
            new ResponseEntity<>(
                  UploadFileUtils.uploadFile(uploadPath, 
                        file.getOriginalFilename(), 
                        file.getBytes()), 
                  HttpStatus.CREATED);
   }
  
   
   @GetMapping("/menu/menulist")
   public void menuList(Model model,Criteria cri) {	   	  
	   model.addAttribute("menu",serivce.getList(cri));
	   model.addAttribute("total",serivce.getListCount());
	   System.out.println(cri.getSize());
	   System.out.println(cri.getPage());
   }
   @GetMapping("/menu/token")
   public void token() {
	   
	  
	   
	   
   }
   
   
   
   @ResponseBody
   @RequestMapping("/menu/displayFile")
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
     
   
     @ResponseBody
     @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
     public ResponseEntity<String> deleteFile(String fileName){

        log.info("delete file: "+ fileName);

        String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

        MediaType mType = MediaUtils.getMediaType(formatName);

        if(mType != null){      

           String front = fileName.substring(0,12);
           String end = fileName.substring(14);
           log.info("front : " + front);
           log.info("end : " + end);
           new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
        }

        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();


        return new ResponseEntity<String>("deleted", HttpStatus.OK);
     }  
   //-------------------------------업로드-------------------------------
	
	
}
