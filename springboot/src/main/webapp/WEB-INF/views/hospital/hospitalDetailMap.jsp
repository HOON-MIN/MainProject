<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				
			<div class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<c:choose>
				<c:when test="${sessionNUM != null }">
				<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" alt="taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">${sessionNAME } 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
				</c:when>
				<c:when test="${sessionNUM == null }">
				<img src="/taejin/img/doc3.svg" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 
				<a href="${pageContext.request.contextPath }/member/memberLoginForm">로그인</a> ・ <a href="${pageContext.request.contextPath }/member/joinForm">회원가입</a>
				</span>
				</c:when>
				</c:choose>
				
			
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<form class="sForm" name="sForm" method="get" action="hospitalList">
					<input type="hidden" name="category" id="category" value="all">
					<input type="hidden" name="searchreset" value="1" hidden="hidden"> 
				</form>
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4" ><a 
						class="hcateAllbtn nav-link active text-white" aria-current="page" href="#">모든 진료과</a></li>
					<c:forEach var="e" items="${hcate }" varStatus="status">
						
						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.hcate }" 
<%-- 							name="hbtn${status.index}" --%>
							><a 
							class="hcatebtn nav-link text-white" href="#">${e.hcate }</a></li>
<%-- 						<input type="button" name="hbtn${status.index}" --%>
<%-- 							value="${e.hcate }" class="hcatebtn btn btn-outline-primary" /> --%>
					</c:forEach>


				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="input-group searchForm mb-3" style="width: 50%";>
				
				</div>
				<div style="height: 80%;">
					<h3 class="hanna ps-3">병원 상세페이지</h3>
					<div class="row hDetail justify-content-around"
						style="height: 100%">
						<div class="col-5 map" style="background-color: white;"id="map">지도
							표시 공간</div>
						<div class="col-6 map align-items-center ">
							<h1 class="hanna m-3">${vo.hname }</h1>

							<h5 class="nanum m-3 pt-3">
								주소 : ${vo.hloc }
								</h5>

								<h6 class="m-3">URL : ${vo.hurl }</h6>
								<h6 class="m-3">영업시간 : ${vo.otime} ~ ${vo.ctime }</h6>

								<button class="btn btn-lg mt-4 ms-3 hanna"
									style="border: solid 1px #3478f5; background: #3478f5; color: white; width: 240px"
									onclick="reserve_form()" id="reserveBtn">예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0af4a9fb4dc2835eb629734419955&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">		
var hloc = '${vo.hloc}';
var hname = '${vo.hname}';
var cnum = ${vo.cnum};
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

$('#reserveBtn').click(function(){
	location.href='${pageContext.request.contextPath}/reserve/choice_doctor?cnum='+cnum
})

$('.hcatebtn').click(function() {
	var hcatename = $(this).text();
//		if( $(this).val() == 'all'){
	if( hcatename == '모든 진료과'){
		location.href='${pageContext.request.contextPath}/hospital/hospitalList'
	}
	console.log('hcatename => ', hcatename)
//		$("#hcate").attr("selected", "selected");
	$("#hsearch").val(hcatename);
	$(".sForm").submit();
});
</script>
<!-- </head> -->
<!-- <body onload="initTmap()"> -->
<%-- <div class="">

	<div id="map_wrap" class="map_wrap">
		<div id="map_div"></div>
	</div>
	<div class="map_act_btn_wrap clear_box"></div>

