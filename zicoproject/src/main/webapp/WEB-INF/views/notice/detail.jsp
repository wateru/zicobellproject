<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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
							<input value="수정"  class="button special admin-inlineblock" onclick="location.href='update?nno=${detail.nno}'" type="button">
							<input value="삭제"  class="button special admin-inlineblock" onclick="location.href='delete?nno=${detail.nno}'" type="button">
							<input value="목록" style="float:right;" class="button special" onclick="location.href='list'" type="button">
							</div>
						</div>
					</section>
					
<%@ include file="footer.jsp" %>