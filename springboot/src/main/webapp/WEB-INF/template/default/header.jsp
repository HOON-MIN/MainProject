<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}" />


<style>
.navitem {
	border: bottom solid 1px #232323;
}

.navitem li {
	margin-right: 16px;
}

.navitem a {
	font-weight: bold;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="${mycontext}/main"> <img
			src="https://ifh.cc/g/G0bQfL.png" alt="" width="100"
			class="d-inline-block align-text-top" />
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown ms-5 me-3"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarScrollingDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 병원 리스트 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<li class="nav-item dropdown me-3"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarScrollingDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 약품 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<li class="nav-item dropdown me-3"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarScrollingDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 후기 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
							<li><a class="dropdown-item" href="${mycontext }/reviewboard/reviewboardlist">후기 게시판</a></li>
						<c:if test="${sessionID != null}">
							<li><a class="dropdown-item" href="${mycontext }/reviewboard/reviewupForm">후기 게시판 작성</a></li>
						</c:if>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarScrollingDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 의료 지식인 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
			</ul>
			<span class="navbar-text">
				<div class="navbar-nav">
					<c:choose>
						<c:when test="${sessionNUM == 1}">
							<a class="nav-link" href="${mycontext }/member/test">관리자페이지</a>
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
