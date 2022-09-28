<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include 제거  -->
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<h3 class="hanna p-2" style="text-align: center;">사용자 통계</h3>

<!-- Bar Chart1 -->
<div class="container justify-content-center">

	<div class="row row-cols-2 ">
		<div class="col">
			<div class="card shadow mb-4">
				<div class="card-header py-3 mb-3">
					<h6 class="m-0 font-weight-bold text-primary">작월 사용자이용 통계</h6>
				</div>
				<div class="card-body mb-4" style="height: 300px;">
					<div class="chart-bar" style="height: 100%;">
						<canvas id="myBarChart"></canvas>
					</div>
					<hr>
				</div>
			</div>
		</div>
		<div class="col">
			<!-- Bar Chart2 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3 mb-3">
					<h6 class="m-0 font-weight-bold text-primary">과별 병원 이용 통계</h6>
				</div>

				<div class="card-body mb-4" style="height: 300px;">
					<div class="chart-bar" id="graph-container" style="height: 100%;">
						<!--<canvas id="myBarChart2" width="591" height="150"></canvas>-->
					</div>
					<hr>

				</div>
			</div>
		</div>
	</div>
	<!-- Donut Chart -->
	<div class="container">
		<div class="row">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">전국 병원</h6>
			</div>
			<div>
				<input type="button" value="click" id="jsonLoad"
					style="display: none;">
			</div>
			<div class="card-body">
				<!-- <div id="target"></div> -->
				<div class="chart-bar">
					<div id="chart1"></div>

				</div>
			</div>
		</div>
	</div>
	</div>

</div>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>

<!-- c3 -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="/taejin/vendor/jquery/jquery.min.js"></script>
<script src="/taejin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/taejin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/taejin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/taejin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/taejin/js/demo/chart-area-demo.js"></script>
<script src="/taejin/js/demo/chart-pie-demo.js"></script>
<script src="/taejin/js/demo/chart-bar-demo.js"></script>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
//Bar Chart Example


