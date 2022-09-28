<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<TITLE>Hey Dr.</TITLE>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/img/favicon.png">
<!-- BootStrap5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- ---------- -->
<!-- 소영님 -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/soyoung/dashboard/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/soyoung/dashboard/assets/img/favicon.png">
<title>Argon Dashboard 2 by Creative Tim</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="/soyoung/dashboard/css/nucleo-icons.css" rel="stylesheet" />
<link href="/soyoung/dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="/soyoung/dashboard/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->



<!-- JQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <!-- -->

<!-- list.jsp 에 넣을 스크립트, 링크 코드 -->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- ------------------------------->
<!-- 폰트 -->

<link href="//fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.hanna {
	font-family: 'hanna';
}

.nanum {
	font-family: 'Nanum Barun Gothic';
}
</style>
<!--  -->
<!-- LOCAL CSS , JS  -->
<script src="/js/datatables-simple-demo.js?"></script>
<script src="/js/scripts.js?"></script>
<link href="/css/styles.css?" rel="stylesheet" />
<link href="/css/font.css">
<!-- --------------- -->

<!-- mireu summernote -->
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- 0918 add : dhlee 추가 -->
<link href="/css/dhlee/covidRecording.css?ver=1.9" rel="stylesheet" />
<link href="/css/dhlee/kakao_addinfo.css?" rel="stylesheet" />
<link href="/css/chatbot.css" rel="stylesheet" />
<link href="/css/chatCircle.css" rel="stylesheet" />
<!--  cdn -->
<script src="/taejin/js/scripts.js"></script>

<!-- bootstrap5 dataTables js cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<!-- ---------- -->
<!-- Map -->

</head>
<style>
body {
	background-color: #3478f5;
}
</style>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
<script src="/js/dhlee/covidRecording.js?"></script>
<script src="/js/dhlee/recording.js?"></script>
<script src="/js/dhlee/kakao_addinfo.js?"></script>
<script src="/js/chatbot.js"></script>
</html>
















