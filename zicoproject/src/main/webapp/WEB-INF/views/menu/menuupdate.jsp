<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fileDrop{
   width: 100%;
   height: 200px;
   border: 1px dotted blue;
}
</style>
</head>
<body>
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Paper Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="/resources/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/resources/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    Creative Tim
                </a>
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="dashboard.html">
                        <i class="ti-pie-chart"></i>
                        <p>Dashboard</p>
                    </a>
                </li>

            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Template</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
						<li>
                            <a href="#">
								<i class="ti-settings"></i>
								<p>Settings</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


			<div class="content">
				<div class="container-fluid">

					<form id="actionForm" action="/menuUpdatePost" method="post">
						<div class="row">
							<div class="form-group">
								<label>Menu Name</label> <input type="text"
									class="form-control border-input" name="menuName"
									value="${menu.menuName}" placeholder="메뉴이름">
							</div>

							<div class="form-group">
								<label>Menu Price</label> <input type="number"
									class="form-control border-input" name="menuPrice" value="${menu.menuPrice}"
									${menu.menuPrice}""
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


			<footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                    </ul>
                </nav>
				<div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>

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

</body>

    <!--   Core JS Files   -->
    <script src="/resources/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="/resources/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="/resources/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="/resources/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="/resources/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="/resources/assets/js/demo.js"></script>


</body>
</html>