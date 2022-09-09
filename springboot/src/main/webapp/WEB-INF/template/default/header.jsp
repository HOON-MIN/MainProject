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
	
      
        <a class="nav-link active" aria-current="page" href="#">�α���</a>

      <c:choose>
      <c:when test="${sessionID !=null}">
      <a class="nav-link" href="${mycontext }/member/memberMypage">����������</a>
      <a class="nav-link active" aria-current="page" href="${mycontext }/member/memberLogout">�α׾ƿ�</a>
      </c:when>
      <c:otherwise>
      <a class="nav-link active" aria-current="page" href="${mycontext }/member/memberLoginForm">�α���</a>

        <a class="nav-link" href="#">ȸ������</a>
      </c:otherwise>
      </c:choose>
      
      </div>
    </div>
  </div>
</nav>