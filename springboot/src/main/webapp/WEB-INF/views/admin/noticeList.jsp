<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
<div class="container-fluid">
<div class="row m-5">
	<h3> 공 지 사 항</h3>
	<div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">주제</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4">
						세션처리 필요
						<input class="btn btn-primary" type="button" value="공지 추가" onclick="location.href='${mycontext}/notice/addNotice'">
					</td>
				<tr>
				<tr>
					<td colspan="4"> Paging </td>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach var="item" items="${items}">
				<tr>
					<th scope="row">${item.nnum }</td>
					<td><a href="${mycontext }/notice/detail?nnum=${item.nnum}">${item.subject}</a></td>
					<td>${item.writer}</td>
					<td>${item.ndate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>