var chk=0;
var ctx = document.getElementById("myBarChart");
var ctx2 = document.getElementById("myBarChart2");
$.ajax({
	url:'${pageContext.request.contextPath}/admin/adminBarchart',
	type:'get',
	success:function(data){
		console.log('data ' ,data)
			var labels =[];
			var datas = [];
		for(var i of data){
			labels.push(i.hvo.hcate)
			datas.push(i.r_num)
		}
		
var config = {
		  type: 'bar',
		  data: {
		    labels: labels,
		    datasets: [{
		      label: "Revenue",
		      backgroundColor: "#4e73df",
		      hoverBackgroundColor: "#2e59d9",
		      borderColor: "#4e73df",
		      data: datas,
		    }],
		  },
		  options: {
			  onClick: function(point, event){  //--- 클릭이벤트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		    	  $('#graph-container').html('<canvas id="myBarChart2" width="591" height="150"></canvas>');
		    	 
		        console.log('event : ', event[0]._model.label);
		        var hcate = event[0]._model.label
		        console.log('hcate : ' , hcate)
		        
		        
		       $.ajax({
		    	   url:'${pageContext.request.contextPath}/admin/adminBarchart2?hcate='+hcate,
		    	   type:'GET',
		    	   success:function(data){
		    		   myBarChart = null;
		    		   ctx2 = null;
		    		   console.log('event = ' ,data)
		    		   console.log(data[0].hname)
		    		   console.log(data[0].doctorVO[0].reserveVO[0].r_num)
		    		   
		    		   var labels2 =[];
		    		   var datas2 =[];
		    		   for(var e of data){
		    			    labels2.push(e.hname);
		    		   		console.log('e.hname = ' ,e.hname)
		    			   datas2.push(e.doctorVO[0].reserveVO[0].r_num);
		    			   
		    		   }
		    		  var ctx2 = document.getElementById("myBarChart2");
		    		 
		    		    myBarChart = new Chart(ctx2, {
		    			   type: 'bar',
		    			   data: {
		    			     labels: labels2,
		    			     datasets: [{
		    			       label: "Revenue",
		    			       backgroundColor: "#4e73df",
		    			       hoverBackgroundColor: "#2e59d9",
		    			       borderColor: "#4e73df",
		    			       data: datas2,
		    			     }],
		    			   },
		    			   options: {
		    			     maintainAspectRatio: false,
		    			     layout: {
		    			       padding: {
		    			         left: 10,
		    			         right: 25,
		    			         top: 25,
		    			         bottom: 0
		    			       }
		    			     },
		    			     scales: {
		    			       xAxes: [{
		    			         time: {
		    			           unit: 'month'
		    			         },
		    			         gridLines: {
		    			           display: false,
		    			           drawBorder: false
		    			         },
		    			         ticks: {
		    			           maxTicksLimit: 6,
		    			          
		    			         },
		    			         maxBarThickness: 25,
		    			       }],
		    			       yAxes: [{
		    			         ticks: {
		    			           min: 0,
		    			           max: 20,
		    			           maxTicksLimit: 5,
		    			           padding: 10,
		    			           // Include a dollar sign in the ticks
		    			           callback: function(value, index, values) {
		    			             return  number_format(value);
		    			           }
		    			         },
		    			         gridLines: {
		    			           color: "rgb(234, 236, 244)",
		    			           zeroLineColor: "rgb(234, 236, 244)",
		    			           drawBorder: false,
		    			           borderDash: [2],
		    			           zeroLineBorderDash: [2]
		    			         }
		    			       }],
		    			     },
		    			     legend: {
		    			       display: false
		    			     },
		    			     tooltips: {
		    			       titleMarginBottom: 10,
		    			       titleFontColor: '#6e707e',
		    			       titleFontSize: 14,
		    			       backgroundColor: "rgb(255,255,255)",
		    			       bodyFontColor: "#858796",
		    			       borderColor: '#dddfeb',
		    			       borderWidth: 1,
		    			       xPadding: 15,
		    			       yPadding: 15,
		    			       displayColors: false,
		    			       caretPadding: 10,
		    			       callbacks: {
		    			         label: function(tooltipItem, chart) {
		    			           var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		    			           return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
		    			         }
		    			       }
		    			     },
		    			    
		    			   }
		    			 });
		    	   		}
		       })
			  },
		    maintainAspectRatio: false,
				    
		    layout: {
		      padding: {
		        left: 10,
		        right: 25,
		        top: 25,
		        bottom: 0
		      }
		    },
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'month'
		        },
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 6
		        },
		        maxBarThickness: 25,
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 30,
		          maxTicksLimit: 5,
		          padding: 5,
		          // Include a dollar sign in the ticks
		          callback: function(value, index, values) {
		            return  number_format(value);
		          }
		        },
		        gridLines: {
		          color: "rgb(234, 236, 244)",
		          zeroLineColor: "rgb(234, 236, 244)",
		          drawBorder: false,
		          borderDash: [2],
		          zeroLineBorderDash: [2]
		        }
		      }],
		    },
		    legend: {
		      display: false
		    },
		    tooltips: {
		      titleMarginBottom: 10,
		      titleFontColor: '#6e707e',
		      titleFontSize: 14,
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		      callbacks: {
		        label: function(tooltipItem, chart) {
		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
		          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
		        }
		      }
		    },
		  }
		  } //-config
var myBarChart = new Chart(ctx,config );
		} // - success
		

	}) // - ajax

	// 미르
	$('#jsonLoad').ready(function() {
		$.ajax({
			url : 'http://192.168.0.63:9000/hospital/hospitalListChartJsonP?callback',
			type : 'GET',
			dataType : 'jsonp',
			jsonp : 'callback',
			success : function(data) {
				var datalist1 = []
				console.log(data);
				datalist1.push(data.data[0])
				makeBarChar(data.data[0]);
			},
			error : function(err) {
				console.log('Error => ' + err);
			}
		});
		
	});

	//c3js의 API 를 보고 맞는 형태를 제작
	function makeBarChar(jsonData) {
		// bar chart에 들어갈 데이터
		console.log(jsonData);
		var datas = ['data1'];
		var hosloc = ['x']
		for (var key of jsonData) {
			//console.log(key.count);
			hosloc.push(key.hos_loc)
			datas.push(key.count);  // push()  기억하자**
		}
		// [n개의 컬럼]  =>  str.slice(beginIndex[, endIndex])
		var dcolumns = jsonData.length;

		console.log("-------1");
		console.log(datas);

		// chart
		var chart = c3.generate({
			bindto : '#chart1',
		    data: {
		    	x : 'x',
		        columns: [
		        	hosloc,
		            datas,
		        ],
		        type: 'bar'
		    },
		    bar: {
		        width: {
		            ratio: 0.5 // this makes bar width 50% of length between ticks
		        }
		    },
		    axis: {
		        x: {
		            type: 'category',
		            tick: {
		                rotate: 90,
		                multiline: false
		            },
		            height: 130
		        }
		    }
		});
	}
</script>









