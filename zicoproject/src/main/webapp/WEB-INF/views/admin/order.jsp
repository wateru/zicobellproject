<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<style>
		.order{
		margin-top: 10px;
		margin-bottom: 10px;
		}
		p{
			display: inline-block;
		}
	</style>
	<div class="guide"></div>
	<div class="talking"></div>
	<img class="micimg" src="/resources/assets/img/Mic-Animation.gif">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                	<div class="speech"></div>
                	<div class="totorder">
					<div class="order" id="10" style="border:1px solid green;">
					<p>주문번호 : 10</p>
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
					</div>
					<div class="order" id="11" style="border:1px solid green;">
					<p>주문번호 : 11</p>
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
					</div>
					<div class="order" id="12" style="border:1px solid green;">
					<p>주문번호 : 12</p>
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
					</div>
					<div class="order" id="13" style="border:1px solid green;">
					<p>주문번호 : 13</p>
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
					</div>
					<div class="order" id="14" style="border:1px solid green;">
					<!-- <p>주문번호 : 14</p> -->
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
						<!-- <p>인원수: 1</p>
						<p>상태: 결제완료</p>
						<p>총 가격: 71000</p> -->
					</div>
					<div class="order" id="15" style="border:1px solid green;">
					
					<p>주문번호 : 15</p>
						<ul>
							<li>재익</li>
							<li>재익</li>
							<li>재익</li>
						</ul>
					</div>
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

// 메시지가 왔을떄
// 1. 버튼 눌렀을 때
function onMessage(evt) {
    /* var data = evt.data; */
    var speech = eval( "("+ evt.data +")" );
    console.log(speech)
   
    if (speech["message"] == "btn") {
		console.log( $("iframe").length)
		if ($("iframe").length == 0) {
			console.log("iframe 생성")
			$(".talking").append("<iframe width='0' height='0' frameborder='0px' src='https://192.168.0.241:8001/admin/speech'></iframe>");
			$(".guide").text("말씀해주세요.");			
			$(".micimg").css("display","block");
			$(".guide").css("display","block");
		} else {
			console.log("iframe 제거")
			$(".talking").html("");
			$(".guide").css("display","none");
			$(".micimg").css("display","none");
		}
	} 
    if (speech["message"] == "status") {
    	console.log("음성 상태")
    	if(speech["status"] == "조리중") {
    		$(".totorder " + "#" + speech["orderno"]).css("border","1px solid yellow")
    		console.log($(".order"))
    		console.log($(".totorder #11"))
    	}
    	if(speech["status"] == "조리완료") {
    		console.log($(".totorder " + "#" + speech["orderno"]))
    		$(".totorder " + "#" + speech["orderno"]).css("border","1px solid red")
    		setTimeout(function() {
    			$(".totorder " + "#" + speech["orderno"]).remove();
    		}, 5000)
    	}
    	
    }
    if (speech["message"] == "order") {
    	console.log("주문 받음")
    	
    	str=''
    	str += '<div class="order" id="'+ speech["orderno"] +'" style="border:1px solid green;">';
		str += '<div>주문번호 : '+ speech["orderno"] +'</div>';
		str += '<ul>'
		for (var i = 0; i < speech["menulist"].length; i++){
 			str += '<li>'+speech["menulist"][i]["menu"]+ speech["menulist"][i]["count"] +'</li>'
		}
		str += '</ul>'
		str += '<div>인원수 : '+speech["people"]+'</div>'
		str += '<div>상태 : '+speech["status"]+'</div>'
		str += '<div>총 가격 : '+speech["totalprice"]+'</div>'
		str += '</div>'
		$(".totorder").append(str);
    } 
    // status 로 오면 status 처리
	if (speech["exit"] > 0) {
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

var storeno = function(){
	return "<%=no%>";
}

$(document).ready(function() {
    var json = JSON.stringify(obj);
    console.log(json);

});
</script>

<%@ include file="footer.jsp" %>
