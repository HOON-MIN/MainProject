<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include 제거  -->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/taejin/datatables-simple-demo.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<link href="/resources/taejin/css/styles.css" rel="stylesheet"/>
<article>
	<header>
		<h1>Hospital List</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="card-body">
		<%-- 리팩토링 해야 함 --%>
		<table id="datatablesSimple">
			<thead>
				<tr>
					<th>번호</th>
					<th>병원명</th>
					<th>위치</th>
					<th>영업시간</th>
					<th>진료과목</th>
				</tr>
			</thead>

			<tbody>
				<%-- for start --%>
				<c:forEach var="e" items="${list }">
					<tr>
						<td>${e.hnum }</td>
						<td><a href="hospitalDetail?num=${e.hnum }"> ${e.hname }</a></td>
						<td>${e.hloc }</td>
						<td>${e.otime }~${e.ctime }</td>
						<td>${e.hcate }</td>
					</tr>
				</c:forEach>
				<%-- for end --%>
			</tbody>


<tfoot>
				<tr>
					<th colspan="5" style="text-align: center;">
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-sm"
								style="margin: auto; width: 60%">
								<c:choose>
									<c:when test="${startPage < 6}">
										<li class="page-item disabled">이전으로</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="hospitallist?cPage=${startPage -1}">이전으로</a></li>
									</c:otherwise>
								</c:choose>
								<!--        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li> -->
								<c:forEach varStatus="i" begin="${startPage}" end="${endPage }"
									step="1">
									<c:choose>
										<c:when test="${i.index == nowPage}">
											<li class="page-item">${i.index}</li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="hospitallist?cPage=${i.index}">${i.index}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<!--           <li class="page-item active" ><a class="page-link" href="#">1</a></li> -->
								<!--           <li class="page-item"><a class="page-link" href="#">2</a></li> -->
								<!--           <li class="page-item"><a class="page-link" href="#">3</a></li> -->
								<!--           <li class="page-item"><a class="page-link" href="#">4</a></li> -->
								<!--           <li class="page-item"><a class="page-link" href="#">5</a></li> -->
								<c:choose>
									<c:when test="${endPage >= totalPage }">
										<li class="page-item">다음으로</li>
									</c:when>
									<c:when test="${totalPage > (nowPage+pagePerBlock)}">
										<li>
										<li><a class="page-link"
											href="hospitallist?cPage=${endPage +1 }">다음으로</a></li>
									</c:when>
									<c:otherwise>
										<li>
										<li><a class="page-link" href="hospitallist?cPage=${totalPage}">다음으로</a></li>
									</c:otherwise>
								</c:choose>
								<!--           <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
							</ul>
						</nav>
					</th>
				</tr>
				<tr>
					<th colspan="5">
						<form class="d-flex">
							<input class="form-control me-2" type="text"
								placeholder="Search.." style="width: 300px">
							<button class="btn btn-outline-secondary" type="button">Search</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan="5" style="text-align: right;">
						<%-- jQuery를 사용해서 글작성 폼으로 이동시키기
              				- id 추가하기 : selector를 사용해서 핸들링
              				- footer.jsp 
      					 --%>
						<button type="button" class="btn btn-outline-secondary" id="wbtn">글작성</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</article>

