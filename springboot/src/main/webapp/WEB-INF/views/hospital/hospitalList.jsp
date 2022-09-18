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
	#datatablesSimple a{
		text-decoration: none;
		color:black;
	}

</style>

<div class="container">
<article>
	<header>
		<h1>Hospital List</h1>
	</header><br>
	
<!-- 	<ul class="list-unstyled"> -->
<!-- 		<li class="border-top my-3"></li> -->
<!-- 	</ul> -->

<%-- 리팩토링 해야 함 --%>
<table class="table1 table table-hover" id="datatablesSimple" style="text-align: center;">
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
				<td class="linktd">${e.r_num }</td>
				<td class="linktd"><a href="hospitalDetail?num=${e.cnum }"> ${e.hname }</a></td>
				<td class="linktd">${e.hloc }</td>
				<td class="linktd">${e.otime }~${e.ctime }</td>
				<td class="linktd">${e.hcate }</td>
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









