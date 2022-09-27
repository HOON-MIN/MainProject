<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- C3 CDN -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<!-- include 제거  -->

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<h3 class="hanna p-4" style="text-align: center;">통계 페이지</h3>
<!-- Bar Chart1 -->
<div class="container">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">전국 병원</h6>
		</div>
		<div>
			<input type="button" value="click" id="jsonLoad">
		</div>
		<div class="card-body">
			<!-- <div id="target"></div> -->
			<div class="chart-bar">
				<div id="chart1"></div>

			</div>
			<hr>
			Styling for the bar chart can be found in the
			<code>/js/demo/chart-bar-demo.js</code>
			file.
		</div>
	</div>
</div>


<div class="row">
	<div style="width: 500px;">
		<div>
			<input type="button" value="click" id="jsonLoad">
		</div>
		<div id="target"></div>
		<div id="chart1"
			style="width: 100%; height: 600px; padding-top: 50px; margin-bottom: 100px;"></div>
	</div>
</div>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	// $(function(){
	// 	$('.linktd').click(function(){
	// 		var href = $(this).parent("tr").children("td").children("a").attr("href")
	// // 		alert(href);
	// 		window.location = href;
	// 	});
	//});
	$('#jsonLoad').click(function() {
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









