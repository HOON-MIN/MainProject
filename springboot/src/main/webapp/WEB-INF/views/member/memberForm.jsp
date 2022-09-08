<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="memberIn">
     <table style="width: 80%; margin: auto">
   		<tr>
   		   <td>아이디</td>
   		   <td>
   		   <input type="text" name="id" id="id" maxlength="10" 
   		   style="width: 130px"> 
   		   <input type="button" value="중복확인" id="idChkBtn" 
   		   style="width: 150px; font-size: 10px; height: 30px;">
   		   </td>
   		 </tr>
   		 <tr><td colspan="2" id="target"></td></tr>
   		  <tr>
   		   <td>비밀번호</td>
   		   <td><input type="password" name="pwd" maxlength="10"> 
   		   </td>
   		 </tr>
   		  <tr>
   		   <td>이름</td>
   		   <td><input type="text" name="uname"> 
   		   </td>
   		 </tr>
   		  <tr><td colspan="2">
   		  <input type="submit" value="가입">
   		  </td></tr>
   </table>
     </form>
</body>
</html>