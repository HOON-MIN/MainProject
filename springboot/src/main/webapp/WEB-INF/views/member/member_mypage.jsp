<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="UTF-8">
<title></title>
<!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"	crossorigin="anonymous"></script>
<link href="/css/styles.css" rel="stylesheet" />
<script src="/js/scripts.js"></script> -->
<script type="text/javascript"	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

</head>

<body>
	<h1>MyPage</h1>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>SSN</th>
				<th>AGE</th>
				<th>TEL</th>
				<th>EMAIL</th>
				<th>PROFIMG</th>
				<th>MDATE</th>
			</tr>
		</thead>
		<tbody>
			<tr>

				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.ssn }</td>
				<td>${member.age }</td>
				<td>${member.tel }</td>
				<td>${member.email }</td>
				<td><img src="/resources/upload/${member.profimg }">${member.profimg }</td>
				<td>${member.mdate }</td>

			</tr>

		</tbody>
	</table>
	<div>
		<div id="map" style="width: 100%; height: 350px;"></div>

		<ul>
			<li>위도:<span id="latitude"></span></li>
			<li>경도:<span id="longitude"></span></li>
		</ul>
		<input id="btnStop" type="button" value="감시를 끝낸다" />
	</div>


	<table class="table1" id="example">
		<thead class="thead-dark">
			<tr>
				<th scope="col">병원이름</th>
				<th scope="col">병원주소</th>
				<th scope="col">진료구분</th>
				<th scope="col">전화번호</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<div>
		<input type="button" value="수정하기"
			onclick="location.href='updateMypageForm'"> <input
			type="button" value="뒤로가기"
			onclick="location.href='${pageContext.request.contextPath}/member'">
	</div>


	

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 10
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		<!--지도 2번째 마커  -->
		var positions = [
		    {
		        title: '카카오', 
		        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		    },
		   
		];
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		
		 
		
		$(function() {
			$('#example').DataTable();
			
			// Geolocation API에 액세스할 수 있는지를 확인
			if (navigator.geolocation) {
				//위치 정보를 정기적으로 얻기
				var id = navigator.geolocation.watchPosition(function(pos) {
					$('#latitude').html(pos.coords.latitude); // 위도 
					$('#longitude').html(pos.coords.longitude); // 경도 
				});

				// 버튼 클릭으로 감시를 중지
				$('#btnStop').click(function() {
					navigator.geolocation.clearWatch(id);
				});
			} else {
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
			}
			<!-- 마이페이지 리스트 불러오기  -->
			$.ajax({
                url: 'http://192.168.0.120:9000/map/hospiter_list',
                type: 'GET',
                dataType: 'jsonp',
                jasonp: 'callback',
                success: function(data){
                    //console.log(data);
                    console.log(data.columns);
                    console.log(data.data);
                    let tbodyData =[];
                   
                    for (var i of data.data[0]) {
                    	tbodyData.push('<tr ><br><td  id="listBtn" style="cursor:pointer;">'+i.hos_name+'</td><br><td>'+i.hos_address+'</td><br><td>'+i.hos_loc+'</td><br><td>'+i.hos_tel+'</td><br></tr>')
                    }
                    
                    document.querySelector('.table1 > tbody').innerHTML = tbodyData.join('');
                   
                    
                },
                error: function(err){
                   console.log('Error => '+$('#target').text());
                }
            });
			
			$(".table1").on("click","td",function(){
				var hos_value=$(this).text();
				//console.log('hos_value => '+hos_value);
				//console.log('td_text => '+$(this).text());
				$.ajax({
	                url: 'http://192.168.0.120:9000/map/detail?name='+hos_value+'&',
	                type: 'GET',
	                dataType: 'jsonp',
	                jasonp: 'callback',
	                contentType : "application/jsonp; charset: UTF-8",
	                success: function(data){
	                    console.log('data.columns= '+data.columns);
	                    console.log('data.columns= '+data.columns[1]);
	                    console.log('data.data= '+data.data[0]);
	                    console.log('data.data= '+data.data[0][2]);
	                    console.log('data.data.length= '+data.data[0].length);
	                    var test= {}
	                    var hos_marker = []
	                    for(var i =0; i < data.data[0].length; i++){
	                    	test[data.columns[i]]=data.data[0][i];
	                    }
	                    
	                    console.log('결과= '+test['hos_x']);
	                    console.log('keys= '+test['hos_x']);
	                    
	                    
	                }           
			});
			});
               
			
			
			
		});
	</script>
</body>
</html>