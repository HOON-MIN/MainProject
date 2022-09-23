<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<!-- include 제거  -->
<!-- Bootstrap core JavaScript-->
<script src="/taejin/vendor/jquery/jquery.min.js"></script>
<script src="/taejin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/taejin/vendor/jquery-easing/jquery.easing.min.js"></script>


<style>
/* 	.table1 :hover { */

/* 	} */
</style>


<article>
	<div class="container">
		<header>
			<h1>Hospital List</h1>
		</header>
		<!-- Area Chart -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
			</div>
			<div class="card-body">
				<div class="chart-area">
					<canvas id="myAreaChart"></canvas>
				</div>
				<hr>
				Styling for the area chart can be found in the
				<code>/js/demo/chart-area-demo.js</code>
				file.
			</div>
		</div>

		<!-- Bar Chart
		select d.dmajor,h.hname ,count(*) from reserve r, doctor d ,hospital h 
		where r.dnum=d.dnum and h.cnum = d.cnum group by d.dmajor,h.hname;
		 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">작월 이용횟수</h6>
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
</article>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
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
var labels =[];
var datas = [];
var ctx = document.getElementById("myBarChart");
$.ajax({
	url:'${pageContext.request.contextPath}/admin/adminBarchart',
	type:'get',
	success:function(data){
		console.log(data)
		//console.log(data[0].hvo[0].hcate)
		for(var i of data){
			console.log(i.r_num)
			console.log(i.hvo[0].hcate)
			labels.push(i.hvo[0].hcate)
			datas.push(i.r_num)
		}
		
		//console.log(data[0].hvo.doctorVO[0].dmajor)
		//console.log(data[0].hvo.doctorVO[0].reserveVO[0].r_num)
		
	
var myBarChart = new Chart(ctx, {
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
	}// - success
}) // - ajax
</script>









