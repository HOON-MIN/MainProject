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
	<div class="row justify-content-around" >
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
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link active text-white" aria-current="page"
						href="#">모든 약국</a></li>
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

			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<form method="get" class="sForm" name="Frm" action="ShopListPage" accept-charset="utf-8"
				style="display: flex; justify-content: center;">
				<div class="input-group searchForm mt-3 mb-3 w-50">
					<select class="form-select form-select-sm" name="type" aria-label=".form-select-sm example"
					style="border: solid 1px #3478f5; width: 64px;">
							<option selected="${type}" value="sname">검색 내용</option>
							<option value="pname">상호명</option>
							<option value="ploc">지역명</option>
							<option value="pnum">관리번호</option>
						</select> 
						<input type="text" class="form-control" style="width: 180px;"
						name="searchf" id="searchf">
					<button type="submit" class="btn searchBtn">
						<img alt="검색아이콘" src="/img/search.png">
					</button>
				</div>
			</form>

				<div>
					<h3 class="hanna p-3">약국 리스트</h3>

					<table class="htable mb-3" style="cursor: pointer;">
						<thead>
							<tr>
								<th class="hanna ps-3"></th>
								<th class="hanna ps-3">약국명</th>
								<th class="hanna ps-3">전화번호</th>
								<th class="hanna ps-3">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="e" items="${list }">
								<tr>
									<td>${e.pnum }</td>
									<td class="nanum"><a
										href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}">
											${e.pname } </a></td>

									<td>${e.ptel }</td>
									<td>${e.ploc }</td>
								</tr>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<ul class="pagination justify-content-center mt-5 mb-5">
						<c:choose>
							<c:when test="${startPage < 6 }">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
								<!-- 	<li class="disable">이전으로</li> -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage-pagePerBlock}&type=${type }&searchf=${searchf}">Previous</a></li>
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
										href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${i.index}&type=${type }&searchf=${searchf}">${i.index}</a></li>
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
									href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage+pagePerBlock }&type=${type }&searchf=${searchf}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${totalPage }&type=${type }&searchf=${searchf}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- 
<div class="grid">
	<div class="position-absolute top-50 start-50 translate-middle">	
		<div class="grid">
			
		</div>
<table class="table table-bordered " id="datatable">
<thead>
   <tr>
 		<th>가게 번호</th>
		<th>가게명</th>
		<th>영업상태</th>
		<th>주소</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="e" items="${list }">
			<tr>
				<td  class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.pnum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.pname }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.ptel }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.ploc }</a></td>
			</tr>
		</c:forEach>
</tbody>
<tfoot>
<tr>
<td colspan="4"  >${startPage}/${endPage }
<ol class="pagination justify-content-center" >
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="page-item disabled"><a class="page-link">이전</a></li>
		</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage-pagePerBlock}&type=${type }&searchf=${searchf}">이전</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >

		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="page-item disabled"><a class="page-link">${i.index}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${i.index}&type=${type }&searchf=${searchf}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="page-item disabled"><a class="page-link">다음</a></li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li class="page-item"><a class="page-link"  href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage+pagePerBlock }&type=${type }&searchf=${searchf}">다음</a></li>
		</c:when>
		<c:otherwise>
     		<li class="page-item"><a class="page-link"  href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${totalPage }&type=${type }&searchf=${searchf}">다음</a></li>
		</c:otherwise>
 	</c:choose>
</ol>

</td>

</tr>
	<tr>
		<td colspan="4">
				<ol class="pagination justify-content-center">
				<form method="get" action="ShopListPage" accept-charset="utf-8">
						
						<select class="form-select" name="type" style="color: black;">
							<option selected="${type}" value="sname">검색 내용</option>
							<option value="pname">상호명</option>
							<option value="ploc">지역명</option>
							<option value="pnum">관리번호</option>
						</select> 
			
				<input class="form-control me-2" type="text" id="searchf" name="searchf" style="color:#000;">
			<input type="submit" class="btn btn-outline-primary w-100 p-2" value="검색">
		</form>
			</ol>
		</td>	
	</tr>
</tfoot>
</table>
	</div>
</div>        
 --%>
<script>
	$(function() {
		$('#searchv').focusin(function() {
			$(this).val("검색어 입력")
		});
		$('#searchv').focusout(function() {
			$(this).val("")
		});
	});
</script>
