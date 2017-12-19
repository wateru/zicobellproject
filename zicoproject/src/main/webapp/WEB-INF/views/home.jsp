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
				<div class="logo"><a href="#">B E L L<span>&nbsp;by Zico</span></a></div>
				<a href="#menu" class="toggle"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
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
		            $(this).css("background","#5AA6ED")
		        },
		        function () {
		            $(this).css("background","")
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


		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="/resources/images/pic01.jpg" alt="" />
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Lorem ipsum dolor</h2>
									<p>maecenas feugiat ex purus, quis volutpat lacus placerat</p>
								</header>
								<hr />
								<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
								<p>Vivamus fermentum nibh vel pharetra blandit. Cras a purus urna. Sed et libero ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse id hendrerit felis. Nulla viverra tempor dui at congue. Pellentesque quis nulla ornare, congue nisi id, finibus nulla. Aliquam sit amet hendrerit purus. Donec libero massa, posuere fermentum eros sit amet, maximus fringilla augue. Maecenas at rhoncus lorem. Vivamus ultricies consequat est, efficitur convallis libero. Vivamus rutrum semper mauris, vitae consequat eros tempor ac. Pellentesque et ornare sapien</p>
							</div>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<div id="flexgrid">
						<div>
							<header>
								<h3>Tempus Feugiat</h3>
							</header>
							<p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu</p>
							<ul class="actions">
								<li><a href="#" class="button alt">Learn More</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>Aliquam Nulla</h3>
							</header>
							<p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed </p>
							<ul class="actions">
								<li><a href="#" class="button alt">Learn More</a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>Sed Magna</h3>
							</header>
							<p>Suspendisse mauris. Fusce accumsan mollis eros. Pellentesque a diam sit amet mi ullamcorper vehicula.</p>
							<ul class="actions">
								<li><a href="#" class="button alt">Learn More</a></li>
							</ul>
						</div>
					</div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">

						<div>
							<div class="box">
								<div class="image fit">
									<img src="/resources/images/pic02.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>Lorem ipsum dolor</h2>
										<p>maecenas feugiat ex purus, quis volutpat lacus placerat</p>
									</header>
									<hr />
									<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
								</div>
							</div>
						</div>

						<div>
							<div class="box">
								<div class="image fit">
									<img src="/resources/images/pic03.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>Vestibulum sit amet</h2>
										<p>mattis sapien pretium tellus venenatis</p>
									</header>
									<hr />
									<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper style3">
				<div class="inner">

					<header class="align-center">
						<h2>Morbi interdum mollis sapien</h2>
						<p>Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada. Praesent in sem ex. Morbi mattis sapien pretium tellus venenatis, at egestas urna ornare.</p>
					</header>

				</div>
			</section>

		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div class="box">
							<div class="content">
								<h2 class="align-center">Get in Touch</h2>
								<hr />
								<form action="#" method="post">
									<div class="field half first">
										<label for="name">Name</label>
										<input name="name" id="name" type="text" placeholder="Name">
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input name="email" id="email" type="email" placeholder="Email">
									</div>
									<div class="field">
										<label for="dept">Department</label>
										<div class="select-wrapper">
											<select name="dept" id="dept">
												<option value="">- Category -</option>
												<option value="1">Manufacturing</option>
												<option value="1">Shipping</option>
												<option value="1">Administration</option>
												<option value="1">Human Resources</option>
											</select>
										</div>
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
									</div>
									<ul class="actions align-center">
										<li><input value="Send Message" class="button special" type="submit"></li>
									</ul>
								</form>
							</div>
						</div>
					</section>
					<div class="copyright">
						&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images <a href="https://unsplash.com/">Unsplash</a>. Video <a href="http://coverr.co/">Coverr</a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>