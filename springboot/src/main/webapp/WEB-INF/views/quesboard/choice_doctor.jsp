<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container py-4"
		style="width: 80%; margin: auto; padding: 10px 5px; height: 100%;">
			<table class="table1 table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<th>병원명</th>
					<th>의사명</th>
				</tr>
			</thead>

			<tbody>
				 <c:forEach var="doc" items="${vo }">
					<tr>
						<td >${doc.dmajor }</td>
						<td >${doc.dname }</td>
						<td id="dnum">${doc.dnum }</td>
					</tr>
				</c:forEach> 
 
			</tbody>
		</table>
		</div>
			
<script>
var a = ${doc.dnum}
console.log(a)
$(function(){
	
	$('.table1').on('click','tr',function(){
		var dnum = $(this).children('#dnum').text();
		console.log(dnum)
		//location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum
		location.href='${pageContext.request.contextPath}/reserve/doctorCalendar?dnum='+dnum
	})
	
})
</script>