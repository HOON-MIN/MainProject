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

.searchForm .searchBtn {
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
	box-shadow: 0px 0px 8px #ababab;
}

.htable td {
	padding: 14px 12px;
	font-size: 14px;
}

.htable td>a {
	color: #232323;
	font-weight: bold;
}

.qacard {
	border: solid 1px #3478f5;
}

.card-header {
	border: 0;
}
</style>


<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 -->
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">${sessionNAME}님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="qcateAllbtn nav-link active text-white" aria-current="page"
						href="#">모든 질문</a></li>
					<c:forEach var="e" items="${qcate }" varStatus="status">

						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.qcate }"<%--name="hbtn${status.index}" --%>
							><a
							class="qcatebtn nav-link text-white" href="#">${e.qcate }</a></li>
						<%-- 						<input type="button" name="hbtn${status.index}" --%>
						<%-- 							value="${e.hcate }" class="hcatebtn btn btn-outline-primary" /> --%>
					</c:forEach>

				</ul>
			</div>
		</div>

		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<!-- 		<form class="sForm m-3" name="sForm" method="get"
					action="hospitalList" style="width: 400px;">
										###
					<input type="hidden" name="category" id="category" value="all">
					<input type="hidden" name="searchreset" value="1" hidden="hidden">
					<div class="input-group searchForm mb-3">
						<input type="text" class="form-control" id="hsearch"
							aria-label="Recipient's username" name="search"
							aria-describedby="hospitalSearch">
						<button type="submit" class="btn searchBtn" name="searBtn"
							id="searBtn">
							<img alt="검색아이콘" src="/img/search.png">
						</button>
					</div>
				</form> -->
				<h2 class="hanna p-5" style="text-align: center;">Dr.건강</h2>
				<div class="d-flex justify-content-around">
					<div class="input-group searchForm w-50" style="margin: auto;">
						<p class="btn btn-outline-secondary " aria-expanded="false"
							style="border: solid 1px #3478f5; background: #3478f5; color: white; width: 100px;">
							카테고리</p>
						<p class="form-control col-lg-5">${vo.qcate }</p>
					</div>

				</div>

				<!-- Modal - 질문 작성 폼 모달로 띄움 시작 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form method="post" action="qbInsert">
							<input type="hidden" name="id" id="id" value="${sessionID }">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">질문 작성</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<div class="modal-body">
									<div style="display: inline-block; margin-bottom: 10px;">
										<select name="qcate" id="qcate" class="form-select"
											aria-label="Default select example">
											<option selected>질문 카테고리</option>
											<option value="질병증상">질병증상</option>
											<option value="진료과">진료과</option>
											<option value="복약">복약</option>
										</select>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">제목</label>
										<input type="text" class="form-control" name="qtitle"
											id="qtitle" id="exampleFormControlInput1">
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">질문내용</label>
										<textarea class="form-control" name="qcont"
											id="exampleFormControlTextarea1" rows="3"></textarea>
									</div>

								</div>
								<div class="modal-footer">
									<button type="submit" id="insBtn" class="btn btn-primary">글쓰기</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- Modal - 질문 작성 폼 모달로 띄움 끝 -->

				<!-- 현재 질문에 대해 달린 답변 리스트 출력 시작 -->
				<form method="post" name="qbUpdate" id="qbUpdate">
					<input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
					<input type="hidden" name="id" id="id" value="${vo.id }"> <input
						type="hidden" name="qhit" id="qhit" value="${vo.qhit }"> <input
						type="hidden" name="qdate" id="qdate" value="${vo.qdate }">

					<div class="card qacard mb-3" style="width: 80%; margin: auto;">
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">Q</span>
							${vo.qtitle }
						</h5>
						<div class="card-body col-10 ">
							<p class="card-text">${vo.qcont }</p>
							<p>${vo.qdate}</p>
						</div>
						<div style="text-align: right">
							<c:choose>
								<c:when test="${sessionID == vo.id }">
									<!-- 로그인 - 일반회원인데 본인글 일 때 => id와 일치하면  -->
									<!-- 수정폼으로 가기 -->
									<input type="button" id="upFormBtn" value="수정"
										class="btn btn-primary">
									<input type="button" id="delBtn" value="삭제"
										class="btn btn-primary">
								</c:when>
							</c:choose>
						</div>
					</div>
				</form>

				<%-- for start ---------------------- --%>
				<div class="card qacard mb-3" style="width: 80%; margin: auto;">
				<c:forEach var="e" items="${ansList}">
					<h5 class="card-header">
						<span class="hanna" style="color: #3478f5; font-size: 32px;">A</span>
						
<!-- 						답변 제목 -->
					</h5>
					<div class="card-body row">
						<div class="col-10">
							<h5 class="card-title">Dr. ${e.dnum}</h5>
							<p class="card-text">
