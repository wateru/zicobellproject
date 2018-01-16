<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input class="token" type="text" value="${token}" >
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	//console.log($(".token").val());
	console.log("---------------------")
	var token = "${token}";
		console.log("왜**")
	if(token == ""){
		parent.parent.newwindow()
		console.log("왜???")
	} else{
		console.log("왜!!!")
		parent.parent.zico($(".token").val())		
	}
	
})
</script>
</body>
</html>