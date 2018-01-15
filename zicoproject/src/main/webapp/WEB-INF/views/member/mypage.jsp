<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/notice/header.jsp" %>
<style>

	.total_body{
	border: 1px solid;
    padding: 10px;
    max-width: 1930px;
    max-height: 870px;
    text-align: left;
    background: #71eca2;
    margin-left: 30%;
    margin-right: 30%;
	}
	
	.line{
		background:yellow;
	
	}
	@media(max-width: 2000px){
	 .dataline{
		 display: inline;
    	 font-size: 1.5rem;
    		  }
	}
	
	@media(max-width: 1000px){
	 .dataline{
		 display: inline;
    	 font-size: 1rem;
    		  }
	}
	
/* 	.dataline{
	 display: inline;
     font-size: 1.5rem;
	} */
	.name{
	
	}
	
	
</style>
		
		<div class="total_body">
			<div class="nameup">
			<div class="dataline" style=""><img class="name" style="width:6%; " src="/resources/assets/img/user-name.png"> </div><div style="width:50%;" class="dataline">${member.mname}</div><br>			
			</div>
			<br>
			<div class="nameup">
			<div class="dataline" style=""><img class="name" style="width:6%;" src="/resources/assets/img/id.png"> </div><div style="width:50%;" class="dataline">${member.mid}</div><br>			
			</div><div class="nameup">
			<br>
			<div class="dataline" style=""><img class="name" style="width:6%;" src="/resources/assets/img/phone.png"> </div><div style="width:50%;" class="dataline">${member.mphone}</div><br>			
			</div><div class="nameup">
			<br>
			<div class="dataline" style=""><img class="name" style="width:6%;" src="/resources/assets/img/grade.png"> </div><div style="width:50%;" class="dataline">${member.mgrade}</div><br>			
			</div>
			
			
			<a>수정</a>
		
			
			
			<div style="width:32%;"></div>
		
		
		
		
		
		</div>
	

<%@ include file="/WEB-INF/views/notice/footer.jsp" %>