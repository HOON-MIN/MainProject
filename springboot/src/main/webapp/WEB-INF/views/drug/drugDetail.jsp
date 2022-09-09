<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<header>
		<h1>��ǰ ��������</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<form action="dUpdate" id="dUpdateFormTag" method="get">
		<div class="col-md-10 mb-3 ">

			<label>��� : </label> <input class="form-control text-center"
				type="text" id="drug_name" name="drug_name" value="${vo.drug_name}"
				readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>������ : </label> <input class="form-control text-center"
				type="text" id="drug_company" name="drug_company"
				value="${vo.drug_company}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>���� : </label> <input class="form-control text-center"
				type="text" id="drug_formulation" name="drug_formulation"
				value="${vo.drug_formulation}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>���� : </label> <input class="form-control text-center"
				type="text" id="drug_component" name="drug_component"
				value="${vo.drug_component}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>��� : </label> <input class="form-control text-center"
				type="text" id="drug_shape" name="drug_shape"
				value="${vo.drug_shape}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>�ľ�ó�з� : </label> <input class="form-control text-center"
				type="text" id="drug_disposal" name="drug_disposal"
				value="${vo.drug_disposal}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>���� / �Ϲݾ�ǰ : </label> <input class="form-control text-center"
				type="text" id="drug_Professional_General"
				name="drug_Professional_General"
				value="${vo.drug_Professional_General}" readonly="readonly">
		</div>



		<div class="form-group mt-3 " style="align-content: center;">
			<label for="imgname">÷�ε� �̹��� </label> <img style="width: 500px"
				; 
			height="300px"
				src="${pageContext.request.contextPath}/resources/imgfile/${vo.drug_img}"
				id="imgname" value="imgname">
		</div>
	</form>

	<div class="form-group float-end"
		style="text-align: right; margin-top: 10px;">
		<button type="button" class="btn btn-primary" id="listbtn" 
		onclick="location='drugList'">��ü����Ʈ����</button>
	</div>
</article>