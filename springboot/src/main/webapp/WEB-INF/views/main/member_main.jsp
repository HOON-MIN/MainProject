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
<input type="button" value="�α׾ƿ�" onclick="location.href='member/memberLogout'">
	</c:when>
	<c:otherwise>
<input type="button" value="�α���" onclick="location.href='member/memberLoginForm'">
	</c:otherwise>
</c:choose>
<!--  <input type="button" value="ȸ������" onclick="location.href='member'">-->
<input type="button" value="�α���üũ" onclick="location.href='member/test'">
<input type="button" value="����������" onclick="location.href='member/memberMypage'">
</body>
</html>