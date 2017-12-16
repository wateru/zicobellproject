package org.zico.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

// 이미지 타입인지 판단해주는 애 ~~~~~~~~~~~~~~~~~~~
public class MediaUtils {
   
      private static Map<String, MediaType> mediaMap;
      
      static{
         
         mediaMap = new HashMap<String, MediaType>();      
         mediaMap.put("JPG", MediaType.IMAGE_JPEG);
         mediaMap.put("GIF", MediaType.IMAGE_GIF);
         mediaMap.put("PNG", MediaType.IMAGE_PNG);
      }
      
      public static MediaType getMediaType(String type){
         
         return mediaMap.get(type.toUpperCase());
      }
}