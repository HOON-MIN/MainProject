<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@include file="../temp/header.jsp"%>
  <article>
  <div class="container">
   <header>
       <h1>�ı� ����</h1>
   </header>
        <ul class="list-unstyled"><li class="border-top my-3"></li></ul> 
        
 <!-- --------------------------- -->
 <form method="post" action="uploadUpdate" id="upform">
<input type="hidden" name="rnum" id="rnum" value="${vo.rnum }">
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�� ��</label>
   <div class="col-sm-10"><input type="text" name="title" id="title" value="${vo.title }" /></div>
   
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">���̵�</label>
   <div class="col-sm-10"><input type="text" name="id" id="id" value="${vo.id }"/></div>
</div>
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">������</label>
   <div class="col-sm-10"><input type="text" name="hname" id="hname" value="${vo.hname }"/></div>
</div>
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">�ǻ缱����</label>
   <div class="col-sm-10"><input type="text" name="dname" id="dname" value="${vo.dname }"/></div>
</div>
<div><label>�ı� ����(1~10��) </label>
<input type="number" name="likes" id="likes" min="1" max="10" step="1" value="5"></div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label">�ı� ����</label>
    <textarea name="cont" id="cont" rows="10" cols="13">${vo.cont }</textarea>
</div>
                       
<div class="row mb-3 ">
 <div class="col-sm-10"><input type="submit" value="����" id="btn1" class="btn btn-info"/>

 </div>
</div>
</form>
 
 </div>
 </article>