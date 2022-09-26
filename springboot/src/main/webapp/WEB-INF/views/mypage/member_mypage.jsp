<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<div style="height: 80%;">
					<h3 class="hanna ps-3">${sessionNAME }님의 마이페이지</h3>
					<div class="row hDetail justify-content-around"
						style="height: 100%">
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form>
				<div class="container">
					<div class="justify-content-center ">
						<div class="form-group" >
							<div class="form-group">
								<label>이름 </label> <input name="name" type="text"
									class="form-control" readonly="readonly"
									value="${member.name }">
							</div>
							<div class="form-group">
								<label>ID </label> <input name="id" type="text"
									class="form-control" readonly="readonly" value="${member.id }">
							</div>

							<div class="form-group">
								<label for="nickname">성별</label> <input type="text"
									class="form-control" id="gender" name="gender"
									value="${member.gender }" readonly="readonly"> <label
									for="nickname">나이</label> <input type="text"
									class="form-control" id="age" name="age" value="${member.age }"
									readonly="readonly">
							</div>

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
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>

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