</div>
<div class="row p-3">
	<div class="doctor-in-detail-doctor-box col-8 border-0">

		<!-- 첫번째 박스시작 -->
		<!-- <div class="col-6" > -->
		<div
			class="col-20 text-left d-flex align-items-center justify-content-between pt-2"
			style="width: 100%;">
			<div style="font-weight: 300;">
				<a
					href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=fullAddress&searchf=${fn:substring(shopDetail.fullAddress, 0, 5) }"
					style="color: #1d458d; font-weight: 600; text-decoration: underline;">
					${fn:substring(shopDetail.fullAddress, 0, 5) } </a> &gt; <a
					href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=fullAddress&searchf=${fn:substring(shopDetail.fullAddress, 0, 8) }"
					style="color: #1d458d; font-weight: 600; text-decoration: underline;">
					${fn:substring(shopDetail.fullAddress, 6, 8) } </a>
			</div>






		</div>

		<h1 class="my-1 hospital-doctor-name-box d-flex align-items-center">
			${shopDetail.shopName }</h1>

		<div class="d-flex align-items-start py-2 color49 pb-1">
			<img
				src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mdd_event/Star-Full-icon.svg"
				class="star-image2"> <img
				src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mdd_event/Star-Full-icon.svg"
				class="star-image2"> <img
				src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mdd_event/Star-Full-icon.svg"
				class="star-image2"> <img
				src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mdd_event/Star-Full-icon.svg"
				class="star-image2"> <img
				src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mdd_event/Star-Full-icon.svg"
				class="star-image2">
		</div>
		<div class=" pb-2 text-left my-3">
			<div
				style="font-size: 14px; letter-spacing: -0.4px; background-color: rgba(233, 233, 233, 0.55); display: inline-block"
				class="m-1 p-1">
				<a
					href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=fullAddress&searchf=${fn:substring(shopDetail.fullAddress, 0, 2) }"
					style="color: #494949; word-break: keep-all;">
					${fn:substring(shopDetail.fullAddress, 0, 2) }약국</a>
			</div>
			<div
				style="font-size: 14px; letter-spacing: -0.4px; background-color: rgba(233, 233, 233, 0.55); display: inline-block"
				class="m-1 p-1">
				<a
					href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=fullAddress&searchf=${fn:substring(shopDetail.fullAddress, 0, 10) }"
					style="color: #494949; word-break: keep-all;">근처 병원</a>
			</div>
			<div
				style="font-size: 14px; letter-spacing: -0.4px; background-color: rgba(233, 233, 233, 0.55); display: inline-block"
				class="m-1 p-1">
				<a href="#" style="color: #494949; word-break: keep-all;">미정</a>
			</div>
			<div
				style="font-size: 14px; letter-spacing: -0.4px; background-color: rgba(233, 233, 233, 0.55); display: inline-block"
				class="m-1 p-1">
				<a href="/hospitals/?search_query=강남역 슈링크"
					style="color: #494949; word-break: keep-all;">미 정</a>
			</div>

		</div>



		<!--찜하기, 공유하기 버튼-->
		<div class="pb-4  border-bottom d-flex">

			<div id="btn_write_review"
				style="background-color: #4C1192; color: white; font-size: 15px; height: 32px; line-height: 32px;"
				class="hospital-button d-flex mr-3 align-items-center px-4"
				onclick="ajax_web_event_logging('click', {component_type: 'btn', component_pos: 'top', component_func: 'write_review', following_page_url: '/mdd_event/?past_url=https%3A//www.modoodoc.com/hospital/17262/%25EB%25B2%25A0%25EB%25A6%25AC%25EA%25B5%25BF%25EC%2584%25B1%25ED%2598%2595%25EC%2599%25B8%25EA%25B3%25BC%25EC%259D%2598%25EC%259B%2590-%25EC%2584%259C%25EC%259A%25B8-%25EC%2584%259C%25EC%25B4%2588%25EB%258F%2599/'})">
				<img class="mr-1"
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/write_review_button.png"
					style="width: 12px; height: 14px;" alt=""> 리뷰하기
			</div>


			<div id="btn_add_hospital_picture"
				style="font-size: 15px; height: 32px; line-height: 32px;"
				class="hospital-button d-flex align-items-center px-4">
				<!-- data-toggle="modal" data-target="#addImagesModal"> -->
				<img class="mr-1"
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/add_picture_button.png"
					style="width: 12px; height: 14px;" alt=""> <input
					type="button" id="btn1" value="상세정보 보기">
			</div>

			<div id="btn_add_hospital_picture"
				style="font-size: 15px; height: 32px; line-height: 32px;"
				class="hospital-button d-flex align-items-center px-2">
				<!-- data-toggle="modal" data-target="#addImagesModal"> -->
				<img class="mr-1"
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/add_picture_button.png"
					style="width: 12px; height: 14px;" alt="">
				           	<input type="button" id="btn1" value="예약하기" onclick="location.href='${pageContext.request.contextPath }/reserve/reserveForm'">
				<input type="button" id="reservBtn" value="예약하기"
					onclick="location.href='${pageContext.request.contextPath }/reserve/choice_doctor?cnum=${vo.cnum }'">
			</div>

			<div id="btn_share_hospital"
				style="font-size: 15px; height: 32px; line-height: 32px;">
				<img class="mr-1"
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/share_button.png"
					style="width: 12px; height: 14px;" alt=""> 공유하기
			</div>


			<div id="btn_bookmark_hospital"
				style="font-size: 15px; height: 32px; line-height: 32px;"
				class="hospital-button d-flex mr-3 align-items-center px-4">
				<img class="mr-1"
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/bookmark_non.png"
					style="width: 12px; height: 14px;" alt=""> 찜하기
			</div>


		</div>

		<div class="text-left">
			<div class="color49 mt-3"
				style="font-size: 14px; font-weight: 400; letter-spacing: -0.6px;">
				<img
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mapmarkerShape.svg"
					class="mb-1 mr-1" alt="Responsive image">
				${shopDetail.fullAddress}

			</div>


			<div
				style="font-size: 14px; font-weight: 400; letter-spacing: -0.6px;"
				class="mt-2 ">
				<img
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/homepage.svg"
					class="mb-1 mr-1" alt="Responsive image"> <a
					class="website-link-click"
					href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${shopDetail.shopName}"
					target="_blank" rel="noopener" style="color: #4c1192;"> 네이버에
					병원 검색하기 </a>
			</div>


			<div class="color49 mt-2"
				style="font-size: 14px; font-weight: 400; letter-spacing: -0.2px;">
				<img
					src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/phoneicon.svg"
					class="mb-1 mr-1" alt="Responsive image">

				${shopDetail.shopNumber}

			</div>
		</div>


	</div>
	<!--첫번째 박스 끝 -->

	<!-- 두번째 박스 시작(인증된 리뷰) -->


	<input type="hidden"id="endPoint" value="${shopDsetail.fullAddress}">
	<script type="text/javascript">
		$(function() {
			$('#btn1').click(function() {

				if ($('#tet').css("display") == "none") {
					$('#tet').show();
				} else {
					$('#tet').hide();
				}

			});
		});
	</script>


	<div class="row border-top border-bottom px-3 middle-tab"
		style="top: 72px !important;">
		<div class="col-8 doctorpage-tabbar" id="tet" style="display: none;">
			<p></p>
			<p>병원 번호 : ${shopDetail.pnum}</p>
			<p>병원 명 : ${shopDetail.shopNumber}</p>
			<p>${shopDetail.sales} : ${shopDetail.businessStatus}</p>
			    	<p>현재 영업상태 : ${shopDetail.businessStatus}</p>
			<p>위치 : ${shopDetail.roadAddress }</p>
			<p>영업시간 : ${shopDetail.managementNumber }</p>
			<p>진료과목 : ${shopDetail.operatingArea }m</p>
					<p>위도 : ${shopDetail.latitude } 경도 : ${shopDetail.longitude }</p>

		</div>
	</div>
</div> --%>

<!-- </body> -->
<!-- </html> -->