<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<!-- Sidebar-->
	<div class="container py-4"
		style="width: 80%; margin: auto; padding: 10px 5px; height: 100%;">
			<table class="table1 table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<th>병원명</th>
					<th>의사명</th>
				</tr>
			</thead>

			<tbody>
				<%-- <c:forEach var=hosp" items="${list }">
				<c:forEach var="doc" items="hosp">
					<tr>
						<td class="linktd">${hosp.hname }</td>
						<td class="linktd">${hosp.doc.dname }</td>
					</tr>
					</c:forEach>
				</c:forEach> --%>
 
			</tbody>
		</table>
			
		</div>
			
	<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>