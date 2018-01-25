<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!--
	Transitive by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Transitive by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!-- 아이콘 script -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?version=1">
		<link rel="stylesheet"  href="/resources/assets/css/login2.css" />
		<link rel="stylesheet"  href="/resources/assets/css/login4.css" />
		<style type="text/css">
		@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
		@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
		</style>
	</head>
	<body>
	<!-- 제이쿼리 CDN -->
	<script
			src="https://code.jquery.com/jquery-3.2.1.min.js"
			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
			crossorigin="anonymous"></script>


	<!-- Header -->
	<header id="header" class="alt" style="overflow:unset;">
		<div class="logo"><a href="/home">B E L L<span>&nbsp;by Zico</span></a></div>
			<a class="none-inlineblock" id="login" style="display:none">Login</a>
			<a class="none-inlineblock" href="/member/insert" style="display:none">Signin</a>
			<a class="user-inlineblock" id="myid" style="display:none"></a>
			<a class="user-inlineblock" id="aftersignin" style="display:none">Logout</a>
			<a class="manage-inlineblock" href="/admin/dashboard" style="display:none">manage</a>
		</div>
		<a href="#menu" class="toggle"><span>Menu</span></a>
	</header>

	<!-- The Modal -->
	<div id="myModal" class="modal" style="position:absolute; z-index:10">
    <!-- Modal content -->
    	<div class="modal-content">
        	<div class="modal-header">
            	<span class="close">&times;</span>
        	</div>
        	<div class="modal-body">
     			<!-- 여기가 모달 내용 -->
				<div class="body"></div>
				<div class="grad"></div>
				<div class="header">
					<div>
						Zico<span>Project</span>
					</div>
				</div>
				<br>
				<form action="/member/login" method="post">
					<div class="login">
						<input type="text" placeholder="username" name="member_id"><br>
						<input type="password" placeholder="password" name="member_password"><br>
						<a href="/member/insert">회원가입 </a>&nbsp;&nbsp; <span class="line"><input name="remember" id="remember" style="opacity:1; float:none; -webkit-appearance: checkbox; display: -webkit-inline-box; " type="checkbox" />&emsp; &emsp;로그인</span><br>
						<button style="padding:0px">login</button>
					</div>
				</form>
           		<!-- 모달 -->
        	</div>
    	</div>
	</div>	
	
	<form id="logout" action="/member/logout" method="post" style="display:none"></form>
	<script>
			$(".line").on("click",function(){
				console.log("클릭 실행");
				console.log("if문 실행되기 전 : " + $("#remember").prop("checked"));	
				if($("#remember").prop("checked")){
					$("#remember").prop("checked", false);
				} else {
					$("#remember").prop("checked", true);
				}
				console.log("if문 실행된 후 : " + $("#remember").prop("checked"));
			});
	</script>
	<script> 
	    // Get the modal
	    var modal = document.getElementById('myModal');
	    // Get the button that opens the modal
	    var btn = document.getElementById("login");
	    // Get the <span> element that closes the modal
	    var span = document.getElementsByClassName("close")[0];    
	    // When the user clicks the button, open the modal
	    btn.onclick = function() {
	        modal.style.display = "block";
	        $("#slidebox").css("display","none");
	    }
	    // When the user clicks on <span> (x), close the modal
	    span.onclick = function() {
	        modal.style.display = "none";
	        $("#slidebox").css("display","block");
	    }
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	            $("#slidebox").css("display","block");
	        }
	    }    
	     $(document).ready(function(){
	    	
	    	if("${loginstatus}" == "fail"){
	    		modal.style.display = "block";
	    		$("#slidebox").css("display","none");
	    	}
	    	
	    	// 1) 세션 ID정보 가져옴
	    	<%	String id;
	    		id = (String)session.getAttribute("id"); %>
	
	    	// 2) JSON 객체 생성 
	    		var obj = new Object();
	    	// 3) ID json에 저장
	    		id = "<%=id%>";
	    	/* console.log(obj); */
		});     
	</script>
	<script>
	/*로그인 버튼 유무  */
	$(document).ready(function() { 
		var sessionid ="<%=(String)session.getAttribute("id")%>";
		var sessiongrade = "<%=(Integer)session.getAttribute("grade")%>";
		console.log(sessiongrade)
			if(sessionid == "null"){
				console.log("11")
				$(".none-inlineblock").css("display","inline-block");
				$(".user-inlineblock").css("display","none");
				$(".manage-inlineblock").css("display","none");				
				$(".manage-listitem").css("display","none")
				$("#myid").text("");
			}else{
				console.log("22")
				$(".none-inlineblock").css("display","none");
				$(".user-inlineblock").css("display","inline-block");
				$("#myid").text(id+"님 ");
				if(sessiongrade <= 2){
					$(".manage-inlineblock").css("display","inline-block");
					$(".manage-listitem").css("display","list-item");
				}
			}
	});
	
		$("#aftersignin").on("click",function(){
			$("#logout").submit();
		})
	
	</script>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/home">Home</a></li>
			<li><a href="/notice/list">Notice</a></li>
			<li><a href="/order/store">Order</a></li>
			<li class="manage-listitem" style="display:none;"><a href="/admin/dashboard">manage</a></li>
		</ul>
	</nav>

		<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. /resources/images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="/resources/images/home-video-1">
				<div class="slide sli-left" style="z-index: 3; position:relative; margin-right: 30px;">&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-left fa-4x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="inner sli" >
					<div id="slidebox">
					<ul id="slider">
						<li>
								<h1><b></b>예약</h1>
								<p>원하는 매장을 미리 예약하고 주문하세요
								<br>당신의 시간이 절약됩니다</p>
								<a href="/order/store" class="button special scrolly">예약하기</a>
						</li>
						<li>
								<h1><b></b>회원가입</h1>
								<p>로그인을 하여 손쉽게 주문하세요
								<br>
								깨끗하고 신선한 음식을 보장해드립니다.
								</p>
								<a href="/member/insert" class="button special scrolly">매장관리</a>
						</li>
					</ul>
					</div>
				</div>
				<div class="slide sli-right" style="z-index: 3; margin-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right fa-4x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</div>
			</section>
		<script>
			// url 가져오고 바꿔주는 스크립트부분
			/* var url = document.location.href */
			var url = location.href
			$("#url").attr("value", url);
			
			$("#logoutvalue").attr("value", url);
		</script>
		
			
			
			
			<!-- 슬라이드 스크립트 -->
			<!-- 슬라이드 스크립트 -->
			<script>
		    $(".slide").hover(function(){
		            $(this).css("color","#5AA6ED")
		        },
		        function () {
		            $(this).css("color","")
		        });
		
		    var x = $(".inner").width();
		    var slider = document.getElementById("slider");
		    var slideArray = slider.getElementsByTagName("li");
		    var slideMax = slideArray.length - 1;
		    var curSlideNo = 0;
		
		    for (i = 0; i <= slideMax; i++) {
		        if (i == curSlideNo) slideArray[i].style.left = 0;
		        else slideArray[i].style.left = -x + "px";
		    }
		
		    $(window).resize(function (){
		        x =$(".inner").width()
		    });
		
		    slider.addEventListener('click', function () {
		        nextSlide();
		    }, false);
		
		    var aniStart = false;
		    var next = 1;
		    var nextSlide = function(){
		        if (aniStart === true) return;
		        next = curSlideNo + 1;
		        if (next > slideMax) next = 0;
		        aniStart = true;
		        nextSliding();
		    }
		
		    var prevSlide = function(){
		        if (aniStart === true) return;
		        next = curSlideNo - 1;
		        if (next < 0) next = slideMax;
		        aniStart = true;
		        slideArray[next].style.left = x + "px";
		        prevSliding();
		    }
		
		    function prevSliding() {
		        var curX = parseInt(slideArray[curSlideNo].style.left, 10);
		        var nextX = parseInt(slideArray[next].style.left, 10);
		        var newCurX = curX - 10;
		        var newNextX = nextX - 10;
		        if (newNextX <= 0){
		            slideArray[curSlideNo].style.left = -x + "px";
		            slideArray[next].style.left = 0;
		            curSlideNo = curSlideNo - 1;
		            if (curSlideNo < 0) curSlideNo = slideMax;
		            aniStart = false;
		            return;
		        }
		        slideArray[curSlideNo].style.left = newCurX + "px";
		        slideArray[next].style.left = newNextX + "px";
		         setTimeout(function () {
		            prevSliding();
		        }, 7); 
		    }
		    function nextSliding() {
		        var curX = parseInt(slideArray[curSlideNo].style.left, 10);
		        var nextX = parseInt(slideArray[next].style.left, 10);
		        var newCurX = curX + 10;
		        var newNextX = nextX + 10;
		        if (newCurX >= x) {
		            slideArray[curSlideNo].style.left = -x + "px";
		            slideArray[next].style.left = 0;
		            curSlideNo = curSlideNo + 1;
		            if (curSlideNo > slideMax) curSlideNo = 0;
		            aniStart = false;
		            return;
		        }
		        slideArray[curSlideNo].style.left = newCurX + "px";
		        slideArray[next].style.left = newNextX + "px";
		         setTimeout(function () {
		            nextSliding();
		        }, 7); 
		    }
		    /* setInterval(nextSlide,100000); */
		    $(".sli-right").on("click",function(){
		        nextSlide();
		    });
		    $(".sli-left").on("click",function(){
		        prevSlide();
		    });
		</script>


		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>