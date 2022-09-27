<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<style>
/* paging */
table tfoot ol.paging {
	margin-left: 40%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
	background-color: #33CCFF;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #ffffff;
	color: #ffffff;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

table tfoot ol li.now {
	padding: 3px 7px;
	background-color: #ffff00;
	color: white;
	font-weight: bold;
}
</style>

<%-- 리팩토링 해야 함 --%>
<table class="htable table table-hover table-borderless"
	style="text-align: center;">
	<thead>
		<tr class="hanna">
			<th>번호</th>
			<th>병원명</th>
			<th>위치</th>
			<th>영업시간</th>
			<th>진료과목</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="e" items="${list }">
			<tr class="hanna">
				<td class="linktd">${e.r_num }<input type="hidden"
					value="${e.cnum }">
				</td>
				<td class="linktd">${e.hname }</td>
				<td class="linktd">${e.hloc }</td>
				<td class="linktd">${e.otime }~${e.ctime }</td>
				<td class="linktd">${e.hcate }</td>
			</tr>
		</c:forEach>

	</tbody>
	<tfoot>
		<tr class="text-center ">
			<td colspan="6">
				<ol class="paging">
					<c:choose>
						<c:when test="${startPage < 6  }">
							<li class="disable">이전으로</li>
						</c:when>
						<c:otherwise>
							<li><a href="adminHospRegistList?aPage=${startPage -1 }">이전으로</a></li>
						</c:otherwise>
					</c:choose>
					<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
					<c:forEach varStatus="i" begin="${startPage}" end="${endPage }"
						step="1">
						<c:choose>
							<c:when test="${i.index == nowPage }">
								<li class="now">${i.index }</li>
							</c:when>
							<c:otherwise>
								<li><a href="adminHospRegistList?aPage=${i.index }">${i.index }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPage >= totalPage }">
							<li class="disable">다음으로</li>
						</c:when>
						<c:otherwise>
							<li><a href="adminHospRegistList?aPage=${endPage + 1 }">다음으로</a></li>
						</c:otherwise>
					</c:choose>
	</tfoot>
</table>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>










