<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
<div class="container-fluid">
<div class="row m-5">
	<h3> �� �� �� ��</h3>
	<div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">��ȣ</th>
					<th scope="col">����</th>
					<th scope="col">�ۼ���</th>
					<th scope="col">��¥</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4">
						����ó�� �ʿ�
						<input class="btn btn-primary" type="button" value="���� �߰�" onclick="location.href='${mycontext}/notice/addNotice'">
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