<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>
<style>
.fix {
	position: fixed;
}

.container {
	position: relative;
	width: 100%;
	display: inline-block;
	display: inline-block;
}

.heekyung {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.heekyungmiddle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%)
}

.container:hover .heekyung {
	opacity: 0.3;
}

.container:hover .heekyungmiddle {
	opacity: 1;
}

.heekyungtext {
	background-color: black;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
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

						<c:forEach items="${menu}" var="menu">
						<div class="container">
							<span class="image fit heekyung"><img
								src="displayFile?fileName=${menu.imgName}/" alt="" /></span>
							<div class="heekyungmiddle">
								<div class="heekyungtext">선택</div>
							</div>
						</div>
						<h3>
							<span>메뉴:${menu.menuName}</span> <span>가격:${menu.menuPrice}원</span>
						</h3>

						<hr>
						</c:forEach>

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

<!-- Four -->


<%@ include file="footer.jsp"%>

</body>
</html>