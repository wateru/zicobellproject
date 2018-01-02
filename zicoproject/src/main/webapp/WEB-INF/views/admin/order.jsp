<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<style>
		
	</style>
	<div class="guide"></div>
	<div class="talking"></div>
	<img class="micimg" src="/resources/assets/img/Mic-Animation.gif">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                	<div class="speech"></div>
					<div class="order" style="border:1px solid black;">
			                        재익
			                        하이
			                        안녕
                    </div>				
					<div class="order" style="border:1px solid black;">
			                        재익
			                        하이
			                        안녕
                    </div>				
					<div class="order" style="border:1px solid black;">
			                        재익
			                        하이
			                        안녕
                    </div>				
					<div class="order" style="border:1px solid black;">
			                        재익
			                        하이
			                        안녕
                    </div>				
                </div>
            </div>
        </div>

<script type="text/javascript" src="<c:url value="/resources/assets/js/sockjs-0.3.4.js"/>"></script>
<script>

//message 기본틀 작성
// 1) 세션 ID정보 가져옴
<%	String no;
    no = session.getAttribute("storeno").toString(); %>

// 2) JSON 객체 생성 
	var obj = new Object();
// 3) ID json에 저장
	obj.no = "<%=no%>";
console.log(obj);
// message 기본틀 작성 종료

var sock;

//웸소켓을 지정한 url로 연결한다.
sock = new SockJS("<c:url value="/echo"/>");

//자바스크립트 안에 function을 집어넣을 수 있음.
//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
sock.onmessage = onMessage;

//데이터를 끊고싶을때 실행하는 메소드
sock.onclose = onClose;

//소켓 처음 연결시 바로 실행되는 function
sock.onopen = function(){
	obj.first = "true";
	var json = JSON.stringify(obj);
    sock.send(json);
    obj.first = "";
};

// 메시지 전달 Function
function sendMessage() {
    /*소켓으로 보내겠다.  */
	console.log("send : " + typeof $("#message").val())
	sock.send($("#message").val());
}

//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
function onMessage(evt) {
    var data = evt.data;
	console.log(data);
    if (data.search("btn") > 0) {
		console.log( $("iframe").length)
		if ($("iframe").length == 0) {
			console.log("생성")
			$(".talking").append("<iframe width='0' height='0' frameborder='0px' src='https://192.168.0.241:8001/admin/speech'></iframe>");
			$(".guide").text("말씀해주세요.");			
			$(".micimg").css("display","block");
			$(".guide").css("display","block");
		} else {
			console.log("안됨")
			$(".talking").html("");
			$(".guide").css("display","none");
			$(".micimg").css("display","none");
		}
	} 
	if (data.search("exit") > 0) {
		$("#data").html("");
	}
}

function onClose(evt) {
    $("#data").append("연결 끊김");
}

var closespeech = function() {
	$(".talking").html("");
	$(".guide").css("display","none");
	$(".micimg").css("display","none");
}

var guidemsg = function(message) {
	$(".guide").text(message)	
}


$(document).ready(function() {
    var json = JSON.stringify(obj);
    console.log(json);

});
</script>

<%@ include file="footer.jsp" %>
