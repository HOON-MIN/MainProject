<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="content" class="container mt-5">
<h2 class="text-center">의학지식 질문 수정</h2>
<div class="row" style="text-align:center">
  <form method="post" name="qbUpdate" id="qbUpdate">
  <input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
  <input type="hidden" name="id" id="id" value="${vo.id }">
  <input type="hidden" name="qhit" id="qhit" value="${vo.qhit }">
  <input type="hidden" name="qdate" id="qdate" value="${vo.qdate }">
    <fieldset>
      <p>
		제목 <input type="text" value="${vo.qtitle }" 
			name="qtitle" id="qtitle" >
	  </p>
      <p>
        <textarea name="qcont" id="qcont" 
        	cols="80" rows="20">${vo.qcont }</textarea>
      </p>
      <p style="text-align:right">
        <button type="submit" class="btn btn-primary" 
        	id="upBtn">등록</button>
      </p>
    </fieldset>
  </form>

</div>
</div>
<script>
$(function() {
	$('#upBtn').click(function() {
		$('#qbUpdate').attr("action",
				"${mycontext}/quesboard/qbUpdate");
		$('#qbUpdate').submit(function() {
			alert("수정되었습니다.");
		});
	});

});
</script>