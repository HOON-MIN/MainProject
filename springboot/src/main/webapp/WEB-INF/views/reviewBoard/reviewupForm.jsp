<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article >
<header>
   <h1>후기 작성</h1>
</header>
   <ul class="list-unstyled"><li class="border-top my-3"></li></ul>

<div class="container">       
<%-- boardForm 들어 갈 자리 --%>
<fieldset>
<!-- 액션은 컨트롤러로 보내는 역할이다 @PostMapping(value ="/upload")와 동일해야 한다 -->
<form method="post" action="uploadpro" id="upform">
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">제 목</label>
   <div class="col-sm-10"><input type="text" name="title" id="title" placeholder="제목을 입력하세요."/></div>
</div> 
<div class="row mb-3">
   <label class="col-sm-2 col-form-label">아이디</label>
   <div class="col-sm-10"><input type="text" name="id" id="id" placeholder="제목을 입력하세요."/></div>
</div>

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">병원명</label>
   <div class="col-sm-10"><input type="text" name="hname" id="hname" placeholder="병원명 입력하세요."/></div>
</div> 

<div class="row mb-3">
   <label class="col-sm-2 col-form-label">의사선생님</label>
   <div class="col-sm-10"><input type="text" name="dname" id="dname" placeholder="의사선생님 이름을 입력하세요."/></div>
</div>
<p><label>후기 평점(1~10점) </label>
<input type="number" name="likes" id="likes" min="1" max="10" step="1" value="5"></p>

<div class="row mb-3">
    <label class="col-sm-2 col-form-label">후기 내용</label>
    <textarea name="cont" id="cont" rows="10" cols="13"></textarea>
</div>
                       
<div class="row mb-3 ">
 <div class="col-sm-10">
 <input type="submit" value="등록" id="btn1" class="btn btn-info"/>
 <input type="button" value="이전으로" id="btn2" class="btn btn-info" onclick="location='reviewboardlist'"/>
 
 
 </div>
</div>
</form>
</fieldset>
</div>
<script>

</script>
</article>