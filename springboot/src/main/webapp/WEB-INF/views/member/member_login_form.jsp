<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Form</title>
</head>
<body>
<form action="memberLogin" method="post">
	<div>
	<label>ID</label>
	<input type="text" name="id" id="id" placeholder="id">
	</div>
	<div>
	<label>PWD</label>
	<input type="password" name="pwd" id="pwd" placeholder="pwd">
	</div>
	<div>
	<input type="submit">
	</div>
</form>
</body>
</html>