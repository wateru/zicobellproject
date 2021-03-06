<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<title>Web Speech API Demo</title>

<% 	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<!-- <style>
    * {
        font-family: Verdana, Arial, sans-serif;
    }
    a:link {
        color:#000;
        text-decoration: none;
    }
    a:visited {
        color:#000;
    }
    a:hover {
        color:#33F;
    }
    .button {
        background: -webkit-linear-gradient(top,#008dfd 0,#0370ea 100%);
        border: 1px solid #076bd2;
        border-radius: 3px;
        color: #fff;
        display: none;
        font-size: 13px;
        font-weight: bold;
        line-height: 1.3;
        padding: 8px 25px;
        text-align: center;
        text-shadow: 1px 1px 1px #076bd2;
        letter-spacing: normal;
    }
    .center {
        padding: 10px;
        text-align: center;
    }
    .final {
        color: black;
        padding-right: 3px;
    }
    .interim {
        color: gray;
    }
    .info {
        font-size: 14px;
        text-align: center;
        color: #777;
        display: none;
    }
    .right {
        float: right;
    }
    .sidebyside {
        display: inline-block;
        width: 45%;
        min-height: 40px;
        text-align: left;
        vertical-align: top;
    }
    #headline {
        font-size: 40px;
        font-weight: 300;
    }
    #info {
        font-size: 20px;
        text-align: center;
        color: #777;
        visibility: hidden;
    }
    #results {
        font-size: 14px;
        font-weight: bold;
        border: 1px solid #ddd;
        padding: 15px;
        text-align: left;
        min-height: 150px;
    }
    #start_button {
        border: 0;
        background-color:transparent;
        padding: 0;
    }
</style> -->
<!-- <h1 class="center" id="headline">
    <a href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html">
        Web Speech API</a> Demonstration</h1> -->
<div id="info">
    <p id="info_start">다시 시도해주세요.</p>
    <p id="info_speak_now">말씀하세요.</p>
    <p id="info_no_speech">언어가 감지되지 않았습니다. 
        <a href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
            마이크 세팅</a>을 설정해야 합니다..</p>
    <p id="info_no_microphone" style="display:none">
        No microphone was found. Ensure that a microphone is installed and that
        마이크를 찾을 수 없습니다. 올바른 
        <a href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
            마이크 세팅</a> 을 확인하시려면 클릭하세요.</p>
    <p id="info_allow">Click the "Allow" button above to enable your microphone.</p>
    <p id="info_denied">마이크사용권한이 거부되었습니다.</p>
    <p id="info_blocked">마이크 사용권한이 거부되었습니다. 해당 경로에서 변경 할수 있습니다. chrome://settings/contentExceptions#media-stream</p>
    <p id="info_upgrade">최신 Chrome브라우저에서만 사용이 가능합니다. <a href="//www.google.com/chrome">Chrome</a>
        version 25 or later.</p>
</div>
<div class="right">
    <button id="start_button" onclick="startButton(event)">
        <img id="start_img" alt="Start"></button>
</div>
<div id="results">
    <span id="final_span" class="final"></span>
    <span id="interim_span" class="interim"></span>
    <p>
