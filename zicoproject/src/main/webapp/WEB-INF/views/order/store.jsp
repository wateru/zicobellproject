<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<style>
	#map { width: 100%; height: 550px; }
</style>

<!-- One -->
<section id="one" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">

				<!-- Elements -->
				<h2 id="elements">Elements</h2>
				<div class="row 200%">
					<div class="6u 12u$(medium)">
					
						<c:forEach items="${store}" var="store">
						<span class="image fit heekyung"><img
								src="displayFile?fileName=${store.simage}/" alt="" /></span>
						<h3>
						<a href=mlist?sno=<c:out value='${store.sno}'/> class="target">
						<c:out value="${store.sname}" /></a></h3>
						
						
						<hr>
						</c:forEach>
					</div>
					
					
					
					
					
					
					<div class="6u 12u$(medium)">
						
						<div id="map"></div>
							
						
					</div>

				</div>
			</div>
		</div>
	</div>
	<form id="listForm" action="/order/mlist" method="get">
	<input type="hidden" name="sno">
	</form>
</section>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7f42c5fca86621564f323cf9ba41c4e&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map');
var mapOption = { center: new daum.maps.LatLng(33.450701, 126.570667), level: 3};
var listForm = $("#listForm");

var map = new daum.maps.Map(mapContainer, mapOption);
var geocoder = new daum.maps.services.Geocoder();

geocoder.addressSearch('', function(values, status) {
	if(status === daum.maps.services.Status.OK) {
		var coords = new daum.maps.LatLng(values[0].y, values[0].x);
		 
		var marker = new daum.maps.Marker({
			map: map,
			position: coords
		});
		
		map.setCenter(coords);
	}
});


$(".target").on("click", function(e) {
	e.preventDefault();

	var sno = $(this).attr("href");
	
	listForm.find("input[name='sno']").val(sno);
	listForm.attr("action", "/order/mlist").submit();
	
});
</script>
<!-- Four -->


<%@ include file="footer.jsp"%>

</body>
</html>