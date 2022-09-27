<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/css/dhlee/dashboard/bootstrap3.css">

<link rel="stylesheet" href="/css/dhlee/dashboard/bold.css">

<link rel="stylesheet" href="/css/dhlee/dashboard/perfect-scrollbar.css">
<link rel="stylesheet" href="/css/dhlee/dashboard/bootstrap-icons.css">
<link rel="stylesheet" href="/css/dhlee/dashboard/app2.css">
<link rel="shortcut icon"
	href="/css/dhlee/dashboard/ assets/images/favicon.svg"
	type="image/x-icon">
<script src="//cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.4.0/wavesurfer.min.js"></script>
<style>
#chartdivpie {
  width: 100%;
  height: 530px;
}

</style>
<div id="app" class="covidresult" style="display:flex; margin: auto; justify-content: center;'">
	<div id="main" style="margin-left: 0px;">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none">
			</a>
		</header>

		<div class="page-heading covidUpload">
			
			<h1 id="covidh1" style="font-family: ;">COVID19 RESULT</h1>
		</div>
		<div class="page-content">
			<section class="row" style="margin-right:0px;">

					<div class="row">
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon purple">
												<i class="iconly-boldShow"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">User Age</h6>
											<h6 class="font-extrabold mb-0" id="userage">24세</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon blue">
												<i class="iconly-boldProfile"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">User Gender</h6>
											<h6 class="font-extrabold mb-0" id="usergender">Female</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon green">
												<i class="iconly-boldAdd-User"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">호흡기질환 여부</h6>
											<h6 class="font-extrabold mb-0" id="respiratory">X</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon red">
												<i class="iconly-boldBookmark"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">발열/근육통 여부</h6>
											<h6 class="font-extrabold mb-0" id="fevermus">O</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<div class="card">
								<div class="card-header">
									<h4>WAV파형</h4>
								</div>
								<div class="card-body" style="height:200px;">
									<div id="waveform"></div>
									<div class="covidUpload" style="display:flex; justify-content: right; background-color: #fff">
										<button onclick="wavesurfer.playPause()" style="width:20px; height:2rem; margin-top:10px;">Play/Pause</button>
										<button onclick="wavesurfer.stop()" style="width:20px; height:2rem; margin-top:10px;">Stop</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 이동환 추가 -->
					    <div class="col-6">
							<div class="card">
								<div class="card-header">
									<h4>REESULT</h4>
								</div>
								<div class="card-body" style="height:200px;">
									<p>검사결과 당신은 코로나 <h2 id="usercovid" style="display:inline; color: red;">양성</h2>입니다.</p>
									<p id="subment">가까운 병원에서 검사 후 자가격리하세요.</p>
									<div class="covidUpload" style="display:flex; justify-content: right; background-color: #fff">
										<button style="width:50%; height:2rem; margin-top:10px;" onclick="location='COVIDcheck'">다시검사하기</button>
										<button style="width:50%; height:2rem; margin-top:10px;" onclick="location.href='http://192.168.0.50:3000/'">병원예약하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="page-heading covidUpload">
					<h1 id="covidh2" style="font-family: ;">훈련데이터 현황</h1>
				</div>
					<div class="row">
						<div class="col-12 col-xl-5">
							<div class="card">
								<div class="card-header">
									<h4>연령별 진단비율</h4>
								</div>
								<div class="card-body" style="height:554px;">
									<!-- 레이더 그래프 삽입 -->
									<div style="width:100%">
  										<canvas id="covidcanvas"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-xl-7">
							<div class="card">
								<div class="card-header">
									<h4>성별별 진단비율</h4>
								</div>
								<div class="card-body">
									<!-- 파이 그래프 삽입 -->
									<div id="chartdivpie"></div>
								</div>
							</div>
						</div>
					</div>
			</section>
		</div>
	</div>
</div>


<script src="/js/dhlee/dashboard/perfect-scrollbar.min.js"></script>
<script src="/js/dhlee/dashboard/bootstrap.bundle.min.js"></script>

<script src="/js/dhlee/dashboard/apexcharts.js"></script>
<script src="/js/dhlee/dashboard/dashboard.js"></script>

