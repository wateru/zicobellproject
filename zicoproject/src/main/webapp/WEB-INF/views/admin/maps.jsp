<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		<div class="content">
            <div class="container-fluid">
                <div class="card card-map">
					<div class="header">
                        <h4 class="title">Google Maps</h4>
                    </div>
					<div class="map">
						<div id="map"></div>
					</div>
				</div>
			</div>
		</div>
<script>
        $().ready(function(){
            demo.initGoogleMaps();
        });
</script>
<%@ include file="footer.jsp" %>