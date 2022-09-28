<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}" />


<style>
.navbar {
	margin-top: 0px !important;
}

nav {
	background-color: #3478f5;
	!
	important;
}

.navitem {
	border: bottom solid 1px #232323;
}



.navitem a {
	font-weight: bold;
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="${mycontext}/main"> <img
			src="/img/logo_white.png" alt="" width="100"
			class="d-inline-block align-text-top me-3" />
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link  pe-5"
					href="${mycontext }/hospital/hospitalList">진료과</a></li>
				<li class="nav-item"><a class="nav-link  pe-5"
					href="${mycontext }/doctor/doctorList"">의료진</a></li>
				<li class="nav-item"><a class="nav-link  pe-5" href="${mycontext }/pharmacy/ShopListPage">약국</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> 의료서비스 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="${mycontext}/member/COVIDcheck">코로나진단</a></li>
						<li><a class="dropdown-item" href="${mycontext}/drugSearchShape">약조회서비스</a></li>
						<li><a class="dropdown-item" href="http://localhost:3000/" target='_blank'>비대면진료서비스</a></li>
					</ul></li>
			</ul>
			<span class="navbar-text">
				<div class="navbar-nav">
					<c:choose>
						<c:when test="${sessionNUM == 1}">
							<a class="nav-link" href="${mycontext }/admin/adminHospTotalList">관리자페이지</a>
							<a class="nav-link active" aria-current="page"
								href="${mycontext }/member/memberLogout">로그아웃</a>
						</c:when>
						<c:when test="${sessionNUM != null}">
							<a class="nav-link" href="${mycontext }/member/memberMypage">마이페이지</a>
							<a class="nav-link active" aria-current="page"
								href="${mycontext }/member/memberLogout">로그아웃</a>
						</c:when>
						<c:when test="${sessionDNUM != null}">
							<a class="nav-link" href="${mycontext }/doctor/doctorMypage">의사페이지</a>
							<a class="nav-link active" aria-current="page"
								href="${mycontext }/doctor/doctorLogout">로그아웃</a>
						</c:when>
						<c:when test="${sessionCNUM != null}">
							<a class="nav-link" href="${mycontext }/company/companyMypage">병원페이지</a>
							<a class="nav-link active" aria-current="page"
								href="${mycontext }/company/companyLogout">로그아웃</a>
						</c:when>

						<c:otherwise>
							<a class="nav-link active" aria-current="page"
								href="${mycontext }/member/memberLoginForm">로그인</a>
							<a class="nav-link" href="${mycontext }/company/joinChoice">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>
			</span>
		</div>
	</div>
</nav>