<!-- 								답변내용 <br>  -->
								 ${e.acont}
							</p>
							<p>${e.adate}</p>
						</div>

						<div class="col-2">
							<img src="/taejin/img/doc3.svg">
						</div>

					</div>
				</c:forEach>
				</div>
				<%-- for end ---------------------- --%>
			
			<!-- 현재 질문에 대해 달린 답변 리스트 출력 끝 -->

			<!--  로그인 - 의사일 때 답변 달 수 있는 기능 시작  -->
			<!-- 			<h5 class="hanna p-5" style="">Dr.건강</h5> -->
			<c:choose>
				<c:when test="${sessionScope.sessionDID != null }">
					<div class="card qacard" style="width: 80%; margin: auto;">
						<!-- 						<h5 class="card-header"> -->
						<!-- 							<span class="hanna" style="color: #3478f5; font-size: 32px;">Q</span> -->
						<!-- 							질문 제목 -->
						<!-- 						</h5> -->
						<!-- 						<div class="card-body col-10 "> -->
						<!-- 							<p class="card-text">With supporting text below as a natural -->
						<!-- 								lead-in to additional content.</p> -->

						<!-- 						</div> -->
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">A</span>
							답변하기
						</h5>
						<div class="card-body row">
							<div class="col-10">
								<!-- 								<label class="text-muted">아직 답변이 되지 않았습니다</label> -->
								<textarea class="form-control formInput2"
									id="exampleFormControlTextarea1" rows="3"></textarea>
							</div>

							<div class="col-2 d-flex flex-column justify-content-center"
								style="text-align: center;">
								<button class="btn bg-primary m-3 text-white hanna"
									style="width: 80px;">답변하기</button>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
			<!--  로그인 - 의사일 때 답변 달 수 있는 기능 끝  -->
			</div>
		</div>
	</div>
</div>




<!-- 미르 -->
<!-- <div id="content" class="container mt-5"> -->
<!-- 	<h2 class="text-center">의학지식 질문하기</h2> -->
<!-- 	<div class="row" style="text-align: center"> -->
<!-- 		<form method="post" name="qbUpdate" id="qbUpdate"> -->
<%-- 			<input type="hidden" name="qnum" id="qnum" value="${vo.qnum }"> --%>
<%-- 			<input type="hidden" name="id" id="id" value="${vo.id }"> <input --%>
<%-- 				type="hidden" name="qhit" id="qhit" value="${vo.qhit }"> <input --%>
<%-- 				type="hidden" name="qdate" id="qdate" value="${vo.qdate }"> --%>
<!-- 			<fieldset> -->
<!-- 				<div style="width: 611px; margin: 0 auto;"> -->
<!-- 					<div style="display: inline-block; width: 29%"> -->
<%-- 						<input type="text" value="${vo.qcate }" name="qcate" id="qcate" readonly="readonly"> --%>
<!-- 					</div> -->
<!-- 					<div style="display: inline-block; width: 70%"> -->
<%-- 						<input type="text" value="${vo.qtitle }" name="qtitle" id="qtitle" width="100%;" readonly="readonly"> --%>
<!-- 					</div> -->
<!-- 					<div> -->
<%-- 						<textarea name="qcont" id="summernote" cols="80" rows="20" readonly="readonly">${vo.qcont }</textarea> --%>
<!-- 					</div> -->
<!-- 					<div style="text-align: right"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${sessionScope.sessionID == vo.id }"> --%>
<!-- 								로그인 - 일반회원인데 본인글 일 때 => id와 일치하면  -->
<!-- 								수정폼으로 가기 -->
<!-- 								<input type="button" id="upFormBtn" value="수정" class="btn btn-primary" > -->
<!-- 								<input type="button" id="delBtn" value="삭제" class="btn btn-primary" > -->
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</fieldset> -->
<!-- 		</form> -->

<!-- 		<!--  로그인 - 의사일 때  -->

<%-- 		<c:choose> --%>
<%-- 			<c:when test="${sessionScope.sessionDid != null }"> --%>
<!-- 				<div> -->
<!-- 					<form action="post" name="abInsert" id="abInsert"> -->
<%-- 						<input type="hidden" name="qnum" id="qnum" value="${vo.qnum }"> --%>
<!-- 						<p> -->
<!-- 							<textarea name="acont" id="acont" cols="80" rows="20"></textarea> -->
<!-- 						</p> -->
<!-- 						<p style="text-align: right"> -->
<!-- 							<button class="btn btn-primary btn-dark text-white btn-block" -->
<!-- 								type="submit">답변하기</button> -->
<!-- 						</p> -->
<!-- 					</form> -->
<!-- 				</div> -->
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>

<!-- 		<!-- 현재 질문에 대해 달린 답변 리스트 출력 -->

<!-- 		<ul class="list-unstyled"> -->
<!-- 			<li class="border-top my-3"></li> -->
<!-- 		</ul> -->
<!-- 		<div> -->
<!-- 			<h3>답변</h3> -->
<!-- 			<table class="table table-bordered" id="datatablesSimple" -->
<!-- 				style="text-align: center;"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>번호</th> -->
<!-- 						<th>답변의사ID</th> -->
<!-- 						<th>내용</th> -->
<!-- 						<th>작성날짜</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					for start --%>
<%-- 					<c:forEach var="e" items="${ansList}"> --%>
<!-- 						<tr> -->
<%-- 							<td class="linktd">${e.anum}</td> --%>
<%-- 							<td class="linktd">${e.dnum}</td> --%>
<%-- 							<td class="linktd">${e.acont}</td> --%>
<%-- 							<td class="linktd">${e.adate}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<%-- 					for end --%>
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->

<!-- 	</div> -->
<!-- </div> -->

<script>

$(function() {
	$('#writeBtn').on("click", function(){
		if('${sessionID}' != null){
			alert("로그인 후 이용해주세요.");
			event.preventDefault();
		}
	});
	$('#insBtn').on("click", function(){
		alert("작성되었습니다.");
	});
	
	$('#upFormBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbUpdateForm?num="+${vo.qnum });
			$('#qbUpdate').submit();
		});

	$('#delBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbDelete");
			$('#qbUpdate').submit(function() {
				alert("삭제되었습니다.");
			});
		});

});
</script>