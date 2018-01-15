<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/notice/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html style="width:40%;margin: 0 auto;"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">

<style>
	#handwrite{
		color:black;
		}


</style>

</head>
<body>
<div class="content" style="
    align: center;">
								<hr>
								<form action="/member/insert" method="post">
									<div class="field half first">
										<label for="name">Name</label>
										<input id="handwrite" name="mname"  type="text" placeholder="Name">
									</div>
									<div class="field half">
										<label for="email">ID</label>
										<input id="handwrite" name="mid"  type="text" placeholder="Id">
									</div>
									<div class="field">
										<label for="name">Password</label>
										<input id="handwrite" name="mpassword" type="password" placeholder="Password">
									</div>
									<div class="field">
										<label for="name">Password check</label>
										<input id="handwrite" name="mpassword" type="password" placeholder="다시 한번 입력하세요">
									</div>
									<div class="field">
										<label for="dept">Password Qustion</label>
										<div class="select-wrapper">
											<select id="handwrite" name="mquestion" >
												<option value="1">너의 가장 소중한 보물</option>
												<option value="2">어머니의 고향</option>
												<option value="3">졸업한 고등학교</option>
												<option value="4">너의 몸무게</option>
												
											</select>
										</div>
									</div>
									<div class="field">
										<label for="name">Qustion Password</label>
										<input id="handwrite" name="mqpassword"  type="text" placeholder="Qustion Password">
									</div>
									
									<div class="field">
										<label for="name">Phone Number</label>
										<input id="handwrite" name="mphone"  type="text" placeholder="Phone Number">
									</div>
									<div class="field">
										<label for="dept">Class</label>
										<div class="select-wrapper" >
											<select id="handwrite" name="mgrade" >
												<option value="2">매니저</option>
												<option value="3">손님</option>
											</select>
										</div>
									</div>
									<ul class="actions align-center">
										<li><input value="등록" class="button special" type="submit"></li>
									</ul>
								</form>
							</div>

</body>
</html>
<%@ include file="/WEB-INF/views/notice/footer.jsp" %>