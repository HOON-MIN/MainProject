<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=997940d38b64cf7abf8986a573d68746"></script>

	<header>
		<h1 style="text-align: center;">병원 상세정보</h1>
	</header>
	<ul class="list-unstyled"><li class="border-top my-3"></li></ul>
	<div class="container" style="width: 800px;">
	<%-- boardForm 들어갈 자리! --%>
	<fieldset>
<!--             <legend></legend> -->
            <form method="post" action="upUpdate" enctype="multipart/form-data" id="upform">
            <input type="hidden" id="hnum" name="hnum" value="${vo.hnum }">
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
            <div class="row mb-3">
                <label>email</label>
            <input type="text" name="hemail" id="hemail" value="${vo.hemail }" readonly="readonly"/>
            </div>
            
            <div >
            	<input type="button" value="상담예약" id="btn1" class="btn btn-info"/>
            	<input type="button" value="진료예약" id="btn2" class="btn btn-info"/>
            </div>
            
            <div id="map" style="width:500px;height:400px;"></div>
            </form>
    </fieldset>
	
    </div>

</article>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
