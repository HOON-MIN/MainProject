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
					<c:forEach var="e" items="${hcate }" varStatus="status">
						<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}"><a
							class="nav-link text-white" href="#">${e.hcate }</a></li>

						<c:choose>
							<c:when test="${status.index == 8}">
								<li class="nav-item pt-2 pb-2"></li>
							</c:when>
						</c:choose>
					</c:forEach>

				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3 border">
				
				
			</div>
		</div>
	</div>
</div>

<%-- 
<div class="container" style="width: 800px;">
<article>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=997940d38b64cf7abf8986a573d68746"></script>
<header>
	<h1 style="text-align: center;">병원 상세정보</h1>
</header>
<ul class="list-unstyled"><li class="border-top my-3"></li></ul>
	
<fieldset>
<!--             <legend></legend> -->
  <form method="post" action="upUpdate" enctype="multipart/form-data" id="upform">
  <input type="hidden" id="cnum" name="cnum" value="${vo.cnum }">
  <input type="hidden" id="otime" name="otime" value="${vo.otime }">
  <input type="hidden" id="ctime" name="ctime" value="${vo.ctime }">
  <div class="row mb-3">
      <label>병원명</label>
  <input type="text" name="hname" id="hname" value="${vo.hname }" readonly="readonly"/>
  <span id="target"></span>
  </div>
  <div class="row mb-3">
      <label>위치</label>
  <input type="text" name="hloc" id="hloc" value="${vo.hloc }" readonly="readonly"/>
  </div>
  <div class="row mb-3">
      <label>영업시간</label>
  <input type="text" name="time" id="time" value="${time}" readonly="readonly"/>
  </div>
  <div class="row mb-3">
      <label>진료과목</label>
  <input type="text" name="hcate" id="hcate" value="${vo.hcate }" readonly="readonly"/>
  </div>
  <div class="row mb-3">
      <label>홈페이지</label>
  <input type="text" name="hurl" id="hurl" value="${vo.hurl }" readonly="readonly"/>
  </div>
  
  
  <div >
  	<input type="button" value="상담예약" id="btn1" class="btn btn-info"/>
  	<input type="button" value="진료예약" id="btn2" class="btn btn-info"/>
  </div>
  
  <div id="map" style="width:500px;height:400px;"></div>
  </form>
</fieldset>
</article>
</div> --%>

<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
