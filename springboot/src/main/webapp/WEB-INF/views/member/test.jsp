<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	#wrapper{
		width:940px;
		height:400px;
		margin:0;
		overflow: hidden;
	}
	
	header{
		float:lfet;
	}
	aside{
		float:left;
		border-right:solid;
		width:120px;
		height:500px;
		text-align:center;
		margin:0px 10px 0px 0px;
	}
	
	article{
		padding:10px;
		float:reft;
		
		position:static;
	}
	
	footer{
		
	}
	
	#tb{
		float:right;
	}
</style>
<script>
	
	/*
	function sapply(sb_num){
		alert("sb_num >>> : " + sb_num);
		
		location.href="beforeyn.k?sb_num="+sb_num;
	}
	
	
	$(document).ready(function(){
		
		// 신청
		$(document).on("click", "#rbtn", function(){
			
			$("#sgRegistrationForm").attr({
				"action":"beforeyn.k",
				"method":"GET"
			}).submit();
		});
	});
	*/
</script>
<title>수강신청 화면</title>
</head>
<div id="wrapper">
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	
%>

<header>
<table id="tb">
	<tr>
		<td colspan="2">
			<a href="sgRegistration.k">수강희망과목</a> ||
			<a href="selectSb.k">개설강좌검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<hr>
	<hr>
</table>
</header>
<aside>
	<a href=#>수강신청</a><br>
	<a href=#></a><br>
	<a href=#>희망과목내역</a>
</aside>
<article>
<form name="sgRegistrationForm" id="sgRegistrationForm">
<table border="1">
<thead>
	<tr align="center">
		<td>수강신청</td>
		<td>과목유형</td>
		<td>과목번호</td>
		<td>교과군번호</td>
		<td>과목</td>
		<td>대상학년</td>
		<td>정원</td>
		<td>잔여인원</td>
		<td>교수명</td>
		<td>학점</td>
		<td>수업요일</td>
		<td>수업교시</td>
	</tr>
</thead>
<%
%>

<tbody>
	<tr align="center">
		<td>
			<input type="button" value="신청" id="rbtn" name="rbtn">
		</td>
		<td>필수</td>
	</tr>
<%
%>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(document).on("click", "#rbtn", function(){
		});
	});
</script>
</tbody>
</table>
</form>
</article>
</div>
<h1>수강신청 랜딩페이지에서 수강신청 클릭시 나오는 수강신청 페이지입니다!</h1>
<hr>
<a href="mainHome.k">학교 홈페이지로 이동</a>
</body>
</html>