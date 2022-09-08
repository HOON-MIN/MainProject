<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>메인페이지</title>
</head>
<body>
<h1> 회원 페이지 </h1>
<c:choose>
	<c:when test="${sessionID != null}">
<input type="button" value="로그아웃" onclick="location.href='member/memberLogout'">
	</c:when>
	<c:otherwise>
<input type="button" value="로그인" onclick="location.href='member/memberLoginForm'">
	</c:otherwise>
</c:choose>
<!--  <input type="button" value="회원가입" onclick="location.href='member'">-->
<input type="button" value="로그인체크" onclick="location.href='member/test'">
<input type="button" value="마이페이지" onclick="location.href='member/memberMypage'">
</body>
</html>