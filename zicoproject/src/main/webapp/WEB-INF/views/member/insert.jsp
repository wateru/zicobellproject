<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/notice/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html style="width:40%;margin: 0 auto;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">

<style>
body {
	color: black;
}
</style>

</head>
<body>
	<div class="content" style="align: center;">
		<hr>
		<form action="/member/insert" method="post" id="insertform">
			<div class="field half first">
				<label for="name">Name</label> <input class="handwrite" id="username" name="mname" type="text" placeholder="Name">
			</div>
			<div class="field half">
				<label for="email">ID</label> <input class="handwrite" id="userid" name="mid" type="text" placeholder="Id">
				<input type="hidden" id="chkid" value="false">
			</div>
				<span style="font-size:14px" id="checkid"></span>
			<div class="field">
				<label for="name">Password</label> <input class="handwrite" id="password" name="mpassword" type="password" placeholder="Password" >
			</div>
			<div class="field">
				<label for="name">Password check</label> <input class="handwrite" id="passwordcheck" name="mpassword" type="password" placeholder="다시 한번 입력하세요">
				<span style="font-size:14px" id="checkpassword"></span>
				<input id="chkpassword" type="hidden" value="false">
			</div>
			<div class="field">
				<label for="dept">Password Question</label>
				<div class="select-wrapper">
					<select id="handwrite" name="mquestion">
						<option value="1">너의 가장 소중한 보물</option>
						<option value="2">어머니의 고향</option>
						<option value="3">졸업한 고등학교</option>
						<option value="4">너의 몸무게</option>

					</select>
				</div>
			</div>
			<div class="field">
				<label for="name">Question Password</label> <input class="handwrite" id="questionanswer" name="mqpassword" type="text" placeholder="Qustion Password">
			</div>

			<div class="field">
				<label for="name">Phone Number</label> <input class="handwrite" name="mphone" id="userphone" type="text" placeholder="Phone Number">
			</div>
			<div class="field">
				<label for="dept">Class</label>
				<div class="select-wrapper">
					<select class="handwrite" name="mgrade">
						<option value="2">매니저</option>
						<option value="3">일반</option>
					</select>
				</div>
			</div>
			<ul class="actions align-center">
				<li><input value="등록" class="button special" id="insertbutton"></li>
			</ul>
		</form>
	</div>
	<script>
		$("#passwordcheck").keyup(function(){
			checkpassword();
		});
		$("#password").keyup(function(){
			if($("#passwordcheck").val() != "")	checkpassword()
		});
		function checkpassword(){
			console.log($("#password").val() == $("#passwordcheck").val())
			if($("#password").val() == $("#passwordcheck").val()){
				$("#checkpassword").text("비밀번호가 일치합니다.")
				$("#checkpassword").css("color","blue")
				$("#chkpassword").val("true")
			} else {
				$("#checkpassword").text("비밀번호가 일치하지 않습니다.")
				$("#checkpassword").css("color","red")
				$("#chkpassword").val("false")
			}
		};
		$("#userid").on("change",function(){
			param = {"id": $("#userid").val()};
			
			$.ajax({
				type: 'GET',
				url: '/member/duplicatecheck',
				data: param,
				success: function(data){
					if(data > 0){
						$("#checkid").text("중복이되는 ID입니다. 다시 시도해주세요");
						$("#checkid").css("color","red");
						$("#chkid").val("false");
					} else {
						$("#checkid").text("사용이 가능한 ID입니다.");
						$("#checkid").css("color","blue");
						$("#chkid").val("true");
						console.log($("#chkid").val());
					}
						
				},
				error:function(error){
					console.log("서버 에러입니다. 지속적인 에러시 문의해 주세요")
				}
			})
		})
		$("#insertbutton").on("click",function(e){
			e.preventDefault();
			
			if($("#username").val() == ""){
				alert("name을 입력하지 않으셨습니다.")
				return;
				}
			if($("#chkid").val() == "false"){
				alert("id를 입력하지 않으셨거나 중복되는 id입니다.")
				return;
			}
			if($("#chkpassword").val() == "false"){
				alert("비밀번호를 입력하지 않으셨거나 일치하지 않은 비밀번호입니다.")
				return;
			}
			if($("#questionanswer").val() ==""){
				alert("질문에 대한 답변을 입력하지 않으셨습니다.")
				return;
			}
			if($("#userphone").val() == ""){
				alert("핸드폰번호를 입력하지 않으셨습니다.")
				return;
			}
			$("#insertform").submit()
			
		})
	</script>
</body>
</html>
<%@ include file="/WEB-INF/views/notice/footer.jsp"%>