<script src="/js/dhlee/dashboard/main.js"></script>

<!-- chart.js Resource -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- amcharts Resource -->
<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<script>
var userid = '${sessionScope.sessionID}';
var pieinput = [];
var wavesurfer = WaveSurfer.create({
    // id="waveform" 인 오브젝트에 파형 생성
    // 필수 옵션
    container: '#waveform',
    // 선택 옵션들 
    cursorColor: 'transparent',
    progressColor: '#005af0',
    waveColor: '#a0a4a8',
    hideScrollbar: 'false'
});

wavesurfer.load('/upload/audio/'+userid+'.wav');


$(window).ready(function(){
	$.ajax({
		url : 'http://192.168.0.83:9000/dhlee/covidres?id='+userid+'&callback',
		type:'GET',
		dataType:'jsonp',
		jsonp: 'callback',
		success: function(data){
			resdata = data.data[0];
			console.log(resdata);
			$('#userage').html(resdata.age+"세");
			$('#usergender').html(resdata.gender.charAt(0).toUpperCase()+resdata.gender.slice(1));
			if(resdata.respiratory_condition == 0){
				$('#respiratory').html('X');
			}else{
				$('#respiratory').html('O');
			}
			if(resdata.fever_or_muscle_pain == 0){
				$('#fevermus').html('X');
			}else{
				$('#fevermus').html('O');
			}
			if(resdata.covid19 == 0){
				$('#usercovid').css('color','#005af0').html('음성');
				$('#subment').html('의사와의 검진을 통해 보다 확실한 결과를 얻으실 수 있습니다.');
				console.log('음성');
			}else{
				$('#usercovid').css('color','red').html('양성');
				$('#subment').html('가까운 병원에서 검사 후 자가격리하세요.');
				console.log('양성');
			}
		}
	});

//레이터차트 그래프	
	var agenormal = [];
	var agecovid = [];
	$.ajax({
		url : 'http://192.168.0.83:9000/dhlee/covidradar?&callback',
		type:'GET',
		dataType:'jsonp',
		jsonp: 'callback',
		success: function(data){
			radardata = data.data;
			console.log(radardata);
			
			for(var i of radardata){
				agenormal.push(i.rnormal);
				agecovid.push(i.rcovid19)
			}
			
			var randomScalingFactor = function () {
				  console.log(Math.random() * 100)
				  return Math.round(Math.random() * 1000);
				};

				var chartColors = {
				  red: "rgb(255, 99, 132)",
				  orange: "rgb(255, 159, 64)",
				  yellow: "rgb(255, 205, 86)",
				  green: "rgb(75, 192, 192)",
				  blue: "rgb(54, 162, 235)",
				  purple: "rgb(153, 102, 255)",
				  grey: "rgb(231,233,237)"
				};

				var color = Chart.helpers.color;
				var config = {
				  type: "radar",
				  data: {
				    labels: [
				      "10대",
				      "20대",
				      "30대",
				      "40대",
				      "50대",
				      ["60대","이상"],
				    ],
				    datasets: [
				      {
				        label: "COVID19 양성",
				        backgroundColor: color(chartColors.red).alpha(0.2).rgbString(),
				        borderColor: chartColors.red,
				        pointBackgroundColor: chartColors.red,
				        data: agecovid
				      },
				      {
				        label: "COVID19 음성",
				        backgroundColor: color(chartColors.blue).alpha(0.2).rgbString(),
				        borderColor: chartColors.blue,
				        pointBackgroundColor: chartColors.blue,
				        data: agenormal
				      },
				    ]
				  },
				  options: {
				    legend: {
				      position: "top",
				      labels: {
				        fontColor: "rgb(255, 99, 132)"
				      },
				      onHover: function (event, legendItem) {
				        document.getElementById("canvas").style.cursor = "pointer";
				      },
				      onClick: function (e, legendItem) {
				        var index = legendItem.datasetIndex;
				        var ci = this.chart;
				        var alreadyHidden =
				          ci.getDatasetMeta(index).hidden === null
				            ? false
				            : ci.getDatasetMeta(index).hidden;

				        ci.data.datasets.forEach(function (e, i) {
				          var meta = ci.getDatasetMeta(i);

				          if (i !== index) {
				            if (!alreadyHidden) {
				              meta.hidden = meta.hidden === null ? !meta.hidden : null;
				            } else if (meta.hidden === null) {
				              meta.hidden = true;
				            }
				          } else if (i === index) {
				            meta.hidden = null;
				          }
				        });

				        ci.update();
				      }
				    },
				    tooltips: {
				      custom: function (tooltip) {
				        if (!tooltip.opacity) {
				          document.getElementById("canvas").style.cursor = "default";
				          return;
				        }
				      }
				    },
				    title: {
				      display: true,
				      text: "Chart.js Radar Chart"
				    },
				    scale: {
				      ticks: {
				        beginAtZero: true
				      }
				    }
				  }
				};

				window.onload = function () {
				  window.myRadar = new Chart(document.getElementById("covidcanvas"), config);
				};
		}
	});

});

