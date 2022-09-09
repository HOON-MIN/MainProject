<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath}"></c:set>
<div class="container m-5 p-3">
<form method="post" action="${mycontext}/notice/modify">
   <div>
	<h3 style="text-align:center"> 공 지 사 항 </h3>
	 <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">주제</label>
  <input type="text" class="form-control" id="subject" name="subject" value="${item.subject}">
</div>
   <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">작성자</label>
  <input type="text" class="form-control" id="writer" name="writer" value="${item.writer}" disabled="disabled">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="content" rows="15" name="content">
  ${item.content}
  </textarea>
</div>
   <div class="d-flex justify-content-end">
      <input type="hidden" name="nnum" value="${item.nnum}">
      <input type="button" value="목록" onclick="location='${mycontext}/notice'" class="btn btn-primary">&nbsp;
	
      <input type="submit" value="확인" class="btn btn-success">&nbsp;

   </div></div>
   </form>
</div>