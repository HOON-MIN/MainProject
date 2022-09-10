<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath}"></c:set>
<div class="container m-5 p-3">
	<h3 style="text-align:center"> 공 지 사 항 </h3>
	 <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">주제</label>
  <input type="text" class="form-control" id="subject" value="${item.subject}" disabled="disabled">
</div>
   <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">작성자</label>
  <input type="text" class="form-control" id="subject" value="${item.writer}" disabled="disabled">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="content" rows="15" name="content" disabled="disabled">
  ${item.content}
  </textarea>
</div>
   <div class="d-flex justify-content-end">
      <input type="button" value="목록" onclick="location.href='${mycontext}/notice'" class="btn btn-primary">&nbsp;
      <input type="button" value="수정" onclick="location.href='${mycontext}/notice/update?nnum=${item.nnum}'" class="btn btn-success">&nbsp;
      <input type="button" value="삭제" onclick="location.href='${mycontext}/notice/delete?nnum=${item.nnum}'" class="btn btn-danger"/>&nbsp;
   </div>
</div>