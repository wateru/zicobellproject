<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<style>
		.order{
			margin-top: 10px;
			margin-bottom: 10px;
			margin-left: 10px;
			display:inline;
			float:left;
		}
		.orderno{
			text-align:center;
			color: white;
			font-size: 20px;
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
					
					</div>
                </div>
            </div>
        </div>

<script type="text/javascript" src="<c:url value="/resources/assets/js/sockjs-0.3.4.js"/>"></script>
<script>

//message 기본틀 작성
// 1) 세션 ID정보 가져옴
<%	String no;
    no = session.getAttribute("storeno").toString(); 
    String storename;
    storename = session.getAttribute("storename").toString();%>
// 2) JSON 객체 생성 
	var obj = new Object();
// 3) ID json에 저장
	obj.no = "<%=no%>";
	var storename = "<%=storename%>"
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
    	if(speech["status"] == "cooking") {
    		$(".totorder " + "#" + speech["orderno"]).css("border","1px solid orange");
    		$(".totorder " + "#" + speech["orderno"] + " .orderno").css("background","orange");
    		$(".totorder " + "#" + speech["orderno"] + " .orderstatus").text("상태 : 조리중");
    		fcmmessage(speech["token"],storename,"조리중");
    		console.log($(".order"))
    		console.log($(".totorder #11"))
    	}
    	if(speech["status"] == "done") {
    		console.log($(".totorder " + "#" + speech["orderno"]))
    		$(".totorder " + "#" + speech["orderno"]).css("border","1px solid red");
    		$(".totorder " + "#" + speech["orderno"] + " .orderno").css("background","red");
    		$(".totorder " + "#" + speech["orderno"] + " .orderstatus").text("상태 : 조리완료");
    		fcmmessage(speech["token"],storename,"조리완료");
    		setTimeout(function() {
    			$(".totorder " + "#" + speech["orderno"]).remove();
    		}, 5000)
    	}
    }
    
    if (speech["message"] == "order") {
    	console.log("주문 받음")
    	
    	str=''
    	if(speech["status"] == "afterpay"){
	    	str += '<div class="order" id="'+ speech["orderno"] +'" style="border:1px solid green;">';
			str += '<div class="orderno" style="background:green">주문번호 : '+ speech["orderno"] +'</div>';

    	}
    	if(speech["status"] == "cooking"){
	    	str += '<div class="order" id="'+ speech["orderno"] +'" style="border:1px solid orange;">';
    		str += '<div class="orderno" style="background:orange">주문번호 : '+ speech["orderno"] +'</div>';
    	}
		str += '<ul>'
		for (var i = 0; i < speech["menulist"].length; i++){
 			str += '<li>'+speech["menulist"][i]["menu"]+ speech["menulist"][i]["count"] +'</li>'
		}
		str += '</ul>'
		str += '<div>인원수 : '+speech["people"]+'</div>'
		str += '<div class="orderstatus">상태 : '+status(speech["status"])+'</div>'
		str += '<div>총 가격 : '+speech["totalprice"]+'</div>'
		str += '</div>'
		$(".totorder").append(str);
    }
    // status 로 오면 status 처리
	if (speech["exit"] > 0) {
		$("#data").html("");
	}
}
function status(status) {
	if(status == "afterpay"){
		console.log("aa")
		return "결제완료";
	}
	if(status == "cooking"){
		console.log("bb")
		return "조리중";
	}
	if(status == "done"){
		console.log("cc")
		return "조리완료";
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

function fcmmessage(token,store,status) {
    var key = "AAAALPU97BY:APA91bH_7GDP62fw8aoN9l9shyc8dfywoWLFyviKVhihx07arUhROm0cq4CtuHB0kGYhzN8WY48C538Jr8g_v9yc2VXW5Z_y3qdi1tViFTscvhRy8ytUa1ZfkluDBPvAnIK4SaRQAS0e";
    var notification = {
        'title': store,
        'body': status,
        'icon': "https://namu.wiki/w/%ED%8C%8C%EC%9D%BC:%ED%8A%B8%EC%99%80%EC%9D%B4%EC%8A%A4.png",
        
        'click_action': 'https://192.168.0.241:8001/home'};
    var registrationToken = token;
    fetch('https://fcm.googleapis.com/fcm/send', {
        'method': 'POST',
        'headers': {
            'Authorization': 'key=' + key,
            'Content-Type': 'application/json'
        },
        'body': JSON.stringify({
            'notification': notification,
            'to': registrationToken
        })
    }).then(function (response) {
        console.log(response);
    }).catch(function (error) {
        console.error(error);
    })
}
</script>

<%@ include file="footer.jsp" %>
