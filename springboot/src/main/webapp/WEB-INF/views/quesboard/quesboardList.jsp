<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a:link {
	text-decoration: none;
}

#datatablesSimple a {
	text-decoration: none;
	color: black;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}


.hcategory {
	background-color: #3478f5;
	padding-top: 40px;
}

.hboard {
	background-color: #efefef;
	border-radius: 8px;
}

a {
	text-decoration: none;
	color: white;
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

					<li class=" nav-item ms-3 pt-5 pb-2 ps-4 mb-4"
						style="color: white;"><strong>질문 카테고리</strong></li>
					<!-- 이안에 본인 카테고리 나눠주세요 -->
					<c:forEach var="e" items="${qcate }" varStatus="status">

						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.qcate }"><a
							class="qcatebtn nav-link text-white" href="#">${e.qcate }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 카테고리 리스트 끝 -->
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
				<header>
					<h3 class="hanna p-4" style="text-align: center;">의학 지식인</h3>
				</header>
				<form class="sForm" name="sForm" method="get" action="doctorList"
					style="display: flex; justify-content: center;">

					<input type="hidden" name="searchreset" value="1" hidden="hidden">
					<div class="input-group searchForm mt-3 mb-3 w-50">
						<select class="form-select form-select-sm " name="category"
							id="category" aria-label=".form-select-sm example"
							style="border: solid 1px #3478f5; width: 64px;">
							<option value="all" selected>카테고리</option>
							<option value="dmajor">진료과</option>
							<option value="dname">의사명</option>
							<option value="hname">병원명</option>
						</select> <input type="text" class="form-control" style="width: 180px;"
							name="search" id="dsearch">
						<button type="submit" class="btn searchBtn">
							<img alt="검색아이콘" src="/img/search.png">
						</button>
					</div>
				</form>
				<table class="table1 htable table-hover">
					<thead class="hanna">
						<tr>
							<th width="50px;">No.</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>ID</th>
							<th>조회수</th>
							<th>작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<%-- for start --%>
						<c:forEach var="e" items="${list}">
							<tr>
								<td class="linktd">${e.r_num}</td>
								<td class="linktd">${e.qcate}</td>
								<td class="linktd">${e.qtitle}</td>
								<td class="linktd">${e.id}</td>
								<td class="linktd">${e.qhit}</td>
								<td class="linktd">${e.qdate}</td>
								<td class="linktd" hidden="hidden"><a
									href="qbDetail?qnum=${e.qnum}"></a></td>
								<!-- link를 걸면 조회수 업데이트 되는 실행이 두 번 작용해서 hidden으로 숨김  -->
							</tr>
						</c:forEach>
						<%-- for end --%>
					</tbody>
				</table>

				<%-- 	<ol class="paging">
									<c:choose>
										<c:when test="${startPage < 6 }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="qbList?cPage=${startPage-1}&category=${category}&search=${search}">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
										step="1">
										<c:choose>
											<c:when test="${i.index == nowPage}">
												<li class="now">${i.index }</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="qbList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endPage >= totalPage}">
											<li class="disable">다음으로</li>
										</c:when>
										<c:when test="${totalPage > (nowPage+pagePerBlock)}">
											<li>
											<li><a
												href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
										</c:when>
										<c:otherwise>
											<li>
											<li><a
												href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ol> --%>

				<%-- <form class="sForm" name="sForm" method="get" action="qbList">
									<input type="hidden" name="searchreset" value="1"> <select
										name="category" id="category">
										<option value="qtitle">제목</option>
										<option value="qcont">내용</option>
										<option value="id">작성자</option>
										<option value="qcate" hidden="hidden" id="qcate">카테고리</option>
										<option value="all">제목+내용+작성자</option>
									</select> <input type="text" name="search" id="qsearch"> <input
										type="submit" id="searBtn" value="조회">
								</form>
								<p style="margin: 5px;"></p> <c:if test="${sessionID != null}">
									<input type="button" value="질문하기" id="writeBtn"
										class="btn btn-primary">
								</c:if> --%>


			</div>
		</div>
		<!-- 컨텐츠 영역 끝 -->
	</div>
</div>

<!-- 페이지 네이션 -->
<ul class="pagination justify-content-center p-3">
	<c:choose>
		<c:when test="${startPage < 6 }">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
			<!-- 	<li class="disable">이전으로</li> -->
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link"
				href="qbList?cPage=${startPage-1}&category=${category}&search=${search}">Previous</a></li>
		</c:otherwise>
	</c:choose>
	<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
	<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
	<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

	<c:forEach varStatus="i" begin="${startPage}" end="${endPage}" step="1">
		<c:choose>
			<c:when test="${i.index == nowPage}">
				<li class="page-item now"><a class="page-link"
					style="background: #3478F5; color: white;""">${i.index }</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="qbList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:choose>
		<c:when test="${endPage >= totalPage}">
			<li class="page-item disabled"><a class="page-link"
				aria-disabled="true">Next</a></li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li>
			<li class="page-item"><a class="page-link"
				href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
		</c:when>
		<c:otherwise>
			<li>
			<li class="page-item"><a class="page-link"
				href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
		</c:otherwise>
	</c:choose>
</ul>





<!-- 이전 jquery 임포트 코드 ...!!!  .linktd function 이 작동하기 위해서 있어야 됨   -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var chk;
	$(function() {
		$('.linktd').click(
				function() {
					var href = $(this).parent("tr").children("td")
							.children("a").attr("href")
					//       alert(href);
					window.location = href;
				});

		$('#writeBtn').click(function() {
			location = "qbForm";
		});

		$('.qcatebtn').click(function() {
			var qcatename = $(this).val();
			$("#qcate").attr("selected", "selected");
			$("#qsearch").val(qcatename);
			$(".sForm").submit();
		});

		//    $('.table1').on('click','tr',function(){
		//       chk=(this).children('#check').text();
		//       chk1 = window.location.pathname;
		//       console.log('chk => ' + chk);
		//       console.log('path => ' + chk1);
		//       console.log('chk => ' + chk);
		//       $.ajax({
		//          url:'test?chk1='+chk1,
		//          success : function(){
		//          }
		//       })
		//    })

	});
</script>