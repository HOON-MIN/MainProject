<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이지 기본 틀  -->
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
}

a {
	text-decoration: none;
	color: white;
}

.detail-img {
	margin-bottom: -16px;
}

.detailImg {
	width: 320px;
}

.revBtn {
	padding: 8px 0;
}
</style>

<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 (이쪽 세션 처리 하셔야합니다)-->
			<c:choose>
			<c:when test="${sessionNUM != null}">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">${sessionNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							일반회원 ・ <a href="">마이페이지</a>
						</span>
					</div>
					
			</c:when>
			<c:when test="${sessionNUM == null}">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">게스트 님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							게스트 ・ <a
							href="${pageContext.request.contextPath }/member/joinForm">회원가입</a>
						</span>
					</div>
					
			</c:when>
		</c:choose>
		
			<!-- 카테고리 프로필 끝 -->

			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link active text-white" aria-current="page"
						href="${pageContext.request.contextPath}/doctor/doctorList">돌아가기</a></li>
					<!-- 이안에 본인 카테고리 나눠주세요 -->
					<%-- 	<c:forEach var="e" items="${hcate }" varStatus="status">
						
						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.hcate }" 
							name="hbtn${status.index}"
							><a 
							class="hcatebtn nav-link text-white" href="#">${e.hcate }</a></li>
						<input type="button" name="hbtn${status.index}"
							value="${e.hcate }" class="hcatebtn btn btn-outline-primary" />
					</c:forEach> --%>
				</ul>
			</div>
			<!-- 카테고리 리스트 끝 -->
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		
		<div class="col-10 flex-column h-100">
			<div class="hboard pt-2 ps-3 pe-3 pb-3" style="height: 95%;">
				<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
				<div>
					<div class="text-center detail-img">
						<img src=/img/doctor_detail.png class="detailImg" alt="..." />
					</div>
					<div class="d-flex justify-content-center ">

						<div class="card border-0 p-2">
							<div class="card-body ">
								<div class="detailStatus">
									<strong>현재 진료가능</strong>
								</div>
								<h5 class="card-title">
									<strong>${dvo.dname }</strong>
								</h5>
								<span class="detail-card-text"> ${dvo.hvo.hname } </span> <span
									class="detail-card-text"> 리뷰 : 1,045 <i
									class="bi bi-chevron-double-right"></i>
								</span>
								<div class="mt-2 d-flex flex-start">
									<button class="btn btn-primary me-1 disabled" type="button">
										${dvo.dmajor }</button>
								</div>
							</div>
							<div class="card-body border-top border-bottom ">
								<p>
									<strong>진료시간 </strong> ${dvo.hvo.otime } ~ ${dvo.hvo.ctime }
								</p>
								<p>
									<strong>점심시간 </strong>13:00 ~ 14:00
								</p>
							</div>
							<div class="card-body border-bottom">
								<p>
									<strong>진료과목</strong> ${dvo.dmajor }
								</p>
								<p>
									<strong>약력 </strong> ${dvo.dmajor }
								</p>
							</div>
							<div class="card-body border-bottom">
								<h6>
									<strong>의사소개</strong>
								</h6>
								<div class="card-text">
									안녕하세요 ${dvo.dname } 의사입니다. <br /> 친절하고 꼼꼼하게 진료하겠습니다. <br />
									*다이어트 포함 비급여 항목 확인해주세요
								</div>
							</div>
							<div class="card-body border-bottom">
								<h6>
									<strong>병원위치</strong>
								</h6>
								<div class="card-text">${dvo.hvo.hloc }</div>
							</div>
							<!-- <div class="col-5 map" style="background-color: white;"id="map">지도
														표시 공간</div>-->
							<button class="btn bg-primary btn-lg text-white mt-3 revBtn" 
							onclick="location.href='${pageContext.request.contextPath}/hospital/hospitalDetail?num=${dvo.hvo.cnum }'">
								예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 영역 끝 -->
	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955&libraries=services,clusterer,drawing"></script>
<script>
var hloc = '${dvo.hvo.hloc}';
var hname = '${dvo.hvo.hname}';
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

// 지도 생성    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소검색 => 좌표 반환
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch(hloc, function(result, status) {
// 주소값이 실제 존재한다면 
 if (status === kakao.maps.services.Status.OK) {
    	// 위도,경도(result)를 받아서 map의 좌표 객체로 변환
	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    // 마커로 등록
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
    // 마커 설명(병원 이름)
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+hname+'</div>'
    });
    infowindow.open(map, marker);
	// 지도가 생성되었을때 병원을 지도의 중심으로 설정 
    map.setCenter(coords);
} 
});  

</script>
