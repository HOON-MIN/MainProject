<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
a:link{text-decoration: none;}

 table img { width: 80px;}
 /* paging */

 table tfoot ol.paging {
     margin-left:30%;
     list-style:none;
 }
 table tfoot ol.paging li {
     float:left;
     margin-right:8px;
 }
 table tfoot ol.paging li a {
     display:block;
     padding:3px 7px;
     border:1px solid #00B3DC;
     color:#2f313e;
     font-weight:bold;
 }
 table tfoot ol.paging li a:hover {
     background:#00B3DC;
     color:white;
     font-weight:bold;
 }
 .disable {
     padding:3px 7px;
     border:1px solid silver;
     color:silver;
 }
 .now {
     padding:3px 7px;
     border:1px solid #ff4aa5;
     background:#ff4aa5;
     color:white;
     font-weight:bold;
 }
 .card-header{
	padding-bottom : 0px;
 }
 
 .reviewScore{
font-size: 14px;
  background-color: #3478f5;
  padding: 4px 12px;
  border-radius: 16px;
  color: white;

 }
 
.navbar-brand{
margin-right : 
}

.flex-container{
    display: flex;
    flex-direction: row;
    justify-content : between;
    flex-wrap: wrap;
    width: 100%;
    min-width: 500px;
}
.flex-items{
   flex: auto;
   min-width:110px;
   height: 50px;
   background:#999;
   border-radius: 2px; 
   margin:3px;
　}

</style>
<article>
<div class="container">
	<header class="text-center m-5" >
		<h3>사용자 후기 게시판</h3>
	</header>
	
	<!--  /taejin/img/사진이름 -->

<!-- 
<c:forEach var="e" items="${reviewlist}">
<tr>
<td class="align-middle text-center">${e.rnum }</td>
<td class="text-center"><a href="reviewDetail?rnum=${e.rnum }">${e.title }<b><span style="color: darkred;">[${e.rcount }]</span></b></a></td>

<td class="align-middle text-center">${e.id }</td>
<td class="align-middle text-center">${e.hname }</td>
<td class="align-middle text-center"><fmt:parseDate value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/></td>
<td class="align-middle text-center">${e.hits }</td>

</tr>
</c:forEach>
 -->
 
<div class="flex-container justify-content-center">
 <c:forEach var="e" items="${reviewlist}">
	<div class="card m-3" style="max-width: 18rem;">
	  <div class="card-header bg-primary text-white p-1 d-flex align-items-center justify-content-between">
	  	<div class="navbar-brand   m-1 p-1">
	      
	      <img src="/taejin/img/undraw_profile_1.svg" alt="" width="30" height="30" class="d-inline-block align-text-top">
	      <span class="ms-1">${e.id }</span>
	    </div>
	      <span class="me-1 mb-0 span">
		      <fmt:parseDate value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
			  <fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/>
		  </span>
	    
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">${e.title }</h5>
	    <p class="card-text">${e.cont } </p>
	  </div>
	  <div class="card-footer d-flex justify-content-between align-items-center">
	  	<span>${e.hname }</span> 
	  	<span class="reviewScore">점수 : 8/10</span>
	  	<input type="hidden" value="${e.rnum}"> 
	  </div>
	</div>
 </c:forEach>
</div>
	
<table class="table table-bordered">

<thead>
<tr class="align-middle text-center">
  <th>번호</th>
  <th>제목</th>
  <th>아이디</th>
  <th>병원명</th>
  <th>작성일자</th>
  <th>조회수</th>
</tr>
</thead>

<tbody>
<c:forEach var="e" items="${reviewlist}">
<tr>
<td class="align-middle text-center">${e.rnum }</td>
<td class="text-center"><a href="reviewDetail?rnum=${e.rnum }">${e.title }<b><span style="color: darkred;">[${e.rcount }]</span></b></a></td>

<td class="align-middle text-center">${e.id }</td>
<td class="align-middle text-center">${e.hname }</td>
<td class="align-middle text-center"><fmt:parseDate value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/></td>
<td class="align-middle text-center">${e.hits }</td>

</tr>
</c:forEach>
</tbody>

<tfoot>
<tr>
<td colspan="6">
<ol class="paging">
  <c:choose>
  	<c:when test="${startPage < 6 }">
  	 <li class="disable">이전으로</li> 
  	</c:when>
  	<c:otherwise>

  	 <li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage-1}">이전으로</a></li>
  	 
  	</c:otherwise>
  </c:choose>
  	<c:forEach varStatus="i" begin="${startPage}" end="${endPage}" step="1">
  	 <c:choose>
  	 	<c:when test="${i.index == nowPage}">
  	 	  <li class="now">${i.index }</li>
  	 	</c:when>
  	 	<c:otherwise>
  	 	  <li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${i.index}">${i.index}</a></li>
  	 	</c:otherwise>
  	 </c:choose>
  	</c:forEach>
	<c:choose>
	  <c:when test="${endPage >= totalPage}">
	    <li class="disable">다음으로</li>
	  </c:when>
	  <c:when test="${totalPage > (nowPage+pagePerBlock)}">
	   <li><li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage+pagePerBlock}">다음으로</a></li>
	  </c:when>
	  <c:otherwise>
	   <li><li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage+pagePerBlock}">다음으로</a></li>
	  </c:otherwise>
	</c:choose>
</ol>


<form name="sForm" method="post" action="reviewboardlist">
    <select name="search_option">
        <option value="id"
<c:if test="${map.search_option == 'id'}">selected</c:if>
>작성자</option>
 
        <option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
        >제목</option>
 
        <option value="cont" 
<c:if test="${map.search_option == 'cont'}">selected</c:if>
        >내용</option>
        
        <option value="hname" 
<c:if test="${map.search_option == 'hname'}">selected</c:if>
        >병원명</option>
        
        <option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
        >작성자+내용+제목+병원명</option>
 
    </select>
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="조회">
</form>
<c:if test="${sessionID != null}">
<input type="button" value="글작성" class="btn btn-info" id="writeBtn" />
</c:if>

</td>
</tr>

</tfoot>
</table>

</div>

<script type="text/javascript">
 
 $(function(){
		$('#writeBtn').click(function(){
			location ="reviewupForm";
		});
		
	});
 
 </script>
  </article>