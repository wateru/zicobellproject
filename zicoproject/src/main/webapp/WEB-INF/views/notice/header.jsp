<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet"  href="/resources/assets/css/login2.css" />
		<link rel="stylesheet"  href="/resources/assets/css/login4.css" />
		<!-- 스타일 -->
		<style type="text/css">
		@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
		@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
			body {
				color: black;
			}
			table,tr,th,td {
				background: white;
			}
			.notice-integer{
				width: 10%;
			}
			.notice-title{
				width: 60%;
			}
			.notice-id{
				width: 10%;
			}
			.notice-date{
				width: 20%;
			}
			.nth {
				font-weight:bold;
				text-align: center;
			}
			.title {
				font-weight:bold;
			}
			
		</style>
	</head>
	<body>
	<!-- 제이쿼리 CDN -->
	<script
			src="https://code.jquery.com/jquery-3.2.1.min.js"
			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
			crossorigin="anonymous"></script>


	<!-- Header -->
	<header id="header" class="reveal" style="overflow:unset;">
		<div class="logo"><a href="/home">B E L L<span>&nbsp;by Zico</span></a></div>
			<a class="none-inlineblock" id="login" style="display:none">Login</a>
			<a class="none-inlineblock"  style="display:none">Signin</a>
			<a class="user-inlineblock" style="display:none">Mypage</a>
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
						<button >login</button>
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
	    		obj.id = "<%=id%>";
	    	/* console.log(obj); */
		});     
	</script>
	<script>
	/*로그인 버튼 유무  */
	$(document).ready(function() { 
		var sessionid ="<%=(String)session.getAttribute("id")%>";
		var sessiongrade = "<%=(Integer)session.getAttribute("grade")%>";
		console.log("session 등급" + sessiongrade)
			if(sessionid == "null"){
				$(".none-inlineblock").css("display","inline-block");
				$(".user-inlineblock").css("display","none");
				$(".manage-inlineblock").css("display","none");				
				$(".manage-listitem").css("display","none");
				$(".admin-inlineblock").css("display","none")
				$(".admin-block").css("display","none")
			}else{
				$(".none-inlineblock").css("display","none");
				$(".user-inlineblock").css("display","inline-block");
				if(sessiongrade <= 2){
					$(".manage-inlineblock").css("display","inline-block");
					$(".manage-listitem").css("display","list-item");
				}
				if(sessiongrade == 1){
					console.log(sessiongrade)
					$(".admin-inlineblock").css("display","inline-block")
					$(".admin-block").css("display","block")
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
