<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="manifest" href="/resources/assets/js/manifest.json">
    <link rel="manifest" href="/resources/assets/js/manifest.json">
</head>
<body>


<iframe src="https://zicobell-654d2.firebaseapp.com/token.html"></iframe>


	
	<div class="panel regPanel">
    메뉴:<input type="text" id="title"><br/>
    수량:<input type="text" id="content"><br/>
   토큰:<input type="text" id="token">
    <button id="saveBtn">주문하기</button>
</div>



<script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>




<script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
<script type="text/javascript" src="/resources/assets/js/server1.js"></script>

<script>
    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyCwssxVea8tlMBF30wiAxn5qZuZ9Qu5Rfk",
        authDomain: "zicobell-654d2.firebaseapp.com",
        databaseURL: "https://zicobell-654d2.firebaseio.com",
        projectId: "zicobell-654d2",
        storageBucket: "zicobell-654d2.appspot.com",
        messagingSenderId: "193093037078"
    };
    firebase.initializeApp(config);
</script>


<script>
//Retrieve Firebase Messaging object.
const messaging = firebase.messaging();
messaging.requestPermission()
.then(function() {
  console.log('Notification permission granted.');
  // TODO(developer): Retrieve an Instance ID token for use with FCM.
  // ...
})
.catch(function(err) {
  console.log('Unable to get permission to notify.', err);
});

/*
	test();
	
	function test() {
		var memoList=firebase.database().ref().child('/order');
        memoList.on("value",function (snapshot) {

            var list = snapshot.val();
            
            for(var i=1; i<list.length;i++){
            	consoel.log("순호 :" + list[i].token);
            }
        });
	};

    console.log(firebase);
  */
    function zico(token) {
		console.log(token)
		$("#token").val(token);
	}
    
    function readAllData() {
        var memoList=firebase.database().ref().child('/order');
        memoList.on("value",function (snapshot) {

            var listData=snapshot.val();
            for(keyStr in listData){
                console.log(keyStr);

                readEach(keyStr);
            }
        });
    }
    function readEach(keyStr) {
        var data = firebase.database().ref("/order/"+keyStr);
        data.on('value',function (snapshot){
            console.log(snapshot.val());
        });
    }
    readAllData();
    //    var sample = {name:"홍길동",age:16};
    //    firebase.database().ref("sample/user00").set(sample`);

    function createData(data,callback) {

        firebase.database().ref().child('order').push(data);
        //createData({title:'이것은 메모다...',regdate:new Date()});

    }
    /*
    function readAllData() {
        var orderList=firebase.database().ref().child('/order');
        orderList.on("value",function (snapshot) {

            var listData=snapshot.val();
            for(keyStr in listData){
                console.log(keyStr);
                readEach(keyStr);
            }
        });
    }
    function readEach(keyStr) {
        var data = firebase.database().ref("/order/"+keyStr);
        data.on('value',function (snapshot){
            console.log(snapshot.val());
        });
    }
    readAllData();
*/
    $("#saveBtn").on("click",function () {
        var order={메뉴:$("#title").val(), 수량:$("#content").val(),토큰:$("#token").val()};
        //  firebase.database().ref("order/orderNo").set(order);

        $("#title").val("")
        $("#content").val("");
    
        var key="AAAALPU97BY:APA91bH_7GDP62fw8aoN9l9shyc8dfywoWLFyviKVhihx07arUhROm0cq4CtuHB0kGYhzN8WY48C538Jr8g_v9yc2VXW5Z_y3qdi1tViFTscvhRy8ytUa1ZfkluDBPvAnIK4SaRQAS0e";
        var notification={'title':'지코반점',
            'body': "메뉴:"+order.메뉴+"수량:"+order.수량+"토큰:"+order.토큰 ,
            'icon':'firebase-logo.png',
            'click_action':'http://localhost:8081'};
		console.log('"'+$('#token').val()+'"');
		console.log($('#token').val())    
        var registrationToken="fOtCYfJsTLo:APA91bEuZnOnOhIHwpQMVH3qH7T2pzBixpB1pGsKJU6k96DThUcBgP2wEPxRZBN3x_1b5yU3ZyQQvOHAYsMpENc3pqtaSL04fkri2bjQ_vOpuwYjGhUbGq3JOnEOLDI8uBZ86PJq21EU";
		
  	
        fetch('https://fcm.googleapis.com/fcm/send', {
            'method': 'POST',
            'headers': {
                'Authorization': 'key=' + key,
                'Content-Type': 'application/json'
            },
            'body': JSON.stringify({
                'notification': notification,
                //'registration_ids': registrationToken
                //'to':'"'+$('#token').val()+'"'
                'to':registrationToken
           
            })

        }).then(function(response) {
            console.log(response);
        }).catch(function(error) {
            console.error(error);
        })

    });
</script>
</body>
</html>