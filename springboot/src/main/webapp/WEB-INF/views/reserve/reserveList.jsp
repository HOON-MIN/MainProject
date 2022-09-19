<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>

<style>
	/* paging */
	.paging {list-style:none; text-align:center; padding:0; margin:10px 0;}
	.paging li {display:inline-block;}
	.paging li.disable {padding:3px 10px; border:1px solid silver; color:silver;}
	.paging li.now {padding:3px 10px; border:1px solid #000; background:#000; color:white; font-weight:bold;}
	.paging li a {display:block; padding:3px 10px; border:1px solid #000; color:#000; font-weight:bold;}
	.paging li a:hover {background:#000; color:#fff; font-weight:bold;}
</style>

<script>
	
</script>
<article class="container">
        <header>
            <h1>회원님의 예약 현황</h1>
        </header>
        <div>
        	<input type="button" value="돌아가기" id="backbtn" onclick="history.go(-1)">
        </div>
        <div>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>예약번호</th>        
        <th>객실번호</th>
        <th>객실명</th>
        <th>최대인원</th>        
        <th>사용 시작일</th>
        <th>사용 종료일</th>
        <th>총 가격</th>
        <th>예약 취소</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="e" items="${rlist }">          
      <tr>      
        <td>${e.rvnum }</td>
        <td>${e.rnum }</td>
        <td>${e.roomvo.rname }</td>
        <td>${e.roomvo.rmax }</td>
        <td>${e.rvstart }</td>
        <td>${e.rvend }</td>
        <td>${e.rvprice }</td>
        <%-- 
        	rvstate는 0~3으로 구분
        	0 : 예약한 상태
        	1 : 예약을 취소한 상태
        	2 : 예약을 정상 이용하고 종료한 상태
        	3 : 예약을 이용중인 상태
         --%>
        <c:choose>        	
        	<c:when test="${e.rvstate eq 1 }">
        		<td><input type="button" value="취소된 예약" disabled="disabled"></td>
        	</c:when>
        	<c:when test="${e.rvstate eq 2 }">
        		<td>
        		<input type="button" value="이용 완료된 예약" disabled="disabled">
        		<a href="${mycontext}/member/review/wr?rvnum=${e.rvnum }"><input type="button" value="후기작성"></a>
        		</td>
        	</c:when>
        	<c:when test="${e.rvstate eq 3 }">
        		<td><input type="button" value="이용 중인 예약" disabled="disabled"></td>
        	</c:when>
        	<c:otherwise>
      			<td><a href="${mycontext}/member/reserve/reservecancel?rvnum=${e.rvnum}&"><input type="button" value="예약 취소"></a></td>  	
        	</c:otherwise>
        </c:choose>        
       </tr>      
      </c:forEach>
    </tbody>
    <tfoot>
	<tr>
	<td colspan="8">
	<ol class="paging">
	<c:choose>
		<c:when test="${startPage < 6}">
			<li class="disable">이전으로</li>
		</c:when>
		<c:otherwise>
			<li><a href="${mycontext}/member/reserve/reservelist?cPage=${startPage-pagePerBlock}">이전으로</a></li>
		</c:otherwise>
	</c:choose>
	<c:forEach varStatus="i" begin="${startPage}" end="${endPage}" step="1">
		<c:choose>
			<c:when test="${i.index == nowPage}">
				<li class="now">${i.index}</li>
			</c:when>
			<c:otherwise>
				<li><a href="${mycontext}/member/reserve/reservelist?cPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage >= totalPage}">
			<li class="disable">다음으로</li>
		</c:when>
		<c:otherwise>
			<li><a href="${mycontext}/member/reserve/reservelist?cPage=${startPage+pagePerBlock}">다음으로</a></li>
		</c:otherwise>		
	</c:choose>
	</ol>
	</td>
	</tr>
	</tfoot>  
  </table>
        </div>
 
    </article>
<script>
$(function() {
	let trs = $('tbody tr');
	trs.each(function(i, element) {
			$(this).click(function() {
				console.log($(this).children('td').eq(0).text());
				location='${mycontext}/member/roomservice/form?rvnum='+$(this).children('td').eq(0).text();
			});

	});
});
</script>