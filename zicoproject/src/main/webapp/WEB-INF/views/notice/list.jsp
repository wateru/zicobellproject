<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			table,th,td {
				background: white;
				text-align: center;
			}
			.notice-integer{
				width: 10%;
			}
			.notice-title{
				padding-top: 20px;
				width: 50%;
			}
			.notice-id{
				width: 10%;
			}
			.notice-date{
				width: 20%;
			}
			tr:hover td{
				background-color: #D7DBDD;
			}
			.nth {
				font-weight:bold;
				text-align: center;
			}
			.ntitle{
				text-align: left;
				padding-left: 0.75rem;
			}
			.ntitle a:link { color: black; text-decoration: none;}
			.ntitle a:visited { color: #884EA0; text-decoration: none;}
			.pagination {
			    display: inline-block;
			}
			
			.pagination a {
			    color: black;
			    float: left;
			    padding: 8px 16px;
			    text-decoration: none;
			    transition: background-color .3s;
			}
			
			.pagination a.active {
			    background-color: #5AA6ED;
			    color: white;
			}
			
			.pagination a:hover:not(.active) {background-color: #ddd;}

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

			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yy-MM-dd" /></c:set> 
			
		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div style="min-height:60%;" class="box">
							<div class="content">
								<div>
								<h2 style="font-weight:bold; float:left" class="align-center">공지 사항</h2>
								<br>
								<br>
								
								<table style=" border-top: 1px solid #E3E3E3">
									<thead>
										<tr>
											<th class="nth notice-integer">No</th>
											<th class="nth notice-title">Title</th>
											<th class="nth notice-id">id</th>
											<th class="nth notice-date">Date</th>
											<th class="nth notice-integer">Hits</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${list}" var="list">
							            <tr>
							                <td>${list.nno}</td>
							                <td class="ntitle"><a style="" href="/notice/detail?nno=${list.nno}">${list.ntitle}</a></td>
							                <td>${list.nid}</td>
							                <td class="regdate">
							                	<c:set var="javaYear"><fmt:formatDate  value="${list.regdate}" pattern="yy-MM-dd"/></c:set>
								                	<c:choose>
								                	<c:when test="${sysYear == javaYear}">
								                		<c:set var="sysTime"><fmt:formatDate  value="${list.regdate}" pattern="HH:mm"/></c:set>
								                		<c:out value="${sysTime}"/>
								                	</c:when>
													<c:otherwise>
														<c:out value="${sysYear}"/>
													</c:otherwise>
												</c:choose>										
							                </td>
							                <td>${list.nhits}</td>
							            </tr>
						            </c:forEach>
									</tbody>
								</table>
									<div class="pagination" style="float: center">
										  <a href="#">&laquo;</a>
										  <a href="1">1</a>
										  <a href="2" class="active">2</a>
										  <a href="3">3</a>
										  <a href="4">4</a>
										  <a href="5">5</a>
										  <a href="6">6</a>
										  <a href="#">&raquo;</a>
									</div>
								</div>
							<input value="등록" class="button special" onclick="location.href='/notice/insert'" type="button">
							</div>
						</div>
					</section>
					<script src="/resources/assets/js/pagination.js"></script>			
					<script type="text/javascript">
					  $(document).ready(function() {
						str='';
					    var pageResult = makePage({ page:${criteria.page}, size:${criteria.size}, total:${total} });
					    if(pageResult.prev){
					    	str += "<a href="+ (pageResult.first - 1) +">&laquo;</a>";
					    }
					   	for(var i = pageResult.first; i <= pageResult.last; i++){
					   		str += "<a " + (pageResult.page == i ? "class='active'":"") + "href=/notice/list/"+i+">"+i+"</a>";
					   	}
					   	if(pageResult.next){
					   		str += "<a href="+ (pageResult.last + 1) +">&raquo;</a>";
					   	}
					   	$(".pagination").html(str);
					  });
					</script>	
					<script type="text/javascript">
					</script>
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