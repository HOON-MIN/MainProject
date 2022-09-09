<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
<div class="container m-5">
<form method="post" action="${mycontext}/manager/notice/insert">
<div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">주제</label>
  <input type="text" class="form-control" id="subject" placeholder="주제를 쓰세요" name="subject">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="content" rows="15" name="content"></textarea>
</div>
<div>
<input type="hidden" name="writer" value="관리자">
<input type="submit" value="작성">
<input type="button" value="목록" onclick="location.href='${mycontext}/notice'">
</div>
</div>
</form>
</div>