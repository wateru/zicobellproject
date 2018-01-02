<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>
<style>
.fix {
	position: fixed;
}
</style>
<!-- One -->
<section id="one" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">

				<!-- Elements -->
				<h2 id="elements">Elements</h2>
				<div class="row 200%">

					<div class="8u 12u$(medium)">
						<form method="post" action="#">
							<div class="12u$ 12u$(xsmall)">

								<span>인원수<input type="text" value=""
									placeholder="인원수를 작성해주세요" /></span> <span>예약자<input
									type="text" value="" placeholder="예약 성함을 작성해주세요" /></span> <span>예약
									시간<input type="text" value="" placeholder="예약 시간을 작성해주세요" />
								</span> <span>결재 수단
									<div class="select-wrapper">

										<select name="demo-category" id="demo-category">
											<option value="">결재 방법</option>
											<option value="1">방문후 결재</option>
											<option value="1">지금결재</option>
										</select>
									</div>
								</span>
							</div>
							<iframe style="visibility: hidden; display: none;" src="https://zicobell-654d2.firebaseapp.com/token.html"></iframe>
							<input type="hidden" id="token">
							<br>
							<div class="12u$">
								<ul class="actions">
									<li><input type="submit" value="주문 하기" /></li>
								</ul>
							</div>
							
						</form>
					</div>

					<div class="4u 12u$(medium)">
						<div>
							<div class="table-wrapper  fix" style="border: 1px solid black">
								<table>
									<thead>
										<tr>
											<th>Name</th>
											<th>Description</th>
											<th>Price</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Item 1</td>
											<td>Aar.</td>
											<td>29.99</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<script>
function zico(token) {
	console.log(token)
	$("#token").val(token);
}

</script>
<!-- Four -->


<%@ include file="footer.jsp"%>

</body>
</html>