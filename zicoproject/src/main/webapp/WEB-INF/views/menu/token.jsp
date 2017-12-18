<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input class="fbtoken" type="text">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
	<iframe src="https://zicobell-654d2.firebaseapp.com/token"></iframe>
	
	<script type="text/javascript">
	

	
	
	var getToken=function token (currenttoken){
		$("fbtoken").val(currenttoken);
	}
	console.log(getToken);
	
	</script>
</body>
</html>