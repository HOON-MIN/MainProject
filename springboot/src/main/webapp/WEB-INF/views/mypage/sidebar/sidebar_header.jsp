<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid" style="height: 100%; ">
	<div class="row justify-content-around" style="height: 100%; background: #3478f5;  ">

		<!-- Sidebar-->
		<c:choose>
			<c:when test="${sessionNUM == 1}">
				<div class="col-2 hcategory ">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" alt="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">${sessionNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							관리자 ・ <a
							href="${pageContext.request.contextPath }/admin/adminHospTotalList" style="text-decoration: none;color: white;">관리자
								페이지</a>
						</span>
					</div>
					<div>
						<ul class="nav flex-column">

							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/adminHospTotalList">전체병원</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/adminHospRegistList">등록된병원</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/admin/waitingList">업체가입대기목록</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/test">차트</a>
							</li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/hospitalP/dashboard">Analysis Dashboard</a>
							</li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:when test="${sessionNUM != null}">
				<div class="col-2 hcategory ">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}"  style="height: 40%;" class="rounded-circle img-fluid">
						<h5 class="hanna text-white">${sessionNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							일반회원 ・ <a style="text-decoration: none;color: white;"
							href="${pageContext.request.contextPath }/member/memberMypage"
							>마이페이지</a>
						</span>
					</div>
					<div>
						<ul class="nav flex-column">
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/memberMypage_list"
								>예약목록
							</a></li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/selectPlist"
								>처방전
							</a></li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/medInq/medInqForm"
								>문진표
							</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			
			<c:when test="${sessionDNUM != null}">
				<div class="col-2 hcategory ">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">${sessionDNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;"> 의사
							・ <a href="${pageContext.request.contextPath }/doctor/doctorMypage" 
							style="text-decoration: none;color: white;">스케줄	표</a>
						</span>
					</div>
				</div>
			</c:when>
			<c:when test="${sessionCNUM != null}">
				<div class="col-2 hcategory ">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">${sessionCNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							사업주 ・ ${sessionHGRADE}</span>
					</div>
					
					<div>
						<ul class="nav flex-column">
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/memberMypage_list">예약목록
							</a></li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/doctor/joinDoctorForm">Add
									Doctor</a></li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/company/hospitalDoctorList">Doctor
									List</a></li>
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="#" id="hgrade">Analysis Dashboard</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-2 hcategory ">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">게스트 님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							게스트 ・ <a style="text-decoration: none;color: white;"
							href="${pageContext.request.contextPath }/member/memberLoginForm">회원가입</a>
						</span>
					</div>
					<div>
						<ul class="nav flex-column">
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/memberMypage_list">예약목록
							</a></li>
						</ul>
					</div>
				</div>
			</c:otherwise>

		</c:choose>
		<!-- 전체 틀 시작 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="justify-content-center">
				
						<!-- 내용 -->






						