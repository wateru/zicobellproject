<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		
		<!-- 스타일 -->
		<style type="text/css">
			table,tr,th,td {
				background: white;
			}
			.notice-integer{
				width: 10%;
			}
			.notice-title{
				width: 50%;
			}
			.notice-id{
				width: 10%;
			}
			.notice-date{
				width: 20%;
			}
		</style>
		
		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div class="box">
							<div class="content">
								<h2 class="align-center">공지 사항</h2>
								<hr />
								<form action="postupdate" method="post">
									<div class="field">
										<input name="nno" type="hidden" value="${update.nno}">
										<label for="email">Title</label>
										<input name="ntitle" id="email" type="text" placeholder="Title" value="${update.ntitle}">
									</div>
									
									<div class="field">
										<label for="ncontent">Contents</label>
										<textarea name="ncontent" id="message" rows="12" placeholder="Contents" value="${update.ncontent}">${update.ncontent}</textarea>
									</div>
									<ul class="actions align-center">
										<li><input value="등록" class="button special" type="submit"></li>
										<li><input value="취소" class="button special" type="submit"></li>
									</ul>
								</form>
							</div>
						</div>
					</section>
<%@ include file="footer.jsp" %>