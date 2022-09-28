<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<h3 class="hanna p-4" style="text-align: center;">등록한 병원</h3>
<%-- 리팩토링 해야 함 --%>
<table class="htable table table-hover table-borderless">
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
			<tr>
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
</table>
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
						href="adminHospRegistList?aPage=${startPage-1}">Previous</a></li>
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
							style="background: #3478F5; color: white;""">${i.index }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="adminHospRegistList?aPage=${i.index}">${i.index}</a></li>
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
						href="adminHospRegistList?aPage=${endPage+1 }">Next</a></li>
				</c:when>
				<c:otherwise>
					<li>
					<li class="page-item"><a class="page-link"
						href="adminHospRegistList?aPage=${endPage+1 }">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>










