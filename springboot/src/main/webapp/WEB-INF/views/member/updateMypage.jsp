<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <form method="post" action="upload" enctype="multipart/form-data">
<input type="file" name="fileOriName"><br>
<input type="submit">
</form> -->
<h1>수정하기 폼</h1>
<form method="post" action="updateMypage" enctype="multipart/form-data">
     <table style="width: 80%; margin: auto">
   		<tr>
   		   <td>이름</td>
   		   <td>
   		   <input type="text" name="name" id="name" value="${member.name }" > 
   		   </td>
   		 </tr>
   		 <tr><td colspan="2" id="target"></td></tr>
   		  <tr>
   		   <td>email</td>
   		   <td><input type="text" name="email"value="${member.email}" > 
   		   </td>
   		 </tr>
   		  <tr>
   		   <td>전화번호</td>
   		   <td><input type="text" name="tel"value="${member.tel }" > 
   		   </td>
   		   <td>프로필 이미지</td>
   		   <td><input type="file" name="fileOriName"value="기본"></td>
   		 </tr>
   		  <tr><td colspan="2">

   		  
   		  </td>
   		  <td><input type="submit" value="수정하기">
   		  </td>
   		  </tr>
   </table>
     </form>
</body>
</html>