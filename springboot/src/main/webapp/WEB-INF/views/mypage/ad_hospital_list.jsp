<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>



<div class="container">
	<article>
		<header>
			<h1>등록된 병원</h1>
		</header>
		<ul class="list-unstyled">
			<li class="border-top my-3"></li>
		</ul>

		<%-- 리팩토링 해야 함 --%>
		<table class="table1 table table-hover" style="text-align: center;">
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
				<c:forEach var="e" items="${list }">
					<tr>
						<td class="linktd">${e.r_num }<input type="hidden" value="${e.cnum }"> </td>
						<td class="linktd">${e.hname }</td>
						<td class="linktd">${e.hloc }</td>
						<td class="linktd">${e.otime }~${e.ctime }</td>
						<td class="linktd">${e.hcate }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</article>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>










