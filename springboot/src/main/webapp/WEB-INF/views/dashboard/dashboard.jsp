<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="/soyoung/dashboard/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/soyoung/dashboard/assets/img/favicon.png">
<title>Argon Dashboard 2 by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="/soyoung/dashboard/css/nucleo-icons.css" rel="stylesheet" />
<link href="/soyoung/dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="/soyoung/dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<main class="main-content position-relative border-radius-lg ">

		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-body p-3">
							<div class="row">
								<div class="col-8">
									<div class="numbers">
										<p class="text-sm mb-0 text-uppercase font-weight-bold">Today's
											Money</p>
										<h5 class="font-weight-bolder">$53,000</h5>
										<p class="mb-0">
											<span class="text-success text-sm font-weight-bolder">+55%</span>
											since yesterday
										</p>
									</div>
								</div>
								<div class="col-4 text-end">
									<div
										class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
										<i class="ni ni-money-coins text-lg opacity-10"
											aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-body p-3">
							<div class="row">
								<div class="col-8">
									<div class="numbers">
										<p class="text-sm mb-0 text-uppercase font-weight-bold">Today's
											Users</p>
										<h5 class="font-weight-bolder">2,300</h5>
										<p class="mb-0">
											<span class="text-success text-sm font-weight-bolder">+3%</span>
											since last week
										</p>
									</div>
								</div>
								<div class="col-4 text-end">
									<div
										class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
										<i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-body p-3">
							<div class="row">
								<div class="col-8">
									<div class="numbers">
										<p class="text-sm mb-0 text-uppercase font-weight-bold">New
											Clients</p>
										<h5 class="font-weight-bolder">+3,462</h5>
										<p class="mb-0">
											<span class="text-danger text-sm font-weight-bolder">-2%</span>
											since last quarter
										</p>
									</div>
								</div>
								<div class="col-4 text-end">
									<div
										class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
										<i class="ni ni-paper-diploma text-lg opacity-10"
											aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-body p-3">
							<div class="row">
								<div class="col-8">
									<div class="numbers">
										<p class="text-sm mb-0 text-uppercase font-weight-bold">Sales</p>
										<h5 class="font-weight-bolder">$103,430</h5>
										<p class="mb-0">
											<span class="text-success text-sm font-weight-bolder">+5%</span>
											than last month
										</p>
									</div>
								</div>
								<div class="col-4 text-end">
									<div
										class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
										<i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-lg-7 mb-lg-0 mb-4">
					<div class="card z-index-2 h-100">
						<div class="card-header pb-0 pt-3 bg-transparent">
							<h6 class="text-capitalize">한국 의료 소비 금액(year)</h6>
							<p class="text-sm mb-0">
								<i class="fa fa-arrow-up text-success"></i> <span
									class="font-weight-bold">8% more</span> in 2021
							</p>
						</div>
						<div class="card-body p-3">
							<div class="chart"></div>
							<canvas id="chart-line" class="chart-canvas" height="300"></canvas>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div id="carouselExampleFade" class="carousel slide carousel-fade"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="/soyoung/dashboard/img/carousel_new_1.jpg"
									class="d-block h-100" alt="...">
								
							</div>
							<div class="carousel-item">
								<img src="/soyoung/dashboard/img/carousel_new_3.jpg"
									class="d-block h-100" alt="...">
								
							</div>
							<div class="carousel-item">
								<img src="/soyoung/dashboard/img/carousel_new_2.png"
									class="d-block h-100" alt="...">
							
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleFade" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-lg-7 mb-lg-0 mb-4">
				<div class="card ">
					<div class="card-header pb-0 p-3">
						<div class="d-flex justify-content-between">
							<h6 class="mb-2">사용자 병원 후기 핵심 키워드 분석(치과)</h6>
						</div>
					</div>
					<tr>
						<td colspan="6" style=""><img
							src='http://192.168.0.177:9000/static/dashboard/img/wordcnt1.png' style="width: 70%">
						</td>
					</tr>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="card">
					<div class="card-header pb-0 p-3">
						<div class="d-flex justify-content-between">
							<h6 class="mb-2">이용자 후기 평가 - 병원 랭킹(치과)</h6>
						</div>
					</div>
					<p></p>
					<div class="table-responsive">
						<table class="table table-hover hostable">
							<thead>
								<tr>
									<th scope="col">순위</th>
									<th scope="col">병원</th>
									<th scope="col">평균 별점</th>
								</tr>
							</thead>
							<tbody id="ranktable">

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
		<footer class="footer pt-3  "> </footer>

	</main>

	<!--   Core JS Files   -->
	<script src="/soyoung/dashboard/js/core/popper.min.js"></script>
	
	<script src="/soyoung/dashboard/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="/soyoung/dashboard/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="/soyoung/dashboard/js/plugins/chartjs.min.js"></script>

	<script>


