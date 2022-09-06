<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath}"></c:set>
<div class="container m-5 p-3">
<form method="post" action="${mycontext}/notice/modify">
   <div>
	<h3 style="text-align:center"> �� �� �� �� </h3>
	 <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">����</label>
  <input type="text" class="form-control" id="subject" name="subject" value="${item.subject}">
</div>
   <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">�ۼ���</label>
  <input type="text" class="form-control" id="writer" name="writer" value="${item.writer}" disabled="disabled">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">����</label>
  <textarea class="form-control" id="content" rows="15" name="content">
  ${item.content}
  </textarea>
</div>
   <div class="d-flex justify-content-end">
      <input type="hidden" name="nnum" value="${item.nnum}">
      <input type="button" value="���" onclick="location='${mycontext}/notice'" class="btn btn-primary">&nbsp;
	
      <input type="submit" value="Ȯ��" class="btn btn-success">&nbsp;

   </div></div>
   </form>
</div>