<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>quesboardForm</title>
</head>
<body>
<div id="content" class="container mt-5">
<h2 class="text-center">�������� �����ϱ�</h2>
<div class="row" style="text-align:center">
  <form method="post" action="qbInsert">
    <fieldset>
		<p>
			���̵�(���߿� �������� �޴°����� ����)
			<input type="text" name="id" id="id" >
		</p>
		<p>
			���� <input type="text" name="qtitle" id="qtitle" >
		</p>
        <p>
            <textarea name="qcont" id="qcont" cols="80" rows="20"></textarea>
        </p>
        <p style="text-align:right">
        	<button class="btn btn-primary btn-dark text-white btn-block"
			 type="submit">�ۼ�</button>
<!--             <input type="submit" value="�ۼ�"> -->
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
</body>
</html>