<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
<div class="container m-5">
<form method="post" action="${mycontext}/manager/notice/insert">
<div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">����</label>
  <input type="text" class="form-control" id="subject" placeholder="������ ������" name="subject">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">����</label>
  <textarea class="form-control" id="content" rows="15" name="content"></textarea>
</div>
<div>
<input type="hidden" name="writer" value="������">
<input type="submit" value="�ۼ�">
<input type="button" value="���" onclick="location.href='${mycontext}/notice'">
</div>
</div>
</form>
</div>