</div>
<div class="center">
<!--     <div class="sidebyside" style="text-align:right">
        <button id="copy_button" class="button" onclick="copyButton()">
            Copy and Paste</button>
        <div id="copy_info" class="info">
            Press Control-C to copy text.<br>(Command-C on Mac.)
        </div>
    </div>
    <div class="sidebyside">
        <button id="email_button" class="button" onclick="emailButton()">
            Create Email</button>
        <div id="email_info" class="info">
            Text sent to default email application.<br>
            (See chrome://settings/handlers to change.)
        </div>
    </div> -->
    <p>
    <div id="div_language">
        <select id="select_language" onchange="updateCountry()"></select>
        &nbsp;&nbsp;
        <select id="select_dialect"></select>
    </div>
    <div>
        <span id="result"></span>
    </div>
</div>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>
<script
    src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
    crossorigin="anonymous"></script>
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
    var langs = [['한국어',            ['ko-KR']]];

    //selectbox 활성화
    for (var i = 0; i < langs.length; i++) {
        select_language.options[i] = new Option(langs[i][0], i);
    }
    select_language.selectedIndex = 0;
    updateCountry();
    select_dialect.selectedIndex = 0;
    parent.guidemsg($('#info_start').text());
    // 국가 선택
    function updateCountry() {
        //
        for (var i = select_dialect.options.length - 1; i >= 0; i--) {
            select_dialect.remove(i);
        }
        var list = langs[select_language.selectedIndex];
        for (var i = 1; i < list.length; i++) {
            select_dialect.options.add(new Option(list[i][1], list[i][0]));
        }
        select_dialect.style.visibility = list[1].length == 1 ? 'hidden' : 'visible';
    }

    /* var create_email = false; */
    var final_transcript = '';
    var recognizing = false;
    var ignore_onend;
    var start_timestamp;

    //webkit 업그레이드
    if (!('webkitSpeechRecognition' in window)) {
        upgrade();
    } else {
        start_button.style.display = 'inline-block';
        var recognition = new webkitSpeechRecognition();
        recognition.continuous = true;
        recognition.interimResults = true;

        recognition.onstart = function() {
            recognizing = true;
            parent.guidemsg($('#info_speak_now').text());
            //start_img.src = 'mic-animate.gif';
        };

        //음성인식 에러시
        recognition.onerror = function(event) {
            if (event.error == 'no-speech') {
                //start_img.src = 'mic.gif';
                parent.guidemsg($('#info_no_speech').text());
                ignore_onend = true;
            }
            if (event.error == 'audio-capture') {
                //start_img.src = 'mic.gif';
                parent.guidemsg($('#info_no_microphone').text());
                ignore_onend = true;
            }
            if (event.error == 'not-allowed') {
                if (event.timeStamp - start_timestamp < 100) {
	                parent.guidemsg($('#info_blocked').text());
                } else {
                   parent.guidemsg($('#info_denied').text());
                }
                ignore_onend = true;
            }
        };

        recognition.onend = function() {
            recognizing = false;
            if (ignore_onend) {
                return;
            }
            //start_img.src = 'mic.gif';
            if (!final_transcript) {
            	parent.guidemsg($('#info_start').text());
                return;
            }
            showInfo('');
            if (window.getSelection) {
                window.getSelection().removeAllRanges();
                var range = document.createRange();
                range.selectNode(document.getElementById('final_span'));
                window.getSelection().addRange(range);
            }
            /* if (create_email) {
                create_email = false;
                createEmail();
            } */
        };

        // 음성인식 완료시
        recognition.onresult = function(event) {
            var interim_transcript = '';
            for (var i = event.resultIndex; i < event.results.length; ++i) {
                if (event.results[i].isFinal) {
                    final_transcript += event.results[i][0].transcript;
                    var json = { no: parent.storeno(), data: event.results[i][0].transcript};
                    var jsonData = JSON.stringify(json);
                    console.log(JSON.stringify(json));
                    $.ajax({
                        type: 'POST', //post,get,등..전송방식
                        url: '/admin/postorder',
                        contentType : 'application/json; charset=UTF-8',
                        dataType: 'json',//데이타 타입
                        data: JSON.stringify(json),
                        success: function(data){
                            console.log(firebase);
                            console.log(data);
                            function createData(data,callback) {
                                firebase.database().ref().child('order').push(data);}
                                var order={메뉴:data.data, 수량:data.data,주문시간:new Date()};
                                createData(order);      
                                parent.closespeech();
                        },
                        error: function(e){
                        	console.log(e);
                        	parent.closespeech();
                        	console.log("에러발생");
                        }
                    });
                    console.log("final : " + event.results[i][0].transcript)
                } else {
                    interim_transcript += event.results[i][0].transcript;
                    console.log("interim : " + event.results[i][0].transcript)
                }
            }
            final_transcript = capitalize(final_transcript);
            final_span.innerHTML = linebreak(final_transcript);
            interim_span.innerHTML = linebreak(interim_transcript);
            $()
            console.log(final_transcript);
            console.log(interim_transcript);

            if (final_transcript || interim_transcript) {
                showButtons('inline-block');
            }
            $("#final_span").text("");
        };
    }
    // 번역시작
    function startButton(event) {
        if (recognizing) {
            recognition.stop();
            return;
        }
        final_transcript = '';
        recognition.lang = select_dialect.value;
        recognition.start();
        ignore_onend = false;
        final_span.innerHTML = '';
        interim_span.innerHTML = '';
        //start_img.src = 'mic-slash.gif';
        parent.guidemsg($('#info_allow').text());
        showButtons('none');
        start_timestamp = event.timeStamp;
        console.log(event.timeStamp);
    }
    startButton(event);
    function upgrade() {
        start_button.style.visibility = 'hidden';
        parent.guidemsg($('#info_upgrade').text());
    }

    var two_line = /\n\n/g;
    var one_line = /\n/g;
    function linebreak(s) {
        return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
    }

    var first_char = /\S/;
    function capitalize(s) {
        return s.replace(first_char, function(m) { return m.toUpperCase(); });
    }

/*     function createEmail() {
        var n = final_transcript.indexOf('\n');
        if (n < 0 || n >= 80) {
            n = 40 + final_transcript.substring(40).indexOf(' ');
        }
        var subject = encodeURI(final_transcript.substring(0, n));
        var body = encodeURI(final_transcript.substring(n + 1));
        window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
    } */

/*     function copyButton() {
        if (recognizing) {
            recognizing = false;
            recognition.stop();
        }
        copy_button.style.display = 'none';
        copy_info.style.display = 'inline-block';
        showInfo('');
    } */

/*     function emailButton() {
        if (recognizing) {
            create_email = true;
            recognizing = false;
            recognition.stop();
        } else {
            createEmail();
        }
        email_button.style.display = 'none';
        email_info.style.display = 'inline-block';
        showInfo('');
    } */


/*     function showInfo(s) {
    	parent.guidemsg($("'#." + s + "'").text())
         if (s) {
            for (var child = info.firstChild; child; child = child.nextSibling) {
                if (child.style) {
                    child.style.display = child.id == s ? 'inline' : 'none';
                }
            }
            info.style.visibility = 'visible';
        } else {
            info.style.visibility = 'hidden';
        } 
    }
 */
    var current_style;
    function showButtons(style) {
        if (style == current_style) {
            return;
        }
        current_style = style;
        /* copy_button.style.display = style; */
        /* email_button.style.display = style; */
        /* copy_info.style.display = 'none'; */
        /* email_info.style.display = 'none'; */
        
    }
</script>
