<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h5 class="hanna text-white"">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class="nav-item pt-5 pb-2 ps-4"><a
						class="nav-link active text-white" aria-current="page" href="#">모든
							진료과</a></li>

				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="form-group" style="margin: 0 auto;">

					<div class="col-sm-5" style="float: left;">
						<div class="form-group">
							<label>ID </label> <input name="id" type="text"
								class="form-control" readonly="readonly" value="${member.id }">
						</div>
						<div class="form-group">
							<label>이름 </label> <input name="name" type="text"
								class="form-control" readonly="readonly" value="${member.name }">
						</div>
						<div class="form-group">
							<label>주민등록번호 </label> <input name="ssn" type="text"
								class="form-control" readonly="readonly" value="${member.ssn }">
						</div>
						<div class="form-group">
							<label>전화번호</label> <input name="tel" type="text"
								class="form-control" readonly="readonly" value="${member.tel }">
						</div>
						<div class="form-group">
							<label>E-mail</label> <input name="email" type="text"
								class="form-control" readonly="readonly"
								value="${member.email }">
						</div>
					</div>



					<button class="btn btn-primary btn-lg" type="button">Example
						button</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 필요한것 -->
<%-- 
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955"></script>

<!-- bootstrap5 dataTables js cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<div class="container py-4">
	<div class="p-5 mb-4 bg-light ">
		<div class="container">
			<h1 class="display-5 fw-bold">프로필 정보</h1>
			<!-- <p class="col-md-8 fs-4">Using a series of utilities, you can create this jumbotron, just like the one in previous versions of Bootstrap. Check out the examples below for how you can remix and restyle it to your liking.just like the one in previous versions of Bootstrap. Check out the examples below for how you can remix and restyle it to your liking.just like the one in previous versions of Bootstrap. Check out the examples below for how you can remix and restyle it to your liking.just like the one in previous versions of Bootstrap. Check out the examples below for how you can remix and restyle it to your liking.</p>-->
				
			<div class="form-group" style="margin: 0 auto;">
			
				<div class="col-sm-5" style="float: left;">
					<div class="form-group">
						<label>ID </label> <input name="id" type="text"
							class="form-control" readonly="readonly" value="${member.id }">
					</div>
					<div class="form-group">
						<label>이름 </label> <input name="name" type="text"
							class="form-control" readonly="readonly" value="${member.name }">
					</div>
					<div class="form-group">
						<label>주민등록번호 </label> <input name="ssn" type="text"
							class="form-control" readonly="readonly" value="${member.ssn }">
					</div>
					<div class="form-group">
						<label>전화번호</label> <input name="tel" type="text"
							class="form-control" readonly="readonly" value="${member.tel }">
					</div>
					<div class="form-group">
						<label>E-mail</label> <input name="email" type="text"
							class="form-control" readonly="readonly" value="${member.email }">
					</div>
				</div>

				
			
			<button class="btn btn-primary btn-lg" type="button">Example
				button</button>
		</div>
	</div>
	<div class="row">
	<div class="row align-items-md-stretch">
		<div class="col-md-8">
			<div class="h-100 p-5 text-white bg-dark rounded-3">

				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="h-100 p-5 bg-light border rounded-3">

				<button class="btn btn-outline-secondary" type="button" style="">Example
					button</button>
			</div>
		</div>
	</div>
</div>

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
	<div class="container">
		<p>
			<button class="btn btn-primary" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseMap"
				aria-expanded="false" aria-controls="collapseMap" id="mapButton">지도
				보기</button>
		</p>
		<div class="collapse" id="collapseMap"></div>


		<table class="table1 table table-hover" id="datatablesSimple">
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
</div>
 --%>

<script>

	$(function() { //상시 동작 함!
		
		//병원 예약 목록
		$.ajax({
            url: 'http://192.168.0.120:9000/map/hospiter_list',
            //url: 'http://14.36.188.14:9000/map/hospiter_list',
            type: 'GET',
            dataType: 'jsonp',
            jsonp: 'callback',
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
	                jsonp: 'callback',
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