<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>    
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Brand Name</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="d-flex" id="navbarNavAltMarkup">
      <div class="navbar-nav">
      
        <a class="nav-link active" aria-current="page" href="#">로그인</a>
        <a class="nav-link" href="#">회원가입</a>
        <a class="nav-link" href="#">마이페이지</a>
      </div>
    </div>
  </div>
</nav>