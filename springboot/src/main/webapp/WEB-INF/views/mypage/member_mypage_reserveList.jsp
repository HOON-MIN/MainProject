<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<style>
.table tr {
	cursor: pointer;
}
</style>

<div class="container-fluid">
<div>
<h3>예약목록</h3>
</div>
	
	<!-- table -->
	<div class="container">
		<div class="row">
		<div class="col">
			<div class="collapse multi-collapse" id="collapseMap">
				<div class="card card-body">
				<div style="text-align: center"><h3>예약 상세내역</h3>
				<table class="table2 table">
				<thead>
				<tr>
				<th>담당의사</th>
				<th>증상</th>
				<th>상세증상</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				
				</table>
				</div>
					<div id="map" style="width: 100%; height: 450px;"></div>
				</div>
			</div>
		</div>
		
		<table class="table1 table table-hover" id="datatable" style="text-align: center">
			<thead>
			
				<tr >
					<th scope="col">번호</th>
					<th scope="col">병원이름</th>
					<th scope="col">병원주소</th>
					<th scope="col">의사이름</th>
					<th scope="col">병원구분</th>
					<th scope="col">예약날짜</th>
					<th scope="col">상세보기</th>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="hvo" items="${vo }">
				<c:forEach var="dvo" items="${hvo.doctorVO }">
				<c:forEach var="rvo" items="${dvo.reserveVO }">
					<tr >
						<td>${rvo.r_num }</td>
						<td>${hvo.hname }</td>
						<td>${hvo.hloc }</td>
						<td>${dvo.dname }</td>
						<td>${hvo.hcate }</td>
						<td>${rvo.rdate } / ${rvo.rtime }</td>
						<td><input type="button" value="detail"id="detail"
						data-bs-toggle="collapse" data-bs-target="#collapseMap" aria-expanded="false" aria-controls="collapseMap">
						<input type="hidden" value="${rvo.reservNum }"id="rNum"></td>
					</tr>
				</c:forEach>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	</div>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script type="text/javascript" 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955&libraries=services,clusterer,drawing"></script>
<script>
var r_num;
var box;
var loc = {}
	$(function(){
		
		$('.table1').on('click','tr',function(){
			
			console.log(${num});
			r_num = $(this).children().children('#rNum').val();
			console.log('r_num => ' + r_num)
			setTimeout(function() {
			$.ajax({
				url:'memberMypage_list_Detail?num='+r_num,
						success:function(data){
							var dname = data.reserveVO[0].doctorVO.dname
							var symptom = data.reserveVO[0].symptom
							var symptomComm = data.reserveVO[0].symptomComm
							var hloc = data.reserveVO[0].doctorVO.hvo.hloc
							var hname = data.reserveVO[0].doctorVO.hvo.hname
							console.log('의사이름 = ',data.reserveVO[0].doctorVO.dname)
							console.log('증상 = ',data.reserveVO[0].symptom)
							console.log('증상상세 = ', data.reserveVO[0].symptomComm)
							console.log('병원이름 = ',data.reserveVO[0].doctorVO.hvo.hname)
							console.log('병원주소 = ',data.reserveVO[0].doctorVO.hvo.hloc)
							
							box = '<tr><td>'+dname+'</td><td>'+symptom+'</td><td>'+symptomComm+'</td></tr>'
							document.querySelector('.table2 tbody').innerHTML=box
							loc={'content':'<div style="width:150px;text-align:center;padding:6px 0;">'+ hname +'</div>'}
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			 // 바로 적용시 지도가 깨지므로 딜레이 넣어줌
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			// 지도 크기 조절이벤트
			var zoomControl = new kakao.maps.ZoomControl();
    		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(hloc , function(result, status) {
				
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				console.log('작동함!! result = >' , result)
				console.log('작동함!! status' , status)
				// 검색한 좌표!!
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x); // 좌표를 String 타입으로 줌
				var searchY = Number(result[0].y);
				var searchX = Number(result[0].x);
				
				//현재 위치 좌표!!
				navigator.geolocation.getCurrentPosition(function(position) {
					var lat = position.coords.latitude, // 위도
	   				lon = position.coords.longitude; // 경도
	   				var locPosition = new kakao.maps.LatLng(lat, lon); //좌표로 생성
	   				var midY = (searchY+lat)/2
	   				var midX = (searchX+lon)/2
	   				var mid = new kakao.maps.LatLng(midY,midX);
	   				message = '<div style="width:150px;text-align:center;padding:6px 0;">현재위치!!</div>';
	        		//마커생성전에 좌표모아서 선언
	   				var positions = [
	        			{
	        		        title: hname, 
	        		        latlng: coords
	        		    },
	        			{
	        		        title: message, 
	        		        latlng: locPosition
	        		    }];
	        		console.log('searchY = ',searchY)
	        		console.log('searchX = ',searchX)
	        		console.log('midY = ',midY)
	        		console.log('midX = ',midX)
	        		console.log('lat = ',lat)
	        		console.log('lon = ',lon)
	        		
	        		
				for(var i =0; i<positions.length;i++){
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
			            map: map,
			            position: positions[i].latlng,
			            title : positions[i].title
			        });
					console.log('찾는곳,현재위치 = ',positions[i].latlng)
				
					// 인포윈도우로 장소에 대한 설명을 표시합니다

			        var iwContent = positions[i].title, // 인포윈도우에 표시할 내용
        			iwRemoveable = true;
        			
        			var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우를 생성합니다
        				content : iwContent,
        				removable : iwRemoveable
        			});
        			// 인포윈도우를 마커위에 표시합니다 
        			infowindow.open(map, marker)
			        
			        // 지도 크기 조절
					 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					
			        marker.setMap(map);
			        
				}
	        		var level = map.getLevel()
					map.setLevel(level+5)
					map.setCenter(mid)
					
				});
		    } 
		});  // - addressSearch 
			 // delay
						}	//- success
					}) //- ajax
		},500);
				})
				
		});
			
</script>