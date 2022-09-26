<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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

.formTitle {
	margin-top: 40px;
	text-align: right;
}

.formInput {
	margin-top: 34px;
	margin-right : 40px;
}

.formInput2 {
	margin-top: 40px;
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
						href="#">전체 리뷰</a></li>
					<li class=" nav-item pt-2 pb-2 ps-4" value="" name=""><a
						class="hcatebtn nav-link text-white" href="#">좋아요 순 등등</a></li>
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
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 ">
				<div class="row justify-content-center">
					<h3 class="hanna text-center m-5">후기 작성</h3>
					<div class="col-2"">
						<ul class="nav flex-column">
							<li class=" nav-item hanna formTitle"><h5>제목</h5></li>
							<li class=" nav-item hanna formTitle"><h5>병원명</h5></li>
							<li class=" nav-item hanna formTitle"><h5>의사선생님</h5></li>
							<li class=" nav-item hanna formTitle"><h5>ID</h5></li>
							<li class=" nav-item hanna formTitle"><h5>후기점수</h5></li>
							<li class=" nav-item hanna formTitle"><h5>후기내용</h5></li>
						</ul>
					</div>
					<div class="col-9">
						<form method="post" action="uploadpro" id="upform">
							<input type="text" name="title" id="title"
								class="form-control formInput " placeholder="제목을 입력하세요." /> <input
								type="text" name="hname" id="hname"
								class="form-control formInput" placeholder="병원명 입력하세요." /> <input
								type="text" name="dname" id="dname"
								class="form-control formInput" placeholder="의사선생님 이름을 입력하세요." /> 
								<input type="text" name="id" id="id" value="${sessionID}"
								class="form-control formInput " readonly="readonly" />
							<p></p>
							<p> </p>
							<p> </p>
							<p> </p>
							<br>
							<div>
							<input type="number" name="likes" id="likes" min="1" max="10" step="1" value="5">
							</div>
							<div class="mb-3">
								<textarea class="form-control formInput2"
									name="cont" id="cont" rows="3"></textarea>
							</div>
							<input type="hidden" name="id" id="id" value="${sessionID}"
								readonly="readonly" />
							<div class="d-flex justify-content-end">
								<button type="submit" class="btn bg-primary text-white me-3" id="upformBtn">작성</button>
								<button type="button" class="btn bg-dark text-white me-3"
								onclick="location='reviewboardlist'">뒤로가기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%-- <form method="post" action="uploadpro" id="upform">
					<div class="mb-3">
						<label for="btitle" style="font-size: 20px;">후기 제목</label> <input
							type="text" name="title" id="title" placeholder="제목을 입력하세요."
							style="width: 700px;" />
					</div>

					<div class=" mb-3">
						<label class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" name="id" id="id" value="${sessionID}"
								readonly="readonly" />
						</div>
					</div>

					<div class=" mb-3">
						<label class="col-sm-2 col-form-label">병원명</label>
						<div class="col-sm-10">
							<input type="text" name="hname" id="hname"
								placeholder="병원명 입력하세요." />
						</div>
					</div>

					<div class=" mb-3">
						<label class="col-sm-2 col-form-label">의사선생님</label>
						<div class="col-sm-10">
							<input type="text" name="dname" id="dname"
								placeholder="의사선생님 이름을 입력하세요." />
						</div>
					</div>
					<p>
						<label>후기 평점(1~10점) </label> <input type="number" name="likes"
							id="likes" min="1" max="10" step="1" value="5">
					</p>

					<div class=" mb-3">
						<label class="col-sm-2 col-form-label">후기 내용</label>
						<textarea name="cont" id="cont" rows="10" cols="13"></textarea>
					</div>

					<div class=" mb-3 ">
						<div class="col-sm-10">
							<input type="submit" value="등록" id="btn1" class="btn btn-info" />
							<input type="button" value="이전으로" id="btn2" class="btn btn-info"
								onclick="location='reviewboardlist'" />
						</div>
					</div>
				</form> --%>
</div>
</div>
</div>
</div>











































<%-- 
<article>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>

	<div class="container" class="container mt-5">
		<h2 class="text-center" style="padding-bottom: 30px; font-size: 40px;">
			사용자 후기 작성</h2>
		boardForm 들어 갈 자리

		<div class="row" style="width: 900px; margin: 0 auto;">




			<!-- 액션은 컨트롤러로 보내는 역할이다 @PostMapping(value ="/upload")와 동일해야 한다 -->

		</div>
</article> --%>
<script>
	
</script>
