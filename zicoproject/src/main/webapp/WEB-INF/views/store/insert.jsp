<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp" %>
<link rel="stylesheet" type="text/css" href="../../../resources/assets/css/timepicki.css" />

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="header">
						<h4 class="title">신규 매장 등록</h4>
					</div>
					<div class="content">
						<form id="storeinsert" action="/store/postinsert" method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<label>Store-Name</label>
										<input type="text" class="form-control border-input" name="sname">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Category</label>
										<input type="text" class="form-control border-input" name="category">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8">
									<div class="form-group">
										<label>Address</label>
										<input type="text" class="form-control border-input" name="saddr">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Tel</label>
										<input type="text" class="form-control border-input" name="stel">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Open-Time</label>
										<input type="text" class="form-control border-input timepicker" name="openTime">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Close-Time</label>
										<input type="text" class="form-control border-input timepicker" name="closeTime">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Store-Image</label>
										<input type="file" id="simage" name="imgFile">
									</div>
								</div>
							</div>

							<div class="text-center">
								<button type="button" id="listBtn"
										class="btn btn-info btn-fill btn-wd">목록으로</button>
								<button type="submit" id="insertBtn"
										class="btn btn-info btn-fill btn-wd">매장등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="listForm" action="/store/list" method="get">
	<input type="hidden" name="page" value="${criteria.page}">
	<input type="hidden" name="size" value="${criteria.size}">
</form>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="../../../resources/assets/js/timepicki.js"></script>

<script>
	
	$(".timepicker").timepicki();
	
	$(document).ready(function() {
		
		$("#insertBtn").on("click", function(e) {
			e.preventDefault();
			console.log("Aaaa")
			$("#storeinsert").submit();
		});
		
		$("#listBtn").on("click", function() {
			$("#listForm").submit();
		});
		
	});
</script>

 <%@ include file="../admin/footer.jsp" %>