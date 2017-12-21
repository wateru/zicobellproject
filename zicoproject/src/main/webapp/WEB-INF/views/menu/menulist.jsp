<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../admin/header.jsp" %>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
					<c:forEach items="${menu}" var="menu">
							<div class="col-lg-4 col-md-5">
								<div class="card card-user">
									<div class="image">
										<img src="/resources/assets/img/1.PNG" alt="..." />
									</div>
									 <div class="author">
                                  <img class="avatar border-white" src="displayFile?fileName=${menu.imgName}/" alt="..."/>
                                  <h4 class="title">${menu.menuName}<br/>
                                     <a href="#"><small>${menu.menuPrice}</small></a>
                                  </h4>
                                </div>
									
									<hr>
									<div class="text-center">

										<div class="row">
											<div class="col-md-5 col-md-offset-1">
												<form action=/menu/menuupdate method="get">
													<input type="hidden" value="${menu.menuNo}" name="menuNo">
													<button type="submit" class="btn btn-info btn-fill btn-wd">수정</button>
												</form>
											</div>

											<div class="col-md-5">
												<form action="/menu/delete" method="post">
													<button type="submit" class="btn btn-info btn-fill btn-wd">삭제</button>
													<input type="hidden" value="${menu.menuNo}" name="menuNo">
												</form>
											</div>

										</div>

									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<form action="/menu/menuinsert" method="get">
						<button type="submit" class="btn btn-info btn-fill btn-wd">등록</button>
					</form>
					<div class="paging">
	                        	<ul class="pagination mypage"></ul>
					</div>
				</div>
			</div>
			<script src="/resources/assets/js/pagination.js"></script>
              <script>
    $(document).ready(function() {
    	 
    
    	
	    var result = "${result}";
	    
	    var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}});
	    
	   
	    var actionForm = $("#actionForm");
	    
	    
	  
	    $(".mypage").on("click", "li > a", function(event) {
	    	event.preventDefault();
	    	
	    	var pageNum = $(this).attr("href");
	    	
	    	// alert("PAGE: " + pageNum);
	    	actionForm.find("input[name='page']").val(pageNum);
	    	actionForm.submit();
	    });
	    
	    var str = "";
	    
	    if(pageResult.prev) {
	    	str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.first) - 1) + ">prev </a></li>";
	    };
	    
	    for(var i = pageResult.first; i <= pageResult.last; i++) {
	    	str += "<li class='page-item " + (pageResult.page == i ? "active" : "") + "'><a class='page-link' href=" + i + ">" + i + "</a></li>";
	    };
	
	    if(pageResult.next) {
	    	str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.last) + 1) + ">Next </a></li>";
	    };
	    
	    console.log(str);
	    
	    $(".mypage").html(str);
	
	    console.log(pageResult);
	    
	   
    });
    </script>

</body>

</html>
             

<%@ include file="../admin/footer.jsp" %>
