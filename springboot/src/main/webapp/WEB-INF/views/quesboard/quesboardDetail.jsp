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
        <textarea name="qcont" id="qcont" readonly="readonly" 
        	cols="80" rows="20">${vo.qcont }</textarea>
      </p>
      
      <p style="text-align:right">
      <c:choose>
      <c:when test="${sessionScope.sessionId == vo.id }">
<!--       회원 본인글 id와 일치하면  -->
        <button type="submit" class="btn btn-primary" 
        	id="upBtn">수정</button>
        <button type="submit" class="btn btn-primary" 
        	id="delBtn">삭제</button>
      </c:when>
      
      </c:choose>
      </p>
      <c:choose>
      <c:when test="${sessionScope.sessionDid != null }">
<!--         	의사일때  -->
		<div>
		  <form action="post" name="abInsert" id="abInsert">
		  <input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
			<p>
		      <textarea name="acont" id="acont" 
		      	cols="80" rows="20" ></textarea>
		    </p>
		    <p style="text-align:right">
		    	<button class="btn btn-primary btn-dark text-white btn-block"
					type="submit">답변하기</button>
		<!--             <input type="submit" value="작성"> -->
		    </p>
		  </form>
		</div>
      </c:when>
      </c:choose>
    </fieldset>
  </form>
  <ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>
  <div>
  <h3>답변</h3>
    <table class="table table-bordered" id="datatablesSimple" style="text-align: center;">
		<thead>
			<tr>
				<th>번호</th>
				<th>답변의사ID</th>
				<th>내용</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<%-- for start --%>
			<c:forEach var="e" items="${ansList}">
				<tr>
					<td class="linktd">${e.anum}</td>
					<td class="linktd">${e.dnum}</td>
					<td class="linktd">${e.acont}</td>
					<td class="linktd">${e.adate}</td>
				</tr>
			</c:forEach>
			<%-- for end --%>
		</tbody>
	</table>
  </div>

</div>
</div>
<script>
$(function() {
$(function() {
	$('#upBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbUpdate");
			$('#qbUpdate').submit(function() {
				alert("수정되었습니다.");
			});
		});

	$('#delBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbDelete");
			$('#qbUpdate').submit(function() {
				alert("삭제되었습니다.");
			});
		});
	
});
});
</script>