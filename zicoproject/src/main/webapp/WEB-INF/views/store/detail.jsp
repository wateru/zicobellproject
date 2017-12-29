<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin/header.jsp"%>

<style>
	#map { width: 100%; height: 550px; }
</style>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-8 col-md-6">
				<div class="card card-user">
					<div id="map"></div>
				</div>
			</div>
			<div class="col-lg-8 col-md-6">
				<div class="card">
					<div class="header">
						<h4 class="sname">
							<c:out value="${store.sname}" />
						</h4>
					</div>
					<div class="content">
						<form>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Category</label>
										<input type="text" class="form-control border-input" name="category"
											   value="<c:out value='${store.category}' />" readonly onfocus="this.blur();">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Address</label>
										<input type="text" class="form-control border-input" name="saddr"
											   value="<c:out value='${store.saddr}'/>" readonly onfocus="this.blur();">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Tel</label>
										<input type="text" class="form-control border-input" name="stel"
											   value="<c:out value='${store.stel}'/>" readonly onfocus="this.blur();">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Open-Time</label>
										<input type="text" class="form-control border-input" name="openTime"
											   value="<c:out value='${store.openTime}'/>" readonly onfocus="this.blur();">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Close-Time</label>
										<input type="text" class="form-control border-input" name="closeTime"
											   value="<c:out value='${store.closeTime}'/>" readonly onfocus="this.blur();">
									</div>
								</div>
							</div>

							<div class="text-center">
								<button id="listBtn"
										class="btn btn-info btn-fill btn-wd">목록으로</button>
								<button id="updateBtn"
										class="btn btn-info btn-fill btn-wd">매장 정보 수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="listForm" action="/store/list" method="get">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="size" value="${cri.size}">
</form>

<form id="updateForm" action="/store/update" method="get">
	<input type="hidden" name="sno" value="${store.sno}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="size" value="${cri.size}">
</form>

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f42c5fca86621564f323cf9ba41c4e&libraries=services"></script>

<script>

	var mapContainer = document.getElementById('map');
	var mapOption = { center: new daum.maps.LatLng(33.450701, 126.570667), level: 3};
	
	var map = new daum.maps.Map(mapContainer, mapOption);
	var geocoder = new daum.maps.services.Geocoder();
	
	geocoder.addressSearch('${store.saddr}', function(values, status) {
		if(status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(values[0].y, values[0].x);
			 
			var marker = new daum.maps.Marker({
				map: map,
				position: coords
			});
			
			map.setCenter(coords);
		}
	});
		
	$(document).ready(function() {
		
		$("#listBtn").on("click", function(e) {
			e.preventDefault();
			$("#listForm").submit();
		});
		
		$("#updateBtn").on("click", function(e) {
			e.preventDefault();
			$("#updateForm").submit();
		});

	});
</script>

<%@ include file="../admin/footer.jsp"%>