<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="content" class="container mt-5">
<h2 class="text-center">�������� �����ϱ�</h2>
<div class="row" style="text-align:center">
  <form method="post" action="qbUpdate">
    <fieldset>
      <p>
		���� <input type="text" value="${vo.qtitle }" 
			name="qtitle" id="qtitle" >
	  </p>
      <p>
        <textarea name="quesv" id="quesv" 
        	value="${vo.qcont }" cols="80" rows="20"></textarea>
      </p>
      <p style="text-align:right">
        <button type="submit" class="btn btn-primary" 
        	id="upBtn">����</button>
        <button type="submit" class="btn btn-primary" 
        	id="delBtn">����</button>
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
				alert("�����Ǿ����ϴ�.");
			});
		});

	$('#delBtn').click(
		function() {
			$('#qbUpdate').attr("action",
					"${mycontext}/quesboard/qbDelete");
			$('#qbUpdate').submit(function() {
				alert("�����Ǿ����ϴ�.");
			});
		});
	
});
});
</script>