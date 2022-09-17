<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<!-- include 제거  -->
<style>
/* 	.table1 :hover { */
		
/* 	} */
</style>


<div class="container">
<article>
	<header>
		<h1>Hospital List</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>

		<%-- 리팩토링 해야 함 --%>
<table class="table1 table table-hover" style="text-align: center;">
	<thead>
		<tr>
			<th>병원명</th>
			<th>진료과목</th>
		</tr>
	</thead>

	<tbody>
 		<c:forEach var="e" items="${list }"> 
 			<tr> 
				<td class="linktd">${e.cnum }</td>
				<td class="linktd">${e.date }</a></td>
				<td><input type="button" id="agreeBtn"value="가입승인" disabled=""></td>
 			</tr>
 		</c:forEach> 

	</tbody>
</table>

</article>
</div>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 

$(function(){
	$('#agreeBtn').click(function(){
		
		$.ajax({
			    url:'agree',
			    type:'GET',
				success:function(data){
				alret('가입 승인 완료')
				$('#agreeBtn').attr("value","가입 완료")
				$('#agreeBtn').attr("disabled","disabled")
				
					}
				
		})
	})
})
</script>









