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

</style>
<article>
<div class="container">
<header>
	<h1>사용 후기 게시판</h1>
	</header>
	
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
<td class="text-center"><a href="reviewDetail?rnum=${e.rnum }">${e.title }</a></td>

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

<c:if test="${sessionID != null}">
<input type="button" value="후기 작성" id="wbtn" class="btn btn-danger" />
</c:if>

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
<input type="button" value="글작성" class="btn btn-info" id="writeBtn" />

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