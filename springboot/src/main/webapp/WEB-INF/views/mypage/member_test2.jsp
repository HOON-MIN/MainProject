<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<section>
	<div class="row">
		<div style="height: 80%;">
			<h3 class="hanna p-4" style="text-align: center;">처방전 상세보기</h3>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="5" disabled>
       ${prvo.cont}
       </textarea>
		</div>
	</div>
	<div class="row">
		<table class="htable">
			<thead class="hanna">
				<tr>
					<th>목록</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>담당의사</td>
					<td>${prvo.dname }</td>
				</tr>
				<tr>
					<td>xray</td>
					<td><c:choose>
							<c:when test="${prvo.xray}==1">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>mri</td>
					<td><c:choose>
							<c:when test="${prvo.mri}==1">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>ct</td>
					<td><c:choose>
							<c:when test="${prvo.ct}==1">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>내시경</td>
					<td><c:choose>
							<c:when test="${prvo.endoscope}==1">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>${prvo.pdate }
				</tr>
			</tbody>
		</table>
	</div>
</section>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>