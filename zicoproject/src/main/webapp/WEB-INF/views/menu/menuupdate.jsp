<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

        <div class="content">
				<div class="container-fluid">

					<form id="actionForm" action="/menu/menuUpdatePost" method="post">
						<div class="row">
							<div class="form-group">
								<label>Menu Name</label> <input type="text"
									class="form-control border-input" name="menuName"
									value="${menu.menuName}" placeholder="메뉴이름">
							</div>

							<div class="form-group">
								<label>Menu Price</label> <input type="number"
									class="form-control border-input" name="menuPrice" value="${menu.menuPrice}"

										placeholder="가격">
							</div>

							<input type="hidden" value="${menu.menuNo}" name="menuNo">


							<div class="col-lg-4 col-md-5">
								<div class="card card-user">
									<div class="image">
										<img src="/resources/assets/img/background.jpg" alt="..." />
									</div>
									<div class="content fileDrop">
										<span> <input type="image"
											src=displayFile?fileName=${menu.imgName}
											value="${menu.imgName}" name="imgName"> <small
											data-src=${menu.imgName}>취소하기</small>
										</span>
										<p class="description text-center"></p>
									</div>
									<hr>
									<div class="text-center">							
									</div>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-info btn-fill btn-wd zico">수정하기</button>
					</form>
					
				</div>
			</div>
		<script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
<script type="text/javascript">
$(".fileDrop").on("click",".imgName",function(e){
	e.preventDefault();
});
$(".zico").on("click",function(e){
	str='';
	str="<input type='hidden' name='imgName' value="+ $(".fileDrop input").val() +"/>";
	$(".fileDrop").html(str);
	
	$("#actionForm").submit();
});

var dateArr = [];
var fileNameArr = [];
var totalPath = [];
$(".fileDrop").on("dragenter dragover", function(event){
    event.preventDefault();
 });
 
 $(".fileDrop").on("drop", function(event){
    event.preventDefault();
    
    var files = event.originalEvent.dataTransfer.files;
    console.log(files);
    console.log();
   
    
    console.log(files.length);
    for(var i=0 ; i < files.length; i++){
    var formData = new FormData();
    
    
    formData.append("file", files[i]);
    $.ajax({
       url: '/uploadAjax',
       data: formData,
       dataType: 'text',
       processData: false,
       contentType: false,
       type: 'POST',
       success: function(data){
            var str ="";
            var date = data.substring(0, data.indexOf("s"));
            var fileName = data.substring(data.indexOf("s") + 2);
            console.log(data);
            dateArr.push(date);
            fileNameArr.push(fileName);
            
            //console.log(date);
            //console.log(fileName);
            //console.log(data);
            //console.log(checkImageType(data));
            totalPath.push(checkImageType(data));
            if(checkImageType(data)){
               str ="<span>" +"<input type=image style= 'margin :5px' class='imgName' name='imgName' value='"+data+"' src='displayFile?fileName="+data+"'/>"+"<small data-src="+data+">취소하기</small></span>";
            }else{
               str = "<sapn>"+data+"<small data-src="+data+">X</small></sapn>";
            }
           // $(".fileDrop").append("<span>"+fileName+"</span><br>");
            $(".fileDrop").append(str);
            //이미지파일 확인
            console.log("업로드 이름:" + $(".uploadedList input").val());
            
       }   
    });  
    }
 });

 function checkImageType(fileName){
    
    var pattern = /jpg|gif|png|jpeg/i;
    
    return fileName.match(pattern);
    
 }

 $(".fileDrop").on("click", "small", function(event){
    
     //var date = data.substring(0, data.indexOf("s"));
     //var fileName = data.substring(data.indexOf("s") + 2);
     var that = $(this);
     var date = $(this).attr("data-src").substring(0, $(this).attr("data-src").indexOf("s"));
     var fileName = $(this).attr("data-src").substring($(this).attr("data-src").indexOf("s") + 2);
     //console.log(date);
     //console.log(fileName);
    for(var i = 0; i < dateArr.length; i++) {
        if(dateArr[i] == date){
           dateArr.splice(i, 1);
           fileNameArr.splice(i, 1);
        }
     } 
 
    $.ajax({
       url:"/deleteFile",
       type:"post",
       data: {fileName:$(this).attr("data-src")},
       dataType:"text",
       success:function(result){
          //console.log(result);
          //console.log(date);
          if(result == 'deleted'){
             
             that.parent("span").remove();
          }
       }
    });
});
</script>
<%@ include file="../footer.jsp" %>
