<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<TITLE>New Document</TITLE>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BootStrap5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- ---------- -->

<!-- JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- ------ -->

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


    <!-- LOCAL CSS , JS  -->
    <script src="/js/datatables-simple-demo.js?"></script>
    <script src="/js/scripts.js?"></script>
    <link href="/css/styles.css?" rel="stylesheet" />
    <!-- --------------- -->
    
<!--     mireu summernote -->
<!--     <script src="/mireu/js/summernote-lite.js?"></script> -->
<!-- 	<script src="/mireu/js/summernote-ko-KR.js?"></script> -->
<!-- 	<link rel="stylesheet" href="/mireu/css/summernote-lite.css?"> -->
	<!-- 0918 add : dhlee 추가 -->
	<link href="/css/dhlee/covidRecording.css?ver=1.9" rel="stylesheet" />
	<link href="/css/dhlee/kakao_addinfo.css?" rel="stylesheet" />
  </head>
 
  <body>
    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="menu" />

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

<!-- LOCAL CSS , JS  -->
<script src="/js/datatables-simple-demo.js?"></script>
<script src="/js/scripts.js?"></script>
<link href="/css/styles.css?" rel="stylesheet" />
<!-- --------------- -->
<!-- Map -->
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx8fc6162789f747579d26c53413bd30f7"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="carousel" />
	<tiles:insertAttribute name="menu" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
















