<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>


<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<body>
<div class="grid">
	<div class="position-absolute top-50 start-50 translate-middle">	
		<div class="grid">
			
		</div>
<table class="table table-bordered " id="datatable">
<thead>
   <tr>
 		<th>가게 번호</th>
		<th>가게명</th>
		<th>영업상태</th>
		<th>주소</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="e" items="${list }">
			<tr>
				<td  class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.pnum }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.shopName }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.businessStatus }</a></td>
				<td class="align-middle text-center"><a href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}" class="nav-link" id="item3">${e.fullAddress }</a></td>
			</tr>
		</c:forEach>
</tbody>
<tfoot>
<tr>
<td colspan="4"  >${startPage}/${endPage }
<ol class="pagination justify-content-center" >
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="page-item disabled"><a class="page-link">이전</a></li>
		</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage-pagePerBlock}&type=${type }&searchf=${searchf}">이전</a></li>
	</c:otherwise>
	</c:choose>

 	<c:forEach varStatus="i" begin="${startPage}" end="${endPage }" step="1" >

		<c:choose>
			<c:when test="${i.index == nowPage}">
	 			<li class="page-item disabled"><a class="page-link">${i.index}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${i.index}&type=${type }&searchf=${searchf}">${i.index}</a></li>
			</c:otherwise>
		</c:choose> 
 	</c:forEach>
 	<c:choose>
		<c:when test="${endPage >= totalPage }">
			<li class="page-item disabled"><a class="page-link">다음</a></li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li class="page-item"><a class="page-link"  href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${nowPage+pagePerBlock }&type=${type }&searchf=${searchf}">다음</a></li>
		</c:when>
		<c:otherwise>
     		<li class="page-item"><a class="page-link"  href="${pageContext.request.contextPath}/pharmacy/ShopListPage?cPage=${totalPage }&type=${type }&searchf=${searchf}">다음</a></li>
		</c:otherwise>
 	</c:choose>
</ol>

</td>

</tr>
	<tr>
		<td colspan="4">
				<ol class="pagination justify-content-center">
				<form method="get" action="ShopListPage" accept-charset="utf-8">
						
						<select class="form-select" name="type" style="color: black;">
							<option selected="${type}" value="sname">검색 내용</option>
							<option value="shopName">상호명</option>
							<option value="fullAddress">지역명</option>
							<option value="pnum">관리번호</option>
						</select> 
			
				<input class="form-control me-2" type="text" id="searchf" name="searchf" style="color:#000;">
			<input type="submit" class="btn btn-outline-primary w-100 p-2" value="검색">
		</form>
			</ol>
		</td>	
	</tr>
</tfoot>
</table>
	</div>
</div>        

   <script>
$(function(){
	$('#searchv').focusin(function() {
		$(this).val("검색어 입력")
	});
	$('#searchv').focusout(function() {
		$(this).val("")
	});
	
});
</script>     
        
</body>
</html>