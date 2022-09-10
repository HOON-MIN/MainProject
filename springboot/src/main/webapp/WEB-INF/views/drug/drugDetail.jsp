<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
	<header>
		<h1>약품 상세정보란</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<form action="dUpdate" id="dUpdateFormTag" method="get">
		<div class="col-md-10 mb-3 ">

			<label>약명 : </label> <input class="form-control text-center"
				type="text" id="drug_name" name="drug_name" value="${vo.drug_name}"
				readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>제조사 : </label> <input class="form-control text-center"
				type="text" id="drug_company" name="drug_company"
				value="${vo.drug_company}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>제형 : </label> <input class="form-control text-center"
				type="text" id="drug_formulation" name="drug_formulation"
				value="${vo.drug_formulation}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>성분 : </label> <input class="form-control text-center"
				type="text" id="drug_component" name="drug_component"
				value="${vo.drug_component}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>모양 : </label> <input class="form-control text-center"
				type="text" id="drug_shape" name="drug_shape"
				value="${vo.drug_shape}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>식약처분류 : </label> <input class="form-control text-center"
				type="text" id="drug_disposal" name="drug_disposal"
				value="${vo.drug_disposal}" readonly="readonly">
		</div>
		<div class="col-md-10 mb-3 ">

			<label>전문 / 일반약품 : </label> <input class="form-control text-center"
				type="text" id="drug_Professional_General"
				name="drug_Professional_General"
				value="${vo.drug_Professional_General}" readonly="readonly">
		</div>



		<div class="form-group mt-3 " style="align-content: center;">
			<label for="imgname">첨부된 이미지 </label> <img style="width: 500px"
				; 
			height="300px"
				src="${pageContext.request.contextPath}/resources/imgfile/${vo.drug_img}"
				id="imgname" value="imgname">
		</div>
	</form>

	<div class="form-group float-end"
		style="text-align: right; margin-top: 10px;">
		<button type="button" class="btn btn-primary" id="listbtn" 
		onclick="location='drugList'">전체리스트보기</button>
	</div>
</article>