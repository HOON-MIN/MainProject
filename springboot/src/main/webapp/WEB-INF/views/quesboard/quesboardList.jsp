<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}

#datatablesSimple a {
	text-decoration: none;
	color: black;
}

table tbody tr {
	cursor: pointer;
}

table tfoot ol.paging {
	margin-left: 30%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>

<div class="container">
<article>
<header>
	<h1>의학지식인</h1>
</header>
<ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>

<table class="table table-bordered" id="" style="text-align: center;">
	<thead>
		<tr>
			<th width="50px;">No.</th>
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
				<td class="linktd"><a href="qbDetail?num=${e.qnum}">${e.qtitle}</a></td>
				<td class="linktd">${e.id}</td>
				<td class="linktd">${e.qhit}</td>
				<td class="linktd">${e.qdate}</td>
			</tr>
		</c:forEach>
		<%-- for end --%>
	</tbody>
<tfoot>
<tr>
<td colspan="5">
<ol class="paging">
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
</ol>
</td>
</tr>
<tr>
<td colspan="5">
<form class="sForm" name="sForm" method="get" action="qbList">
<input type="hidden" name="searchreset" value="1">
	<select name="category" id="category">
		<option value="qtitle">제목</option>
		<option value="qcont">내용</option>
		<option value="id">작성자</option>
<!-- 		<option value="hcate" hidden="hidden" id="hcate">진료과목</option> -->
		<option value="all">제목+내용+작성자</option>
	</select> 
	<input type="text" name="search" id="hsearch">
    <input type="submit" id="searBtn" value="조회">
</form>
<c:if test="${sessionID != null}">
<input type="button" value="글작성" class="btn btn-info" id="writeBtn" />
</c:if>

</td>
</tr>

</tfoot>
</table>

</article>
</div>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(function(){
	$('.linktd').click(function(){
		var href = $(this).parent("tr").children("td").children("a").attr("href")
// 		alert(href);
		window.location = href;
	});
});
</script>
