<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		
		<!-- 스타일 -->
		<style type="text/css">
			table,tr,th,td {
				background: white;
			}
			.notice-integer{
				width: 10%;
			}
			.notice-title{
				width: 60%;
			}
			.notice-id{
				width: 10%;
			}
			.notice-date{
				width: 20%;
			}
			.nth {
				font-weight:bold;
				text-align: center;
			}
			.title {
				font-weight:bold;
			}
			
		</style>
	</head>
	<body>
	<!-- 제이쿼리 CDN -->
	<script
			src="https://code.jquery.com/jquery-3.2.1.min.js"
			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
			crossorigin="anonymous"></script>


		<!-- Header -->
			<header id="header" class="reveal">
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

		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div class="box">
							<div class="content">
								<h2 style="float:left" class="align-center">공지 사항</h2>
								<hr/>
								<table>
									<thead>
									<tr>
										<th class="title notice-title">${detail.ntitle}</th>
										<th class="nth notice-date"><fmt:formatDate  value="${detail.regdate}" pattern="yy-MM-dd HH:mm"/></th>
										<th class="nth notice-integer">hits : ${detail.nhits}</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td colspan="4">${detail.ncontent}</td>
									</tr>
									
									</tbody>
								</table>
							<input value="수정"  class="button special" onclick="location.href='update?nno=${detail.nno}'" type="button">
							<input value="삭제"  class="button special" onclick="location.href='delete?nno=${detail.nno}'" type="button">
							<input value="목록" style="float:right;" class="button special" onclick="location.href='list'" type="button">
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