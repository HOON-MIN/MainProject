<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.testImg {
	background-color: white;
	height: 500px;
	border-radius: 16px;
}

.testImg2 {
	background-color: grey;
	height: 500px;
	border-radius: 16px;
}

.testImg3 {
	background-color: white;
	border-radius: 16px;
}

.testImg4 {
	padding: 0 15px;
	margin: 0 15px;
	height: 500px;
	background-color: white;
	border-radius: 16px;
	margin: 0 15px;
}

.cwrapper {
	position: relative;
}

.ctext {
	position: absolute;
	top: 50%;
	left: 30%;
	color: white;
	transform: translate(-90%, -50%);
}

.ctext2 {
	position: absolute;
	top: 50%;
	left: 20%;
	color: white;
	transform: translate(-90%, -50%);
}
</style>
<div class="container-fluid ">
	<div class="row mb-5">
		<div class="col-md-8">
			<div id="carouselExampleSlidesOnly" class="carousel-fade slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://ifh.cc/g/xf0gMX.jpg"
							class="d-block testImg w-100 cwrapper" alt="...">
						<div class="ctext">
							<img src="https://ifh.cc/g/ZlzOgY.png" alt="logo" style="width: 200px;">
							<p>
								비대면 의료 진단 포탈 서비스<br>당신의 건강을 지켜드립니다.
							</p>
						</div>
					</div>

					<div class="carousel-item">
						<div class="d-block w-100 testImg2" alt="..."></div>
					</div>
					<div class="carousel-item">
						<div class="d-block w-100 testImg" alt="..."></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6 col-md-4 row align-items-stretch">
			<div class="testImg3"></div>
		</div>
	</div>
	<article class="row justify-content-center">
		<div class="col-md-3">
			<h4 class="text-white" style="height: 500px">타이틀</h4>
		</div>
		<div class="col-md-8">
			<h4 class="text-white">Content</h4>
		</div>
	</article>


	<div class="row justify-content-center">
		<div class="col-md-5 testImg4"></div>
		<div class="col-md-6 testImg4"></div>
	</div>
</div>
</div>

<%-- <style>
/* 전체 틀 */
body {
	margin: 0;
}

.outer {
	height: 100vh;
	overflow-y: auto;
}

.outer::-webkit-scrollbar {
	display: none;
}

.inner {
	height: 100vh;
	position: relative;
	background-color: #3478f5;
}

.innerImg {
	height: 100%;
}

.mainImg {
	width:100%;
}

/* 첫 슬라이드  */
.textMain1 {
	position: absolute;
	top: 40%;
	left: 10%;
	width: 100%;
	color: white;
}

.btnMain1 {
	width: 10%;
	height: 10%;
	margin-top: 40px;
	padding: 10px;
	color: white;
	border: solid 1px #ffffff;
	border-radius: 20px;
	background-color: #80a7ce;
}

.btnMain1:hover {
	background-color: white;
	color: #80a7ce;
	border: solid 1px #ffffff;
	border-radius: 20px;
}

/* 두번째 슬라이드 */
.btnGroupMain2 {
	position: absolute;
	top: 22%;
	left: 50%;
	transform: translate(-50%, 0%);
}

.btnMain2 {
	width: 200px;
	height: 64px;
	color: #3478f5;
	font-weight: bolder;
	border: solid 1px #3478f5;
	margin: 0 16px;
	border-radius: 20px;
	background-color: white;
}

/* 세번째 슬라이드 */
.textMain3 {
	position: absolute;
	top: 30%;
	left: 40%;
	transform: translate(-50%, 0%);
	color: white;
}

.btnMain3 {
	width: 200px;
	height: 48px;
	margin-top: 40px;
	padding: 10px;
	color: white;
	border: solid 1px #ffffff;
	border-radius: 20px;
	background-color: #3478f5;
}
</style>
	<div class="inner">
		<div class="innerImg">
			<img src="https://ifh.cc/g/RXBz7C.jpg" class="mainImg" />
		</div>
		<div class="textMain1">
			<h2>HeyDr.</h2>
			<br></br> <span> 비대면 의료 통합 웹 서비스 <br> 삶의 질을 높여드리는 건강한 서비스
				입니다.
			</span> <br></br>
			<button class="btnMain1">병원리스트 보기</button>
		</div>
	</div>
	<div class="inner">
		<div class="innerImg">
			<img src=https://ifh.cc/g/tzoLJK.jpg class="mainImg" />
		</div>
		<div class="btnGroupMain2">
			<button type="button" class="btnMain2">App Store</button>
			<button type="button" class=" btnMain2">Google Play</button>
		</div>
	</div>
	<div class="inner">
        <div class="innerImg">
          <img src="https://ifh.cc/g/zTr63k.jpg" class="mainImg" />
        </div>
        <div class="textMain3">
          <h2>HeyDr.</h2>
          <br></br>
          <span>비대면 진료 와 약 배송을 한번에.</span>
          <br></br>
            <button class="btnMain3">서비스페이지로</button>
    
        </div>
      </div>
본문 끝 --%>