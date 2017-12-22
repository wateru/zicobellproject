<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Transitive by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Transitive by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!-- 아이콘 script -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<style type="text/css">
			
			
		</style>
	</head>
	<body>
	<!-- 제이쿼리 CDN -->
	<script
			src="https://code.jquery.com/jquery-3.2.1.min.js"
			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
			crossorigin="anonymous"></script>


		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="/">B E L L<span>&nbsp;by Zico</span></a></div>
				<a href="#menu" class="toggle"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/">Home</a></li>
					<li><a href="/notice/list">Notice</a></li>
					<li><a href="/order/list">Order</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. /resources/images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="/resources/images/home-video-1">
				<div class="slide sli-left" style="z-index: 3; margin-right: 30px;">&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-left fa-4x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="inner sli" >
					<div id="slidebox">
					<ul id="slider">
						<li>
								<h1><b>1.</b>Transitive</h1>
								<p>A full responsive, business-oriented HTML5/CSS3 template<br />
								built by <a href="https://templated.co/">Templated</a> and released under the <a href="https://templated.co/license">Creative Commons</a>.</p>
								<a href="#one" class="button special scrolly">Get Started</a>
						</li>
						<li>
								<h1><b>2.</b>Transitive</h1>
								<p>A full responsive, business-oriented HTML5/CSS3 template<br />
								built by <a href="https://templated.co/">Templated</a> and released under the <a href="https://templated.co/license">Creative Commons</a>.</p>
								<a href="#one" class="button special scrolly">Get Started</a>
						</li>
						<li>
								<h1><b>3.</b>Transitive</h1>
								<p>A full responsive, business-oriented HTML5/CSS3 template<br />
								built by <a href="https://templated.co/">Templated</a> and released under the <a href="https://templated.co/license">Creative Commons</a>.</p>
								<a href="#one" class="button special scrolly">Get Started</a>
						</li>
						<li>
								<h1><b>4.</b>Transitive</h1>
								<p>A full responsive, business-oriented HTML5/CSS3 template<br />
								built by <a href="https://templated.co/">Templated</a> and released under the <a href="https://templated.co/license">Creative Commons</a>.</p>
								<a href="#one" class="button special scrolly">Get Started</a>
						</li>
					</ul>
					</div>
				</div>
				<div class="slide sli-right" style="z-index: 3; margin-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right fa-4x" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</div>
			</section>
			<!-- 슬라이드 스크립트 -->
			<!-- 슬라이드 스크립트 -->
			<script>
		    $(".slide").hover(function(){
		            $(this).css("color","#5AA6ED")
		        },
		        function () {
		            $(this).css("color","")
		        });
		
		    var x = $(".inner").width();
		    var slider = document.getElementById("slider");
		    var slideArray = slider.getElementsByTagName("li");
		    var slideMax = slideArray.length - 1;
		    var curSlideNo = 0;
		
		    for (i = 0; i <= slideMax; i++) {
		        if (i == curSlideNo) slideArray[i].style.left = 0;
		        else slideArray[i].style.left = -x + "px";
		    }
		
		    $(window).resize(function (){
		        x =$(".inner").width()
		    });
		
		    slider.addEventListener('click', function () {
		        nextSlide();
		    }, false);
		
		    var aniStart = false;
		    var next = 1;
		    var nextSlide = function(){
		        if (aniStart === true) return;
		        next = curSlideNo + 1;
		        if (next > slideMax) next = 0;
		        aniStart = true;
		        nextSliding();
		    }
		
		    var prevSlide = function(){
		        if (aniStart === true) return;
		        next = curSlideNo - 1;
		        if (next < 0) next = slideMax;
		        aniStart = true;
		        slideArray[next].style.left = x + "px";
		        prevSliding();
		    }
		
		    function prevSliding() {
		        var curX = parseInt(slideArray[curSlideNo].style.left, 10);
		        var nextX = parseInt(slideArray[next].style.left, 10);
		        var newCurX = curX - 10;
		        var newNextX = nextX - 10;
		        if (newNextX <= 0){
		            slideArray[curSlideNo].style.left = -x + "px";
		            slideArray[next].style.left = 0;
		            curSlideNo = curSlideNo - 1;
		            if (curSlideNo < 0) curSlideNo = slideMax;
		            aniStart = false;
		            return;
		        }
		        slideArray[curSlideNo].style.left = newCurX + "px";
		        slideArray[next].style.left = newNextX + "px";
		        setTimeout(function () {
		            prevSliding();
		        }, 7);
		    }
		    function nextSliding() {
		        var curX = parseInt(slideArray[curSlideNo].style.left, 10);
		        var nextX = parseInt(slideArray[next].style.left, 10);
		        var newCurX = curX + 10;
		        var newNextX = nextX + 10;
		        if (newCurX >= x) {
		            slideArray[curSlideNo].style.left = -x + "px";
		            slideArray[next].style.left = 0;
		            curSlideNo = curSlideNo + 1;
		            if (curSlideNo > slideMax) curSlideNo = 0;
		            aniStart = false;
		            return;
		        }
		        slideArray[curSlideNo].style.left = newCurX + "px";
		        slideArray[next].style.left = newNextX + "px";
		        setTimeout(function () {
		            nextSliding();
		        }, 7);
		    }
		    setInterval(nextSlide,10000);
		    $(".sli-right").on("click",function(){
		        nextSlide();
		    });
		    $(".sli-left").on("click",function(){
		        prevSlide();
		    });
		</script>


		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>