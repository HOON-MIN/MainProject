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
		<h1>waiting List</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>

		<%-- 리팩토링 해야 함 --%>
		
<table class="table1 table table-hover" id="" style="text-align: center;">
	<thead>
		<tr>
			<th>번호</th>
			<th>업체번호</th>
			<th>업체명</th>
			<th>사업자번호</th>
			<th>업체 구분</th>
			<th>신청 날짜</th>
			<th>승인 여부</th>
			<th>승인 버튼</th>
		</tr>
	</thead>

	<tbody>
 		<c:forEach var="e" items="${list }"> 
 			<tr> 
 				<td>${e.r_num}</td>
 				<td id="b">${e.cnum }</td>
 				<td>${e.hvo.hname }</td>
 				<td>${e.crn }</td>
 				<td id="c">${e.ccate }</td>
 				<td>${e.cdate }</td>
 				<td >승인대기</td>
				<td><input type="button" id="agreeBtn"value="가입승인" ></td>
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
	
	$('.table1').on("click","tr",function(){
		var b = $(this).children('#b').text();
		var c = $(this).children('#c').text();
		
		console.log("b = " +b)
		console.log("c = " +c)
		$.ajax({
			    url:'agree',
			    type:'POST',
			    data:{'num':b,
			    	'cate':c
			    	},
				success:function(data){
					alert('가입승인 완료되었습니다!')
					location.href='${pageContext.request.contextPath}/admin/waitingList'
					}
			})
		})
	
})
/* $.ajax({
			    url:'agree',
			    type:'GET',
			    data:{'num':b},
				success:function(data){
					console.log(data)
					}
			}) */
</script>









