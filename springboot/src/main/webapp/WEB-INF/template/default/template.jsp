<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
 <head>
  <TITLE> New Document </TITLE>
  <meta charset="euc-kr">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${mycontext}/resources/css/style.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 </head>
 <body>
   <tiles:insertAttribute name="header"/>
   <tiles:insertAttribute name="carousel"/>
   <tiles:insertAttribute name="menu"/>
  <tiles:insertAttribute name="body"/>
  <tiles:insertAttribute name="footer"/>
 </body>
</html>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 