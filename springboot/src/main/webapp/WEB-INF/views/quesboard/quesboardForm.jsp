<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="content" class="container mt-5">
<h2 class="text-center">의학지식 질문하기</h2>
<div class="row" style="text-align:center">
  <form method="post" action="qbInsert">
    <fieldset>
		<p>
			아이디(나중에 세션으로 받는것으로 수정)
			<input type="text" name="id" id="id" >
		</p>
		<p>
			제목 <input type="text" name="qtitle" id="qtitle" >
		</p>
        <p>
            <textarea name="qcont" id="qcont" cols="80" rows="20"></textarea>
        </p>
        <p style="text-align:right">
        	<button class="btn btn-primary btn-dark text-white btn-block"
			 type="submit">작성</button>
<!--             <input type="submit" value="작성"> -->
        </p>
    </fieldset>
  </form>

</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){

    });
</script>