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
		<script>
		$(document).ready(function(){
			id = "${id}";
			$("#nid").val(id);	
			console.log(id);
		})
			
		</script>
		<!-- Footer -->
			<footer id="footer" class="wrapper">
				<div class="inner">
					<section>
						<div class="box">
							<div class="content">
								<h2 class="align-center">공지 사항</h2>
								<hr />
								<form action="postinsert" method="post">
									<div class="field">
										<label for="email">Title</label>
										<input name="ntitle" type="text" placeholder="Title">
										<input id="nid" name="nid" type="hidden">
									</div>
									
									<div class="field">
										<label for="ncontent">Contents</label>
										<textarea name="ncontent" rows="12" placeholder="Contents"></textarea>
									</div>
									<ul class="actions align-center">
										<li><input style="display:none" value="등록" class="button special admin-inlineblock" type="submit"></li>
										<li><input style="display:none" value="취소" class="button special admin-inlineblock" type="submit"></li>
									</ul>
								</form>
							</div>
						</div>
					</section>
<%@ include file="footer.jsp" %>