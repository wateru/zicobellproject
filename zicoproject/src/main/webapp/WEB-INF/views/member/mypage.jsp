<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>2차비밀번호답</th>
			<th>2차비밀번호</th>
			<th>핸드폰번호</th>
			<th>등급</th>
		</tr>
		<tr>
			<td>${member.mname}</td>
			<td>${member.mid}</td>
			<td>${member.mpassword}</td>
			<td>${member.mquestion}</td>
			<td>${member.mqpassword}</td>
			<td>${member.mphone}</td>
			<td>${member.mgrade}</td>
			
		</tr>
	
	</table>
</body>
</html>