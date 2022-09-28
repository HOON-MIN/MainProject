<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div style="height: 80%;">
					<h3 class="hanna p-4" style="text-align: center;">병원 목록</h3>
					</div>
   <table class="htable table1">
   <thead class="hanna">
   <tr><td>번호</td><td>담당의사</td><td>xray</td><td>mri</td><td>ct</td><td>내시경</td><td>날짜</td></tr>
   </thead>
   <tbody>
   <c:forEach var="e" items="${prvo}">
      <tr>
         <td id="pnum">${e.pnum}</td>
         <td>${e.dname}</td>
         <td><c:choose><c:when test="${e.xray}==1">O</c:when><c:otherwise>X</c:otherwise> </c:choose></td>
         <td><c:choose><c:when test="${e.mri}==1">O</c:when><c:otherwise>X</c:otherwise> </c:choose></td>
         <td><c:choose><c:when test="${e.ct}==1">O</c:when><c:otherwise>X</c:otherwise> </c:choose></td>
         <td><c:choose><c:when test="${e.endoscope}==1">O</c:when><c:otherwise>X</c:otherwise> </c:choose></td>
         <td>${e.pdate}</td>
      </tr>
   </c:forEach>
   </tbody>
   </table>
<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script>
$('.table1').on('click','tr',function(){
var pnum = $(this).children('#pnum').text()
	console.log('aa = ' ,$(this).children('#pnum').text() );
	location.href='${pageContext.request.contextPath}/member/selectPone?pnum='+pnum
	
})
</script>