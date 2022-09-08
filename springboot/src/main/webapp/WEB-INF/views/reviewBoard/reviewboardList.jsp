<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<h1>��� �ı� �Խ���</h1>
	</header>
	
<table class="table table-bordered">

<thead>
<tr class="align-middle text-center">
  <th>��ȣ</th>
  <th>����</th>
  <th>���̵�</th>
  <th>������</th>
  <th>�ۼ�����</th>
  <th>��ȸ��</th>
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
  	 <li class="disable">��������</li> 
  	</c:when>
  	<c:otherwise>

  	 <li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage-1}">��������</a></li>
  	 
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
	    <li class="disable">��������</li>
	  </c:when>
	  <c:when test="${totalPage > (nowPage+pagePerBlock)}">
	   <li><li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage+pagePerBlock}">��������</a></li>
	  </c:when>
	  <c:otherwise>
	   <li><li><a href="${pageContext.request.contextPath}/reviewboard/reviewboardlist?cPage=${startPage+pagePerBlock}">��������</a></li>
	  </c:otherwise>
	</c:choose>
</ol>

<c:if test="${sessionID != null}">
<input type="button" value="�ı� �ۼ�" id="wbtn" class="btn btn-danger" />
</c:if>

<form name="sForm" method="post" action="reviewboardlist">
    <select name="search_option">
        <option value="id"
<c:if test="${map.search_option == 'id'}">selected</c:if>
>�ۼ���</option>
 
        <option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
        >����</option>
 
        <option value="cont" 
<c:if test="${map.search_option == 'cont'}">selected</c:if>
        >����</option>
        
        <option value="hname" 
<c:if test="${map.search_option == 'hname'}">selected</c:if>
        >������</option>
        
        <option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
        >�ۼ���+����+����+������</option>
 
    </select>
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="��ȸ">
</form>
<input type="button" value="���ۼ�" class="btn btn-info" id="writeBtn" />

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