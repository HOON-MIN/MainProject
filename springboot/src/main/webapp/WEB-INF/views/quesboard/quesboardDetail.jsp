<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container mt-5">
	<h2 class="text-center">의학지식 질문하기</h2>
	<div class="row" style="text-align: center">
		<form method="post" name="qbUpdate" id="qbUpdate">
			<input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
			<input type="hidden" name="id" id="id" value="${vo.id }"> <input
				type="hidden" name="qhit" id="qhit" value="${vo.qhit }"> <input
				type="hidden" name="qdate" id="qdate" value="${vo.qdate }">
			<fieldset>
				<div style="width: 611px; margin: 0 auto;">
					<div style="display: inline-block; width: 29%">
						<input type="text" value="${vo.qcate }" name="qcate" id="qcate" readonly="readonly">
					</div>
					<div style="display: inline-block; width: 70%">
						<input type="text" value="${vo.qtitle }" name="qtitle" id="qtitle" width="100%;" readonly="readonly">
					</div>
					<div>
						<textarea name="qcont" id="summernote" cols="80" rows="20" readonly="readonly">${vo.qcont }</textarea>
					</div>
					<div style="text-align: right">
						<c:choose>
							<c:when test="${sessionScope.sessionID == vo.id }">
								<!-- 로그인 - 일반회원인데 본인글 일 때 => id와 일치하면  -->
								<!-- 수정폼으로 가기 -->
								<input type="button" id="upFormBtn" value="수정" class="btn btn-primary" >
								<input type="button" id="delBtn" value="삭제" class="btn btn-primary" >
							</c:when>
						</c:choose>
					</div>
				</div>
			</fieldset>
		</form>

		<!--  로그인 - 의사일 때  -->
		<c:choose>
			<c:when test="${sessionScope.sessionDid != null }">
				<div>
					<form action="post" name="abInsert" id="abInsert">
						<input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
						<p>
							<textarea name="acont" id="acont" cols="80" rows="20"></textarea>
						</p>
						<p style="text-align: right">
							<button class="btn btn-primary btn-dark text-white btn-block"
								type="submit">답변하기</button>
						</p>
					</form>
				</div>
			</c:when>
		</c:choose>

		<!-- 현재 질문에 대해 달린 답변 리스트 출력 -->
		<ul class="list-unstyled">
			<li class="border-top my-3"></li>
		</ul>
		<div>
			<h3>답변</h3>
			<table class="table table-bordered" id="datatablesSimple"
				style="text-align: center;">
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
	$('#upFormBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbUpdateForm?num="+${vo.qnum });
			$('#qbUpdate').submit();
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