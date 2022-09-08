<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<article>
	<header>
		<h1>�ı� �� ������</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="form-group">
			<label for="title">����</label> <input type="text" class="form-control"
				id="title" value="${vo.title }" readonly="readonly"> <input
				type="hidden" name="rnum" id="rnum" value="${vo.rnum }">
		</div>
		<div class="form-group">
			<label for="id">���̵�</label> <input type="text" class="form-control"
				id="id" name="id" value="${vo.id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="cont">�ı� ����</label>
			<textarea class="form-control" rows="5" id="cont" name="cont"
				readonly="readonly">${vo.cont }</textarea>
		</div>
		<p></p>
		<div class="form-group">
			<label for="writer">�ۼ���¥ : </label> 
				
			<fmt:parseDate value="${vo.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/>
		</div>
		<p></p>
		<div><label>�ı� ����(1~10��)  :   </label> ${vo.likes } ��</div>
		<p></p>
		<div class="form-group" style="text-align:">
			<input type="button" value="���ư���" class="btn btn-info"
				id="returnBtn" onclick="location='reviewboardlist'" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		</div>
		<p></p>
		<div class="form-group" style="text-align:">
			<input type="button" value="�ı����" class="btn btn-info"
				id="updateBtn" /> <input type="button" value="�� ����"
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