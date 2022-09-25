<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx8fc6162789f747579d26c53413bd30f7"></script>
<script type="text/javascript">
	var map, marker1;
	function initTmap() {
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(37.56520450, 126.98702028),
			width : "100%",
			height : "400px",
			zoom : 17,
			zoomControl : true,
			scrollwheel : true
		});
		marker1 = new Tmapv2.Marker(
				{
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		$(document)
				.ready(
						function() {

							var fullAddr = $("#fullAddr").val();
							$
									.ajax({
										method : "GET",
										url : "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
										async : false,
										data : {
											"appKey" : "l7xx8fc6162789f747579d26c53413bd30f7",
											"coordType" : "WGS84GEO",
											"fullAddr" : $("#endPoint").val()
										},
										success : function(response) {

											var resultInfo = response.coordinateInfo; // .coordinate[0];
											console.log(resultInfo);

											marker1.setMap(null);

											if (resultInfo.coordinate.length == 0) {
												$("#result").text(
														"요청 데이터가 올바르지 않습니다.");
											} else {
												var lon, lat;
												var resultCoordinate = resultInfo.coordinate[0];
												if (resultCoordinate.lon.length > 0) {

													lon = resultCoordinate.lon;
													lat = resultCoordinate.lat;
												} else {

													lon = resultCoordinate.newLon;
													lat = resultCoordinate.newLat
												}

												var lonEntr, latEntr;

												if (resultCoordinate.lonEntr == undefined
														&& resultCoordinate.newLonEntr == undefined) {
													lonEntr = 0;
													latEntr = 0;
												} else {
													if (resultCoordinate.lonEntr.length > 0) {
														lonEntr = resultCoordinate.lonEntr;
														latEntr = resultCoordinate.latEntr;
													} else {
														lonEntr = resultCoordinate.newLonEntr;
														latEntr = resultCoordinate.newLatEntr;
													}
												}

												var markerPosition = new Tmapv2.LatLng(
														Number(lat),
														Number(lon));

												marker1 = new Tmapv2.Marker(
														{
															position : markerPosition,
															icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
															iconSize : new Tmapv2.Size(
																	24, 38),
															map : map
														});
												map.setCenter(markerPosition);

												var matchFlag, newMatchFlag;

												var address = '', newAddress = '';
												var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
												var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;

												if (resultCoordinate.newMatchFlag.length > 0) {

													newMatchFlag = resultCoordinate.newMatchFlag;

													if (resultCoordinate.city_do.length > 0) {
														city = resultCoordinate.city_do;
														newAddress += city
																+ "\n";
													}

													if (resultCoordinate.gu_gun.length > 0) {
														gu_gun = resultCoordinate.gu_gun;
														newAddress += gu_gun
																+ "\n";
													}

													if (resultCoordinate.eup_myun.length > 0) {
														eup_myun = resultCoordinate.eup_myun;
														newAddress += eup_myun
																+ "\n";
													} else {

														if (resultCoordinate.legalDong.length > 0) {
															legalDong = resultCoordinate.legalDong;
															newAddress += legalDong
																	+ "\n";
														}

														if (resultCoordinate.adminDong.length > 0) {
															adminDong = resultCoordinate.adminDong;
															newAddress += adminDong
																	+ "\n";
														}
													}

													if (resultCoordinate.ri.length > 0) {
														ri = resultCoordinate.ri;
														newAddress += ri + "\n";
													}

													if (resultCoordinate.bunji.length > 0) {
														bunji = resultCoordinate.bunji;
														newAddress += bunji
																+ "\n";
													}

													if (resultCoordinate.newRoadName.length > 0) {
														newRoadName = resultCoordinate.newRoadName;
														newAddress += newRoadName
																+ "\n";
													}

													if (resultCoordinate.newBuildingIndex.length > 0) {
														newBuildingIndex = resultCoordinate.newBuildingIndex;
														newAddress += newBuildingIndex
																+ "\n";
													}

													if (resultCoordinate.newBuildingName.length > 0) {
														newBuildingName = resultCoordinate.newBuildingName;
														newAddress += newBuildingName
																+ "\n";
													}

													if (resultCoordinate.newBuildingDong.length > 0) {
														newBuildingDong = resultCoordinate.newBuildingDong;
														newAddress += newBuildingDong
																+ "\n";
													}

													if (lonEntr > 0) {
														var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
														var text = "검색결과(새주소) : "
																+ newAddress
																+ ",\n 응답코드:"
																+ newMatchFlag
																+ "(상세 코드 내역은 "
																+ docs
																+ " 에서 확인)"
																+ "</br> 위경도좌표(중심점) : "
																+ lat
																+ ", "
																+ lon
																+ "</br>위경도좌표(입구점) : "
																+ latEntr
																+ ", "
																+ lonEntr;
														$("#result").html(text);
													} else {
														var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
														var text = "검색결과(새주소) : "
																+ newAddress
																+ ",\n 응답코드:"
																+ newMatchFlag
																+ "(상세 코드 내역은 "
																+ docs
																+ " 에서 확인)"
																+ "</br> 위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
														$("#result").html(text);
													}
												}

												if (resultCoordinate.matchFlag.length > 0) {

													matchFlag = resultCoordinate.matchFlag;

													if (resultCoordinate.city_do.length > 0) {
														city = resultCoordinate.city_do;
														address += city + "\n";
													}

													if (resultCoordinate.gu_gun.length > 0) {
														gu_gun = resultCoordinate.gu_gun;
														address += gu_gun
																+ "\n";
													}

													if (resultCoordinate.eup_myun.length > 0) {
														eup_myun = resultCoordinate.eup_myun;
														address += eup_myun
																+ "\n";
													}

													if (resultCoordinate.legalDong.length > 0) {
														legalDong = resultCoordinate.legalDong;
														address += legalDong
																+ "\n";
													}

													if (resultCoordinate.adminDong.length > 0) {
														adminDong = resultCoordinate.adminDong;
														address += adminDong
																+ "\n";
													}

													if (resultCoordinate.ri.length > 0) {
														ri = resultCoordinate.ri;
														address += ri + "\n";
													}

													if (resultCoordinate.bunji.length > 0) {
														bunji = resultCoordinate.bunji;
														address += bunji + "\n";
													}

													if (resultCoordinate.buildingName.length > 0) {
														buildingName = resultCoordinate.buildingName;
														address += buildingName
																+ "\n";
													}

													if (resultCoordinate.buildingDong.length > 0) {
														buildingDong = resultCoordinate.buildingDong;
														address += buildingDong
																+ "\n";
													}

													if (lonEntr > 0) {
														var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
														var text = "검색결과(지번주소) : "
																+ address
																+ ","
																+ "\n"
																+ "응답코드:"
																+ matchFlag
																+ "(상세 코드 내역은 "
																+ docs
																+ " 에서 확인)"
																+ "</br>"
																+ "위경도좌표(중심점) : "
																+ lat
																+ ", "
																+ lon
																+ "</br>"
																+ "위경도좌표(입구점) : "
																+ latEntr
																+ ", "
																+ lonEntr;
														$("#result").html(text);
													} else {
														var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
														var text = "검색결과(지번주소) : "
																+ address
																+ ","
																+ "\n"
																+ "응답코드:"
																+ matchFlag
																+ "(상세 코드 내역은 "
																+ docs
																+ " 에서 확인)"
																+ "</br>"
																+ "위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다.";
														$("#result").html(text);
													}
												}
											}
										},
										error : function(request, status, error) {
											console.log(request);
											console.log("code:"
													+ request.status
													+ "\n message:"
													+ request.responseText
													+ "\n error:" + error);
											// 에러가 발생하면 맵을 초기화함
											// markerStartLayer.clearMarkers();
											// 마커초기화
											map.setCenter(new Tmapv2.LatLng(
													37.570028, 126.986072));
											$("#result").html("");

										}
									});
						});

	}
</script>
<body onload="initTmap()">
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
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
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
					<span class="nanum text-white" style="font-size: 12px;">
						일반회원 ・ <a href="">마이페이지</a>
					</span>
				</div>
				<!-- 카테고리 프로필 끝 -->
				<!-- 카테고리 리스트 -->
				<div>
					<ul class="nav flex-column">
						<li class="nav-item pt-5 pb-2 ps-4"><a
							class="nav-link active text-white" aria-current="page" href="#">약국
								리스트 카테고리 </a></li>
						<li class="nav-item pt-3 pb-2 ps-4"><a
							class="nav-link active text-white" aria-current="page" href="#">추가할거
								하세요 </a></li>
						<%-- 		<c:forEach var="e" items="${hcate }" varStatus="status">
						<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}"><a
							class="nav-link text-white" href="#">${e.hcate }</a></li>
						<c:choose>
							<c:when test="${status.index == 8}">
								<li class="nav-item pt-2 pb-2"></li>
							</c:when>
						</c:choose>
					</c:forEach> --%>

					</ul>
				</div>
			</div>
			<!-- 카테고리 영역 끝 -->
			<!-- 컨텐츠 (연회색배경) -->
			<div class="col-10">
				<div class="hboard pt-2 ps-3 pe-3">
					<!-- 검색바(필요없으면 없애세요) -->
					<div class="input-group searchForm mb-3" style="width: 50%";>
						<input type="text" class="form-control"
							aria-label="Recipient's username"
							aria-describedby="hospitalSearch" style="width: 160px;"
							placeholder="필요없으면 지워요
						">
						<button class="btn" type="button" id="hospitalSearch">
							<img alt="검색아이콘" src="/img/search.png">
						</button>
					</div>
					<div style="height: 80%;">
						<h3 class="hanna ps-3">약국 상세페이지</h3>
						<div class="row hDetail justify-content-around"
							style="height: 100%">
							<div class="col-5 map"
								style="background-color: white; border-radius: 8px;">
								<div id="map_div" class="mt-3" style="border-radius: 8px;"></div>
								<div class="map_act_btn_wrap clear_box"></div>
								<div>이쪽에 이름 넣고해도 되고 편하신대로 지도를 늘려도 되고</div>
							</div>
							<div class="col-6 map align-items-center ">
								<h1 class="hanna m-3">약국 이름</h1>

								<h5 class="nanum m-3 pt-3">약국 주소</h5>

								<h6 class="m-3">약국 URL</h6>
								<h6 class="m-3">약국 오픈 시간</h6>

								<p class="m-3" style="height: 240px">약국 소개</p>
								<button class="btn btn-lg mt-4 ms-3 hanna"
									style="border: solid 1px #3478f5; background: #3478f5; color: white; width: 240px">만들
									버튼</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<!-- 
	
	 -->
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
						href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=ploc&searchf=${fn:substring(shopDetail.ploc, 0, 5) }"
						style="color: #1d458d; font-weight: 600; text-decoration: underline;">
						${fn:substring(shopDetail.ploc, 0, 5) } </a> &gt; <a
						href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=ploc&searchf=${fn:substring(shopDetail.ploc, 0, 8) }"
						style="color: #1d458d; font-weight: 600; text-decoration: underline;">
						${fn:substring(shopDetail.ploc, 6, 8) } </a>
				</div>


			</div>

			<h1 class="my-1 hospital-doctor-name-box d-flex align-items-center">
				${shopDetail.pname }</h1>

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
						href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=ploc&searchf=${fn:substring(shopDetail.ploc, 0, 2) }"
						style="color: #494949; word-break: keep-all;">
						${fn:substring(shopDetail.ploc, 0, 2) }약국</a>
				</div>
				<div
					style="font-size: 14px; letter-spacing: -0.4px; background-color: rgba(233, 233, 233, 0.55); display: inline-block"
					class="m-1 p-1">
					<a
						href="${pageContext.request.contextPath}/pharmacy/ShopListPage?pnum=1&type=ploc&searchf=${fn:substring(shopDetail.ploc, 0, 10) }"
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
					class="hospital-button d-flex mr-3 align-items-center px-4">
					<!-- data-toggle="modal" data-target="#addImagesModal"> -->
					<img class="mr-1"
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/add_picture_button.png"
						style="width: 12px; height: 14px;" alt=""> <input
						type="button" id="btn1" value="상세정보 보기">
				</div>

				<div id="btn_share_hospital"
					style="font-size: 15px; height: 32px; line-height: 32px;">
					<img class="mr-1"
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/share_button.png"
						style="width: 12px; height: 14px;" alt="">
				</div>


				<div id="btn_bookmark_hospital"
					style="font-size: 15px; height: 32px; line-height: 32px;"
					class="hospital-button d-flex mr-3 align-items-center px-4">
					<img class="mr-1"
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/bookmark_non.png"
						style="width: 12px; height: 14px;" alt="">
				</div>


			</div>

			<div class="text-left">
				<div class="color49 mt-3"
					style="font-size: 14px; font-weight: 400; letter-spacing: -0.6px;">
					<img
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/mapmarkerShape.svg"
						class="mb-1 mr-1" alt="Responsive image"> ${shopDetail.ploc}

				</div>


				<div
					style="font-size: 14px; font-weight: 400; letter-spacing: -0.6px;"
					class="mt-2 ">
					<img
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/homepage.svg"
						class="mb-1 mr-1" alt="Responsive image"> <a
						class="website-link-click"
						href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${shopDetail.pname}"
						target="_blank" rel="noopener" style="color: #4c1192;"> 네이버에
						병원 검색하기 </a>
				</div>


				<div class="color49 mt-2"
					style="font-size: 14px; font-weight: 400; letter-spacing: -0.2px;">
					<img
						src="https://d23zwvh2kbhdec.cloudfront.net/static_22_09_01_1/img/phoneicon.svg"
						class="mb-1 mr-1" alt="Responsive image"> ${shopDetail.pnum}

				</div>
			</div>


		</div>
		<!--첫번째 박스 끝 -->

		<!-- 두번째 박스 시작(인증된 리뷰) -->


		<input type="hidden" id="endPoint" value="${shopDetail.ploc}">
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
				<p>약국 명 : ${shopDetail.pname}</p>
				<p>약국 번호 : ${shopDetail.pnum}</p>
				<p>주소 : ${shopDetail.ploc}</p>
				<p>위도 : ${shopDetail.plong} 경도 : ${shopDetail.plat}</p>
			</div>
		</div>
	</div>

</body>