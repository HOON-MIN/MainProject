<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include 제거  -->

<style>
.hcategory {
	background-color: #3478f5;
	padding-top: 40px;
	height: 100%;
}

.hboard {
	background-color: #efefef;
	border-radius: 8px;
	margin: 40px;
	height: 90%;
}

a {
	text-decoration: none;
	color: white;
}

.searchForm input {
	border: solid 1px #3478f5;
	border-radius: 16px 0 0 16px;
	background-color:
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}

.htable {
	width: 100%;
}

.htable thead {
	height: 40px;
	color: grey;
}

.htable th {
	font-weight: lighter;
	padding-left: 12px;
}

.htable tbody {
	border-collapse: collapse;
	border-radius: 16px;
	box-shadow: 2px 2px 2px 2px #ababab;
}

.htable td {
	padding: 14px 12px;
	font-size: 14px;
}
</style>
<!-- 전체 틀 -->
<div class="container-fluid" style="height: 100%;">
	<div class="row justify-content-around" style="height: 100%;">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 -->
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">${member.name }님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a
					href="${pageContext.request.contextPath }/admin/adminHospTotalList">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<c:choose>
						<c:when test="${sessionNUM == 1}">
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/adminHospTotalList">전체</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/adminHospRegistList">등록된</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/waitingList">업체승인</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/adminRegistChart">차트</a>
							</li>


						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="hboard pt-2 ps-3 pe-3 ">
					<div class="justify-content-center">
						<h3 class="hanna ps-3 text-center"></h3>
						<div class=" justify-content-center ">
							<!-- 내용 -->


		

		<!-- Bar Chart1 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">작월 사용자이용 통계</h6>
			</div>
			<div class="card-body">
				<div class="chart-bar">
					<canvas id="myBarChart"></canvas>
				</div>
				<hr>
				Styling for the bar chart can be found in the
				<code>/js/demo/chart-bar-demo.js</code>
				file.
			</div>
			</div>
		

		<!-- Bar Chart2 -->	
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">과별 병원 이용 통계</h6>
			</div>
			<div class="card-body">
				<div class="chart-bar" id="graph-container">
					<!--<canvas id="myBarChart2" width="591" height="150"></canvas>-->
				</div>
				<hr>
				Styling for the bar chart can be found in the
				<code>/js/demo/chart-bar-demo.js</code>
				file.
			</div>
		</div>

	


	<!-- Donut Chart -->
	<div class="col-xl-4 col-lg-5">
		<div class="card shadow mb-4">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
			</div>
			<!-- Card Body -->
			<div class="card-body">
				<div class="chart-pie pt-4">
					<canvas id="myPieChart"></canvas>
				</div>
				<hr>
				Styling for the donut chart can be found in the
				<code>/js/demo/chart-pie-demo.js</code>
				file.
			</div>
		</div>
	</div>
	</div>
	<!--  -->
	<!-- 내용 끝 -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

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
		    			           maxTicksLimit: 6
		    			         },
		    			         maxBarThickness: 25,
		    			       }],
		    			       yAxes: [{
		    			         ticks: {
		    			           min: 0,
		    			           max: 10,
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
		          max: 10,
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
		  } //-config
var myBarChart = new Chart(ctx,config );
		} // - success
		

	}) // - ajax

</script>









