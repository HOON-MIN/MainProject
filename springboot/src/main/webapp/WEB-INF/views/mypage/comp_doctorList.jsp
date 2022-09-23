<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<!-- Sidebar-->
<div class="container py-4"
	style="width: 80%; margin: auto; padding: 10px 5px; height: 100%;">
	<%-- <table class="table1 table table-hover" style="text-align: center;">
		<thead>
			<tr>
				<th>병원명</th>
				<th>의사명</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="hosp" items="${list }">
				<tr>
					<c:forEach var="doc" items="${hosp.doctorVO}">
						<td>${hosp.hname }</td>
						<td>${doc.dname }</td>
					</c:forEach>
				</tr>
			</c:forEach>

		</tbody>
	</table> --%>

	<!--  -->
	<div class="jb">
	<c:forEach var="hosp" items="${list }">
		<c:forEach var="doc" items="${hosp.doctorVO}">
			<div class="jb-wrap">
				<div class="jb-image" style="text-align: center;">
					<img src="/taejin/hospital_img/hospital.jpg"
						style="cursor: pointer;" data-bs-toggle="modal"
						data-bs-target="#exampleModal" id="listBtn">
						<div>
						<p>${doc.dname}</p>
						<p>${doc.dmajor}</p>
						</div>
				</div>
			</div>
		</c:forEach>
		</c:forEach>
	</div>
</div>

<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