am5.ready(function() {


	// Create root element
	// https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartdivpie");

	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([am5themes_Animated.new(root)]);

	var container = root.container.children.push(
	  am5.Container.new(root, {
	    width: am5.p100,
	    height: am5.p100,
	    layout: root.horizontalLayout
	  })
	);

	// Create main chart
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
	var chart = container.children.push(
	  am5percent.PieChart.new(root, {
	    tooltip: am5.Tooltip.new(root, {})
	  })
	);

	// Create series
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
	var series = chart.series.push(
	  am5percent.PieSeries.new(root, {
	    valueField: "value",
	    categoryField: "category",
	    alignLabels: false
	  })
	);

	series.labels.template.setAll({
	  fontSize: 10,
	  textType: "circular",
	  textType: "adjusted",
	  text: "{category}",
	  radius: 4
	});
	series.ticks.template.set("visible", false);
	series.slices.template.set("toggleKey", "none");

	// add events
	series.slices.template.events.on("click", function(e) {
	  selectSlice(e.target);
	});

	// Create sub chart
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
	var subChart = container.children.push(
	  am5percent.PieChart.new(root, {
	    radius: am5.percent(50),
	    tooltip: am5.Tooltip.new(root, {})
	  })
	);


	// Create sub series
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
	var subSeries = subChart.series.push(
	  am5percent.PieSeries.new(root, {
	    valueField: "value",
	    categoryField: "category"
	  })
	);
	subSeries.labels.template.setAll({
	  fontSize: 10,
	});
	subSeries.data.setAll([
	  { category: "A", value: 0 },
	  { category: "B", value: 0 },
	  { category: "C", value: 0 },
	  { category: "D", value: 0 },
	  { category: "E", value: 0 },
	  { category: "F", value: 0 },
	  { category: "G", value: 0 }
	]);
	subSeries.slices.template.set("toggleKey", "none");

	var selectedSlice;

	series.on("startAngle", function() {
	  updateLines();
	});

	container.events.on("boundschanged", function() {
	  root.events.on("frameended", function(){
	    updateLines();
	   })
	})

	function updateLines() {
	  if (selectedSlice) {
	    var startAngle = selectedSlice.get("startAngle");
	    var arc = selectedSlice.get("arc");
	    var radius = selectedSlice.get("radius");

	    var x00 = radius * am5.math.cos(startAngle);
	    var y00 = radius * am5.math.sin(startAngle);

	    var x10 = radius * am5.math.cos(startAngle + arc);
	    var y10 = radius * am5.math.sin(startAngle + arc);

	    var subRadius = subSeries.slices.getIndex(0).get("radius");
	    var x01 = 0;
	    var y01 = -subRadius;

	    var x11 = 0;
	    var y11 = subRadius;

	    var point00 = series.toGlobal({ x: x00, y: y00 });
	    var point10 = series.toGlobal({ x: x10, y: y10 });

	    var point01 = subSeries.toGlobal({ x: x01, y: y01 });
	    var point11 = subSeries.toGlobal({ x: x11, y: y11 });

	    line0.set("points", [point00, point01]);
	    line1.set("points", [point10, point11]);
	  }
	}

	// lines
	var line0 = container.children.push(
	  am5.Line.new(root, {
	    position: "absolute",
	    stroke: root.interfaceColors.get("text"),
	    strokeDasharray: [2, 2]
	  })
	);
	var line1 = container.children.push(
	  am5.Line.new(root, {
	    position: "absolute",
	    stroke: root.interfaceColors.get("text"),
	    strokeDasharray: [2, 2]
	  })
	);

	// Set data
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
	series.data.setAll([
	  {
	    category: "10대 여성",
	    value: 2.66,
	    subData: [
	      { category: "양성", value: 16.00 },
	      { category: "음성", value: 84.00 }
	    ]
	  },
	  {
	    category: "10대 남성",
	    value: 6.04,
	    subData: [
	      { category: "양성", value: 10.57 },
	      { category: "음성", value: 89.43 }
	    ]
	  },
	  {
	    category: "20대 여성",
	    value: 7.43,
	    subData: [
	      { category: "양성", value: 10.04 },
	      { category: "음성", value: 89.96 }
	    ]
	  },
	  {
	    category: "20대 남성",
	    value: 18.88,
	    subData: [
	      { category: "양성", value: 8.60 },
	      { category: "음성", value: 91.40 }
	    ]
	  },
	  {
	    category: "30대 여성",
	    value: 7.22,
	    subData: [
	      { category: "양성", value: 8.86 },
	      { category: "음성", value: 91.14 }
	    ]
	  },
	  {
	    category: "30대 남성",
	    value: 18.05,
	    subData: [
	      { category: "양성", value: 7.52 },
	      { category: "음성", value: 92.48 }
	    ]
	  },
	  {
	    category: "40대 여성",
	    value: 6.28,
	    subData: [
	      { category: "양성", value: 7.20 },
	      { category: "음성", value: 92.80 }
	    ]
	  },
	  {
	    category: "40대 남성",
	    value: 14.00,
	    subData: [
	      { category: "양성", value: 5.32 },
	      { category: "음성", value: 94.68 }
	    ]
	  },
	  {
	    category: "50대 여성",
	    value: 4.07,
	    subData: [
	      { category: "양성", value: 6.54 },
	      { category: "음성", value: 93.46 }
	    ]
	  },
	  {
	    category: "50대 남성",
	    value: 7.22,
	    subData: [
	      { category: "양성", value: 5.90 },
	      { category: "음성", value: 94.10 }
	    ]
	  },
	  {
	    category: "60대 여성",
	    value: 3.22,
	    subData: [
	      { category: "양성", value: 8.26 },
	      { category: "음성", value: 91.74 }
	    ]
	  },
	  {
	    category: "60대 남성",
	    value: 4.93,
	    subData: [
	      { category: "양성", value: 3.78 },
	      { category: "음성", value: 96.22 }
	    ]
	  },
	]);

	function selectSlice(slice) {
	  selectedSlice = slice;
	  var dataItem = slice.dataItem;
	  var dataContext = dataItem.dataContext;

	  if (dataContext) {
	    var i = 0;
	    subSeries.data.each(function(dataObject) {
	      var dataObj = dataContext.subData[i];
	      if(dataObj){
	          subSeries.data.setIndex(i, dataObj);
	          if(!subSeries.dataItems[i].get("visible")){
	              subSeries.dataItems[i].show();
	          }
	      }
	      else{
	          subSeries.dataItems[i].hide();
	      }

	      i++;
	    });
	  }

	  var middleAngle = slice.get("startAngle") + slice.get("arc") / 2;
	  var firstAngle = series.dataItems[0].get("slice").get("startAngle");

	  series.animate({
	    key: "startAngle",
	    to: firstAngle - middleAngle,
	    duration: 1000,
	    easing: am5.ease.out(am5.ease.cubic)
	  });
	  series.animate({
	    key: "endAngle",
	    to: firstAngle - middleAngle + 360,
	    duration: 1000,
	    easing: am5.ease.out(am5.ease.cubic)
	  });
	}

	container.appear(1000, 10);

	series.events.on("datavalidated", function() {
	  selectSlice(series.slices.getIndex(0));
	});

	}); // end am5.ready()
</script>