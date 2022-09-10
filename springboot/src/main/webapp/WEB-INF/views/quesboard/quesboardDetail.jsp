<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="content" class="container mt-5">
<h2 class="text-center">의학지식 질문하기</h2>
<div class="row" style="text-align:center">
  <form method="post" action="qbUpdate">
    <fieldset>
      <p>
		제목 <input type="text" value="${vo.qtitle }" 
			name="qtitle" id="qtitle" >
	  </p>
      <p>
        <textarea name="quesv" id="quesv" 
        	value="${vo.qcont }" cols="80" rows="20"></textarea>
      </p>
      <p style="text-align:right">
        <button type="submit" class="btn btn-primary" 
        	id="upBtn">수정</button>
        <button type="submit" class="btn btn-primary" 
        	id="delBtn">삭제</button>
      </p>
    </fieldset>
  </form>

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