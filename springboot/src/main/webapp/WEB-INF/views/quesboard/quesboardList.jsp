<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>
<style>
	a:link {
		text-decoration: none;
	}
	table img {
		width: 80px;
	}
	#datatablesSimple a{
		text-decoration: none;
		color:black;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js?"></script>
<script src="/js/scripts.js?"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<link href="/css/styles.css?" rel="stylesheet"/>

<div class="container">
<article>
	<header>
		<h1>의학지식인</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<table class="table table-bordered" id="datatablesSimple" style="text-align: center;">
			<thead>
				<tr>
					<th>번호</th>
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
						<td class="linktd">${e.qnum}</td>
						<td class="linktd"><a href="qbDetail?qnum=${e.qnum}">${e.title}</a></td>
						<td class="linktd">${e.id}</td>
						<td class="linktd">${e.qhit}</td>
						<td class="linktd">${e.qdate}</td>
					</tr>
				</c:forEach>
				<%-- for end --%>
			</tbody>
<!-- 			<tfoot> -->
<!-- 				<tr> -->
<!-- 					<td colspan="8"> -->
<!-- 						<ol class="paging"> -->
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${startPage < 6}"> --%>
<!-- 										<li class="disabled">이전으로</li> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<li><a href="itemList?gender=${g}&cPage=${startPage-1}&category=${category}&search=${search}">이전으로</a></li> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 								<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" --%>
<%-- 									step="1"> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${i.index == nowPage}"> --%>
<%-- 											<li class="now">${i.index}</li> --%>
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<%-- 											<li><a href="itemList?gender=${g}&cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li> --%>
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
<%-- 								</c:forEach> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${endPage >= totalPage }"> --%>
<!-- 										<li class="disable">다음으로</li> -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${totalPage > (nowPage+pagePerBlock)}"> --%>
<!-- 										<li> -->
<%-- 										<li><a href="itemList?gender=${g}&cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<!-- 										<li> -->
<%-- 										<li><a href="itemList?gender=${g}&cPage=${totalPage}&category=${category}&search=${search}">다음으로</a></li> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 						</ol> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th colspan="5"> -->
<!-- 						<form class="d-flex"> -->
<!-- 							<input class="form-control me-2" type="text" -->
<!-- 								placeholder="Search.." style="width: 300px"> -->
<!-- 							<button class="btn btn-outline-secondary" type="button">Search</button> -->
<!-- 						</form> -->
<!-- 					</th> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="5" style="text-align: right;"> -->
<!-- 						<button type="button" class="btn btn-outline-secondary" id="wbtn">글작성</button> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				.. -->
<!-- 				<tr> -->
<!-- 					<th colspan="5"> -->
<!-- 						<form class="d-flex" action="itemList"> -->
<!-- 						<input type="hidden" name="searchreset" value="1"> -->
<%-- 						<input type="hidden" name="gender" value="${g}"> --%>
<!-- 						<select class="btn btn-outline-secondary" name="category" -->
<!-- 								id="category"> -->
<!-- 								<option value="">--선택--</option> -->
<!-- 								<option value="상의">상의</option> -->
<!-- 								<option value="하의">하의</option> -->
<!-- 								<option value="잡화">잡화</option> -->
<!-- 							</select> -->
<!-- 							<input class="" type="text" -->
<!-- 								placeholder="Search.." style="width: 300px" name="search"> -->
<!-- 							<button class="btn btn-outline-secondary" type="submit">Search</button> -->
<!-- 						</form> -->
<!-- 					</th> -->
<!-- 				</tr> -->
<!-- 			</tfoot> -->
		</table>
	</div>
</article>
</div>

