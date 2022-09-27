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
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->

			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link active text-white" aria-current="page"
						href="#">의사 디테일</a></li>
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link active text-white" aria-current="page"
						href="${pageContext.request.contextPath}/doctor/doctorList">의사
							리스트</a></li>
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
									<strong> 의사 이름 의사</strong>
								</h5>
								<span class="detail-card-text"> 병원이름 </span> <span
									class="detail-card-text"> 리뷰 : 1,045 <i
									class="bi bi-chevron-double-right"></i>
								</span>
								<div class="mt-2 d-flex flex-start">
									<button class="btn btn-primary me-1 disabled" type="button">
										진료과</button>
								</div>
							</div>
							<div class="card-body border-top border-bottom ">
								<p>
									<strong>진료시간 </strong> 09:00 ~ 18:00
								</p>
								<p>
									<strong>점심시간 </strong>13:00 ~ 14:00
								</p>
							</div>
							<div class="card-body border-bottom">
								<p>
									<strong>진료과목</strong> 진료과
								</p>
								<p>
									<strong>약력 </strong> 진료과
								</p>
							</div>
							<div class="card-body border-bottom">
								<h6>
									<strong>의사소개</strong>
								</h6>
								<div class="card-text">
									안녕하세요 {props.doctor.dname} 의사입니다. <br /> 친절하고 꼼꼼하게 진료하겠습니다. <br />
									*다이어트 포함 비급여 항목 확인해주세요
								</div>
							</div>
							<div class="card-body border-bottom">
								<h6>
									<strong>병원위치</strong>
								</h6>
								<div class="card-text">병원주소</div>
							</div>

							<button class="btn bg-primary btn-lg text-white mt-3 revBtn">
								예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 영역 끝 -->
	</div>
</div>
