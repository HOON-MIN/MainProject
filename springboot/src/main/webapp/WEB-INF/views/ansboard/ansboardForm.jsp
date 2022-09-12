<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container mt-5">
<h2 class="text-center">의학지식 질문하기</h2>
<div class="row" style="text-align:center">
  <form method="post" name="qbUpdate" id="qbUpdate">
  <input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
  <input type="hidden" name="id" id="id" value="${vo.id }">
  <input type="hidden" name="qhit" id="qhit" value="${vo.qhit }">
  <input type="hidden" name="qdate" id="qdate" value="${vo.qdate }">
    <fieldset>
      <p>
		제목 <input type="text" value="${vo.qtitle }" 
			name="qtitle" id="qtitle" readonly="readonly">
	  </p>
      <p>
        <textarea name="qcont" id="qcont" 
        	cols="80" rows="20" readonly="readonly">${vo.qcont }</textarea>
      </p>
    </fieldset>
  </form>
</div>

<ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>
<!-- 의학지식인 질문에 대한 답변 등록 -->
<!-- sessionDid 가 있을 경우에만 답변 폼이 열리도록!  -->
<%-- <c:choose>  --%>
<%-- <c:when test="${sessionScope.sessionDid != null }"> --%>
<div>
  <form action="post" name="abInsert" id="abInsert">
  <input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
	<p>
      <textarea name="acont" id="acont" 
      	cols="80" rows="20" ></textarea>
    </p>
    <p style="text-align:right">
    	<button class="btn btn-primary btn-dark text-white btn-block"
			type="submit">작성</button>
<!--             <input type="submit" value="작성"> -->
    </p>
  </form>
</div>
<%-- </c:when> --%>
<%-- </c:choose> --%>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){

    });
</script>