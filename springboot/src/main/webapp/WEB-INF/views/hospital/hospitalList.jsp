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

<div class="container-fluid" style="height: 100%;">
	<div class="row justify-content-around" style="height: 100%;">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 -->
			<div class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<c:choose>
				<c:when test="${sessionNUM != null }">
				<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">${sessionNAME } 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
				</c:when>
				<c:when test="${sessionNUM == null }">
				<img src="/taejin/img/doc3.svg" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 
				<a href="${pageContext.request.contextPath }/member/memberLoginForm">로그인</a> ・ <a href="${pageContext.request.contextPath }/member/joinForm">회원가입</a>
				</span>
				</c:when>
				</c:choose>
			</div>
			
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4" >
					<a 
						class="hcateAllbtn nav-link active text-white" 
						aria-current="page" 
						href="#">모든 진료과</a></li>
					<c:forEach var="e" items="${hcate }" varStatus="status">
						
						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.hcate }" 
<%-- 							name="hbtn${status.index}" --%>
							>
						<a 
							class="hcatebtn nav-link text-white" href="#">${e.hcate }</a></li>
<%-- 						<input type="button" name="hbtn${status.index}" --%>
<%-- 							value="${e.hcate }" class="hcatebtn btn btn-outline-primary" /> --%>
					</c:forEach>

				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->
		<div class="col-10">
		
			<div class="hboard pt-2 ps-3 pe-3">
<div style="height: 80%;">
					<h3 class="hanna p-4" style="text-align: center;">병원 목록</h3>
					<div>
				<form class="sForm" name="sForm" method="get" action="hospitalList"
					style="width: 400px;">
					<!-- 					### -->
					<input type="hidden" name="category" id="category" value="all">
					<input type="hidden" name="searchreset" value="1" hidden="hidden"> 
<!-- 					<select name="category" id="category"> -->
<!-- 						<option value="hloc" hidden="hidden">병원위치</option> -->
<!-- 						<option value="hname" hidden="hidden">병원명</option> -->
<!-- 						<option value="hcate" hidden="hidden" id="hcate">진료과목</option> -->
<!-- 						<option value="all" selected="selected" hidden="hidden">병원위치+병원명</option> -->
<!-- 					</select> -->
					<div class="input-group searchForm mb-3">
						<input type="text" class="form-control" id="hsearch"
							aria-label="Recipient's username" name="search"
							aria-describedby="hospitalSearch">
						<button type="submit" class="btn" name="searBtn" id="searBtn">
							<img alt="검색아이콘" src="/img/search.png">
						</button>
					</div>
					<!-- 					### -->
<!-- 					<input type="hidden" name="searchreset" value="1"> <select -->
<!-- 						name="category" id="category"> -->
<!-- 						<option value="hloc">병원위치</option> -->
<!-- 						<option value="hname">병원명</option> -->
<!-- 						<option value="hcate" hidden="hidden" id="hcate">진료과목</option> -->
<!-- 						<option value="all">병원위치+병원명</option> -->
<!-- 					</select> <input type="text" name="search" id="hsearch"> <input -->
<!-- 						type="submit" id="searBtn" value="조회"> -->
				</form>

				
						<table class="htable" style="cursor: pointer;">
							<thead>
								<tr>
									<th class="hanna">병원명</th>
									<th class="hanna">위치</th>
									<th class="hanna">영업시간</th>
									<th class="hanna">진료과목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="e" items="${list }">
									<tr>
										<td class="linktd">${e.hname }</td>
										<td class="linktd">${e.hloc }</td>
										<td class="linktd">${e.otime }~${e.ctime }</td>
										<td class="linktd">${e.hcate }</td>
										<td class="linktd" hidden="hidden"><a
											href="hospitalDetail?num=${e.cnum }"></a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<ul class="pagination justify-content-center mt-3">
							<c:choose>
								<c:when test="${startPage < 6 }">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									<!-- 	<li class="disable">이전으로</li> -->
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="hospitalList?cPage=${startPage-1}&category=${category}&search=${search}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
							<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
							<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

							<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
								step="1">
								<c:choose>
									<c:when test="${i.index == nowPage}">
										<li class="page-item now"><a class="page-link"
											style="background: #3478F5; color: white;">${i.index }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="hospitalList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
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
										href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
								</c:when>
								<c:otherwise>
									<li>
									<li class="page-item"><a class="page-link"
										href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
								</c:otherwise>
							</c:choose>

							<!-- 							<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 이전 jquery 임포트 코드 ...!!! -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#searBtn').click(function(){
			console.log( $('#hsearch').val())
		})
		$('.linktd').click(function() {
			var href = $(this).parent("tr").children("td")
					.children("a").attr("href")
			// 		alert(href);
			window.location = href;
		});
	});
</script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$('.hcateAllbtn').click(function() {
		location.href='${pageContext.request.contextPath}/hospital/hospitalList'
	});
	$('.hcatebtn').click(function() {
		var hcatename = $(this).text();
		console.log(hcatename)
// 		if( $(this).val() == 'all'){
		if( hcatename == '모든 진료과'){
			location.href='${pageContext.request.contextPath}/hospital/hospitalList'
		}
		console.log('hcatename => ', hcatename)
// 		$("#hcate").attr("selected", "selected");
		$("#hsearch").val(hcatename);
		$(".sForm").submit();
	});
	</script>