<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>����������</title>
</head>
<body>
<h1> ȸ�� ������ </h1>
<c:choose>
	<c:when test="${sessionID != null}">
<input type="button" value="�α׾ƿ�" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout'">
<input type="button" value="����������" onclick="location.href='${pageContext.request.contextPath}/member/memberMypage'">
	</c:when>
	<c:otherwise>
<input type="button" value="�α���" onclick="location.href='${pageContext.request.contextPath}/member/memberLoginForm'">
	</c:otherwise>
</c:choose>
<!--  <input type="button" value="ȸ������" onclick="location.href='member'">-->
<input type="button" value="�α���üũ" onclick="location.href='${pageContext.request.contextPath}/member/test'">
</body>
</html>