$(window).ready(function(){
	$.ajax({
		url: 'http://192.168.0.177:9000/sypark/chart_dashboard?callback',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'callback',
        success: function(data){ // 데이터를 불러와 tbody에 요소 집어넣기
    		console.log(data.data);
        
    		var ctx1 = document.getElementById("chart-line").getContext("2d");
    	    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    	    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
    	    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
    	    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
			
    	    var arryear = data.data[1];
    	    var arramount = data.data[0];
    	    
    	    new Chart(ctx1, {
      	      type: "line",
      	      data: {
      	        labels: arryear,
      	        datasets: [{
      	          label: "Annual Medical Spending",
      	          tension: 0.4,
      	          borderWidth: 0,
      	          pointRadius: 0,
      	          borderColor: "#5e72e4",
      	          backgroundColor: gradientStroke1,
      	          borderWidth: 3,
      	          fill: true,
      	          data: arramount,
      	          maxBarThickness: 6
      	        }],
      	      },
      	      options: {
      	        responsive: true,
      	        maintainAspectRatio: false,
      	        plugins: {
      	          legend: {
      	            display: false,
      	          }
      	        },
      	        interaction: {
      	          intersect: false,
      	          mode: 'index',
      	        },
      	        scales: {
      	          y: {
      	            grid: {
      	              drawBorder: false,
      	              display: true,
      	              drawOnChartArea: true,
      	              drawTicks: false,
      	              borderDash: [5, 5]
      	            },
      	            ticks: {
      	              max: 10000000,
      	              display: true,
      	              padding: 10,
      	              color: '#fbfbfb',
      	              font: {
      	                size: 13,
      	                family: "Open Sans",
      	                style: 'normal',
      	                lineHeight: 2
      	              },

      	            }
      	          },
      	          x: {
      	            grid: {
      	              drawBorder: false,
      	              display: false,
      	              drawOnChartArea: false,
      	              drawTicks: false,
      	              borderDash: [5, 5]
      	            },
      	            ticks: {
      	              display: true,
      	              color: '#ccc',
      	              padding: 20,
      	              font: {
      	                size: 13,
      	                family: "Open Sans",
      	                color: '#000000',
      	                style: 'normal',
      	                lineHeight: 2
      	              },
      	            }
      	          },
      	        },
      	      },
      	    });
        },
        error: function(err){
            console.log('Error => '+err);
        }
	})
	
	$.ajax({
        url: 'http://192.168.0.177:9000/sypark/list_dashboard?callback',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'callback',
        success: function(data){ // 데이터를 불러와 tbody에 요소 집어넣기
          console.log(data.data)
         
          let tbodyData =[];
          
          for (var i of data.data) {
          	tbodyData.push('<tr style="cursor:pointer;"><td id="listBtn" >'+i[0]+'</td><td>'+i[1]+'</td><td>'+i[2]+'</td></tr>')
          }
          document.querySelector('.hostable > tbody').innerHTML = tbodyData.join('');
          
        },
        error: function(err){
           console.log('Error => '+err);
        }
    });
	
	$.ajax({
        url: 'http://192.168.0.177:9000/sypark/jsonP_word?callback',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'callback',
        success: function(data){
          console.log(data.data)          
        },
        error: function(err){
           console.log('Error => '+err);
        }
    });
});

</script>