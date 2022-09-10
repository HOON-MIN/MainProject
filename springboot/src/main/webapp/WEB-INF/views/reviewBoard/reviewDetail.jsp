<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<article>
	<header>
		<h1>후기 상세 페이지</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" value="${vo.title }" readonly="readonly"> <input
				type="hidden" name="rnum" id="rnum" value="${vo.rnum }">
		</div>
		<div class="form-group">
			<label for="id">아이디</label> <input type="text" class="form-control"
				id="id" name="id" value="${vo.id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="cont">후기 내용</label>
			<textarea class="form-control" rows="5" id="cont" name="cont"
				readonly="readonly">${vo.cont }</textarea>
		</div>
		<p></p>
		<div class="form-group">
			<label for="writer">작성날짜 : </label> 
				
			<fmt:parseDate value="${vo.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/>
		</div>
		<p></p>
		<div><label>후기 평점(1~10점)  :   </label> ${vo.likes } 점</div>
		<p></p>
		<div class="form-group" style="text-align:">
			<input type="button" value="돌아가기" class="btn btn-info"
				id="returnBtn" onclick="location='reviewboardlist'" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		</div>
		<p></p>
		<div class="form-group" style="text-align:">
			<input type="button" value="후기수정" class="btn btn-info"
				id="updateBtn" /> <input type="button" value="글 삭제"
				class="btn btn-danger" id="delBtn" />
		</div>
	</div>
<p></p>

 <script type="text/javascript">
 
 $(function(){
		
		$('#updateBtn').click(function(){
			location ="reviewUpdate?rnum=${vo.rnum}";
		});
		$('#delBtn').click(function(){
			location ="delReview?rnum=${vo.rnum}";
		});
		
	});
 
 </script>
 
 </article>