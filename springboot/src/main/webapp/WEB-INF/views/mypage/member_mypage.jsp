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
<!-- <script>
	var sessionGrade = '${sessionHGRADE}'
	$('#hgrade').click(function() {
		console.log('sessionGrade = ' + sessionGrade)
		if (sessionGrade == '베이직') {
			alert('프리미엄등급으로 등록을 해주세요!!')
		} else {
			location.href = '${mycontext }/hospitalP/dashboard'
		}
	})
</script> -->

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
				<h5 class="hanna text-white"">${member.name }님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="${pageContext.request.contextPath }/member/memberMypage">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<c:choose>
						<c:when test="${sessionNUM != null}">
							<li class="nav-item pt-5 pb-2 ps-4"><a
								class="nav-link active text-white" aria-current="page"
								href="${pageContext.request.contextPath }/admin/adminHospTotalList">
									전체 병원 </a></li>
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/memberMypage_list">예약목록
							</a>
							</li>

						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="hboard pt-2 ps-3 pe-3 border">
					<div class="justify-content-center"
						style="border: solid 1px tomato;">
						<h3 class="hanna ps-3 text-center">개인정보</h3>
						<div class="border  justify-content-center ">

							<form>
								<div class="border  justify-content-center ">
									<div class= "col-6">
										<label>이름 </label> <input name="name" type="text"
											class="form-control" readonly="readonly"
											value="${member.name }">
									</div>
									<div class="col-6">
										<label>ID </label> 
										<input name="id" type="text"
											class="form-control" readonly="readonly"
											value="${member.id }">
									</div>
								</div>
								<div class="form-group">
									<label for="nickname">성별</label> <input type="text"
										class="form-control" id="gender" name="gender"
										style="width: 30%;" value="${member.gender }"
										style=" width:30%; " readonly="readonly"> <label
										for="nickname">나이</label> <input type="text"
										class="form-control" id="age" name="age"
										value="${member.age }" style="width: 30%;" readonly="readonly">
								</div>

								<div class="col-sm-5" style="float: left;">
									<div class="form-group">
										<label>주민등록번호 </label> <input name="ssn" type="text"
											class="form-control" readonly="readonly"
											value="${member.ssn }">
									</div>
									<div class="form-group">
										<label>전화번호</label> <input name="tel" type="text"
											class="form-control" readonly="readonly"
											value="${member.tel }">
									</div>
									<div class="form-group">
										<label>E-mail</label> <input name="email" type="text"
											class="form-control" readonly="readonly"
											value="${member.email }">
									</div>
									<div class="form-group">
										<label>가입일자</label> <input name="email" type="text"
											class="form-control" readonly="readonly"
											value="${member.mdate }">
									</div>
									<button class="btn btn-primary btn-lg" type="button"
										style="float: inherit;"
										onclick="location.href='updateMypageForm'">정보 수정</button>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
</div>

<%-- 
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<!-- Sidebar-->
<div class="container py-4"
	style="width: 80%; margin: auto; padding: 10px 5px; height: 100%;">


	<h1 class="display-5 fw-bold">프로필 정보</h1>
	<div class="container">
		<div class="col-sm-5" style="float: left;">
			<div class="form-group">
				<img src="${pageContext.request.contextPath }/imgfile/${member.profimg }" class="picture-src"
					id="profimg" style="width: 200px; height: 150px;" />
			</div>
			<div class="form-group">
				<label>이름 </label> <input name="name" type="text"
					class="form-control" readonly="readonly" value="${member.name }"
					style="width: 70%">
			</div>
			<div class="form-group">
				<label>ID </label> <input name="id" type="text" class="form-control"
					readonly="readonly" value="${member.id }" style="width: 70%">
			</div>
			<div class="form-group">
				<label for="nickname">성별</label> <input type="text"
					class="form-control" id="gender" name="gender" style="width: 30%;"
					value="${member.gender }" style=" width:30%; " readonly="readonly">
				<label for="nickname">나이</label> <input type="text"
					class="form-control" id="age" name="age" value="${member.age }"
					style="width: 30%;" readonly="readonly">
			</div>
		</div>

		<div class="col-sm-5" style="float: left;">
			<div class="form-group">
				<label>주민등록번호 </label> <input name="ssn" type="text"
					class="form-control" readonly="readonly" value="${member.ssn }">
			</div>
			<div class="form-group">
				<label>전화번호</label> <input name="tel" type="text"
					class="form-control" readonly="readonly" value="${member.tel }">
			</div>
			<div class="form-group">
				<label>E-mail</label> <input name="email" type="text"
					class="form-control" readonly="readonly" value="${member.email }">
			</div>
			<div class="form-group">
				<label>가입일자</label> <input name="email" type="text"
					class="form-control" readonly="readonly" value="${member.mdate }">
			</div>
			<button class="btn btn-primary btn-lg" type="button"
				style="float: inherit;" onclick="location.href='updateMypageForm'">
				정보 수정</button>
		</div>
	</div>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
 --%>