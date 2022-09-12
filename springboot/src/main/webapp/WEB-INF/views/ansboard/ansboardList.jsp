<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
/* 	table th { */
/* 		text-align: center; */
/* 	} */
</style>

<div class="container">
<article>
<header>
	<h1>의학지식인</h1>
</header>
<ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>

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
					<td class="linktd"><a href="qbDetail?num=${e.qnum}">${e.qtitle}</a></td>
					<td class="linktd">${e.id}</td>
					<td class="linktd">${e.qhit}</td>
					<td class="linktd">${e.qdate}</td>
				</tr>
			</c:forEach>
			<%-- for end --%>
		</tbody>
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
