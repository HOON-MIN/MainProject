<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.listTr>td:hover {
	cursor: pointer; "
	background-color: white;
}
</style>
<!-- 필요한것 -->

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955"></script>

<!-- bootstrap5 dataTables js cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">

<div class="container">
	<h1>MyPage</h1>
	<div class="row">
		<table border="1" class="table table-striped">
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
					<td><img
						src="${pageContext.request.contextPath }/upload/${member.profimg }"
						style="width: 100px; height: 70px;"></td>
					<td>${member.mdate }</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 예약한 병원 목록 -->
	<p>
	<button class="btn btn-primary" type="button" data-bs-toggle="collapse"
		data-bs-target="#collapseMap" aria-expanded="false"
		aria-controls="collapseMap" id="mapButton">지도 보기</button>
</p>
	<div class="collapse" id="collapseMap">
		
		<div id="map" style="width: 100%; height: 350px;"></div>
		
	</div>

</div>

<div class="container">
	<table class="table1 table table-hover" id="datatables">
		<thead>
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
</div>
<div>
	<input type="button" value="수정하기"
		onclick="location.href='updateMypageForm'"> <input
		type="button" value="뒤로가기"
		onclick="location.href='${pageContext.request.contextPath}/member'">
</div>



<script>

	$(function() { //상시 동작 함!
		
		//병원 예약 목록
		$.ajax({
            url: 'http://192.168.0.120:9000/map/hospiter_list',
            //url: 'http://14.36.188.14:9000/map/hospiter_list',
            type: 'GET',
            dataType: 'jsonp',
            jasonp: 'callback',
            success: function(data){ // 데이터를 불러와 tbody에 요소 집어넣기
                let tbodyData =[];
                for (var i of data.data[0]) {
                	tbodyData.push('<tr style="cursor:pointer;"><td  id="listBtn" >'+i.hos_name+'</td><td>'+i.hos_address+'</td><td>'+i.hos_loc+'</td><td>'+i.hos_tel+'</td></tr>')
                }
                document.querySelector('.table1 > tbody').innerHTML = tbodyData.join('');
            },
            error: function(err){
               console.log('Error => '+err);
            }
        });
			
			//-----------------------------------------------
			// 병원 목록 클릭 ajax
			$(".table1").on("click","tr",function(){
				var hos_value=$(this).children('#listBtn').text();
				console.log("td값"+hos_value);

				$.ajax({
	                //url: 'http://14.36.188.14:9000/map/detail?name='+hos_value+'&',
	                url: 'http://192.168.0.120:9000/map/detail?name='+hos_value+'&',
	                type: 'GET',
	                dataType: 'jsonp',
	                jasonp: 'callback',
	                contentType : "application/jsonp; charset: UTF-8",
	                success: function(data){
	                    var hos_marker = {}
	                    
	                    for(var i =0; i < data.data[0].length; i++){
	                    	hos_marker[data.columns[i]]=data.data[0][i];
	                    }
	                    console.log('결과1= '+hos_marker['hos_x']);
	                    console.log('결과2= '+hos_marker['hos_y']);
	                    console.log('병원이름= '+hos_marker['hos_name']);
	                    
	                    <!-- 지도 생성! -->
	            		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	            		mapOption = {
	            			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	            			level : 5 // 지도의 확대 레벨 
	            		
	            		};
	            		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	            		<!-- 지도 크기 조절 이벤트 -->
	            		var zoomControl = new kakao.maps.ZoomControl();
	            		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	            		
	            		<!-- 현재위치 좌표얻어오기! -->
            			navigator.geolocation.getCurrentPosition(function(position) {

           				var lat = position.coords.latitude, // 위도
           				lon = position.coords.longitude; // 경도

           				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
           				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
           				console.log('현재위치 !!'+locPosition);
	            		var positions = [
	            			{
	            		        title: '현재위치', 
	            		        latlng: locPosition
	            		    },
	            			{
	            		        title: hos_marker['hos_name'], 
	            		        latlng: new kakao.maps.LatLng(hos_marker['hos_y'], hos_marker['hos_x'])
	            		    }];
	            		
	            		console.log('lat = '+lat)
	            		console.log('marker_y = '+hos_marker['hos_y'])
	            		console.log('y = '+(lat+hos_marker['hos_y'])/2)
	            		console.log('---------------')
	            		console.log('lat = '+lon)
	            		console.log('marker_y = '+hos_marker['hos_x'])
	            		console.log('marker_x = '+hos_marker['hos_x'])
	            		console.log('x = '+(lon+hos_marker['hos_x'])/2)
	            		
	            		var center_x = (lon+hos_marker['hos_x'])/2
	            		var center_y = (lat+hos_marker['hos_y'])/2
	            		var center_xy= new kakao.maps.LatLng(center_y,center_x)
	            		for (var i = 0; i < positions.length; i ++) {
	            		// 마커를 생성합니다 
	            		
	        			var marker = new kakao.maps.Marker({ // 마커를 생성합니다 
	        				map : map,
	        				position : positions[i].latlng,
	        				title : positions[i].title
	        			});
	            		
	        			var iwContent = positions[i].title, // 인포윈도우에 표시할 내용
	        			iwRemoveable = true;
	        			
	        			var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우를 생성합니다
	        				content : iwContent,
	        				removable : iwRemoveable
	        			});
	        			// 인포윈도우를 마커위에 표시합니다 
	        			infowindow.open(map, marker);
	        			// 마커를 지도에 표시합니다
	        			marker.setMap(map);
	            		}
	        			var level = map.getLevel();
	        			
	        			infowindow.open(map, marker); // 인포윈도우를 마커위에 표시합니다 
	        			map.setLevel(level + 2);
	        			map.setCenter(center_xy); // 지도 중심좌표를 접속위치로 변경합니다
	            		});
	            		
	                } // - success 함수 
				
				}); // - ajax
			}); // table1 클릭 ajax 끝
	
			
			
		});
</script>