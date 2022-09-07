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
<h2 class="text-center">의학지식 질문하기</h2>
<div class="row" style="text-align:center">
  <form method="post" action="qbUpdate">
    <fieldset>
<!--         <legend></legend> -->
        <p>
<!--             <label for="wordv"> -->
                
<!--             </label> -->
            <textarea name="quesv" id="quesv" cols="80" rows="20"></textarea>
        </p>
        <p style="text-align:right">
            <input type="submit" value="수정">
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