<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<!-- Main Start-->
<!-- Main Start-->
<!-- Main Start-->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-server"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>일일 매출금액</p>
                                            	<span id="totprice" class="nostore"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big ic on-success text-center">
                                            <i class="ti-wallet"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>일일 주문량</p>
                                       	     <span id="totcount" class="nostore"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-calendar"></i> Last day
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-danger text-center">
                                            <i class="ti-pulse"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                        <p>일일 방문객</p>
                                            <span id="totpeople" class="nostore"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-timer"></i> In the last hour
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-info text-center">
                                            <i class="ti-twitter-alt"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>최다 판매 메뉴</p>
                                            <span id="menuname" class="nostore"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title nostore">일일 매출 금액</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                            <div class="content">
                            	<div id="chartprice" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title nostore">최다 판매 메뉴</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div>
                            <div id="donutchart">
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title nostore">일일 주문량 & 방문객</h4>
                                <p class="category">All products including Taxes</p>
                            </div>
                            <div id="chartpeople" style="width: 100%; height: 100%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- Main End-->
<!-- Main End-->
<!-- Main End-->

<script>
	/*로그인 버튼 유무  */
	$(document).ready(function() { 
		var sessionno = "${storeno}";
		var sessionid ="${id}";
		var sessiongrade = "${grade}";
		console.log(sessionno);
		if(sessionno > 0) {
			console.log("22")
			$(".newstore").css("display","none");
			$(".storeinfo").css("display","block");
		} else {
			console.log("11")
			$(".newstore").css("display","block");
			$(".storeinfo").css("display","none");
		}
	
	
	$("#aftersignin").on("click",function(){
		$("#logout").submit();	
	});
	console.log(sessionno);
	if(sessionno != ""){
		var chartOrder = ${chartOrder};
		var chartDetail = ${chartDetail};
		var totpeople = 0;
		var totcount = 0;
		var totprice = 0;
		chartArray = [];
		for(i = 0; i < chartOrder.length; i++){
			chartArray.push([ chartOrder[i]['time'],chartOrder[i]['people'],chartOrder[i]['count'] ]);
			totpeople += chartOrder[i]['people'];
			totcount += chartOrder[i]['count'];
		}
	      google.charts.load('current', {'packages':['line']});
	      google.charts.setOnLoadCallback(drawDetail);

	    function drawDetail() {
	      var data = new google.visualization.DataTable();
				data.addColumn('string','Time')
				data.addColumn('number','방문객');
				data.addColumn('number','주문량');
				 data.addRows(chartArray);
	      var materialOptions = {
		        chart: {
		        	'chartArea': {'width': '100%', 'height': '100%'}
		        },
		          /* curveType: 'function', */
		          /* legend: { position: 'bottom' } */
		        series: {
					0: {axis: 'people'},
					1: {axis: 'count'}
					},
		        axes: {
					y: {
						people: {label: 'people'},
						count: {side: 'right',label:'count'}
						}
					}
		        };
	      var chart = new google.charts.Line(document.getElementById('chartpeople'));
	      chart.draw(data, google.charts.Line.convertOptions(materialOptions));
	    }
	mainchartArray = [];

	for(i = 0; i < chartOrder.length; i++){
		mainchartArray.push([ chartOrder[i]['time'],chartOrder[i]['totalPrice']]);
		totprice += chartOrder[i]['totalPrice'];
	}
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var data = new google.visualization.DataTable();
			data.addColumn('string','Time')
			data.addColumn('number','Price');
			 data.addRows(mainchartArray);
        var options = {
          chart: {'chartArea': {'width': '100%', 'height': '100%'}},
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };
        var chart = new google.visualization.AreaChart(document.getElementById('chartprice'));

        chart.draw(data, options);
      }
      detailArray = [];
      tempArray = [];
      maxMenu = [];
      for(i = 1; i < chartDetail.length; i++){
    	  detailArray.push([ chartDetail[i]['menu'],chartDetail[i]['count'] ])
    	  if(tempArray.length == 0){
    		  tempArray.push(chartDetail[i]['menu']);
    		  tempArray.push(chartDetail[i]['count']);
    	  } 
    	  if(tempArray[1] < chartDetail[i]['count']){
    		  tempArray[0] = chartDetail[i]['menu'];
    		  tempArray[1] = chartDetail[i]['count'];
    	  }
    		  
      }
      console.log(detailArray)
	  google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(circleChart);
      function circleChart() {
    	  var data = new google.visualization.DataTable();
			data.addColumn('string','Time')
			data.addColumn('number',chartDetail[0]);
			 data.addRows(detailArray);

        var options = {
        		'chartArea': {'width': '100%', 'height': '100%'},
          pieHole: 0,
        };

      var donut = new google.visualization.PieChart(document.getElementById('donutchart'));
        donut.draw(data, options); 
      }
      
      $("#totprice").text("￦ " + totprice.toLocaleString())
      $("#totpeople").text(totpeople + " 개")
      $("#totcount").text(totcount + " 명")
      $("#menuname").text(tempArray[0])
      if($("#menuname").text() == ""){
    	  $("#menuname").text("No Data")
      }
	} else {
	$(".nostore").text("매장등록요망")
	}
	});
</script>



<%@ include file="footer.jsp" %>
