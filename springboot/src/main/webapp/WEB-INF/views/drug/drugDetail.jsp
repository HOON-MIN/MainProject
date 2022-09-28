<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
label {
	font-size: 18px;
}
</style>
<article>
	<!-- 컨텐츠 (연회색배경) -->
	<div class="col-10 flex-column">
		<div class="hboard pt-2 ps-3 pe-3 pb-3">

			<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
			<div class="container-fluid" style="text-align: center;">
				<div class="row">
					<div class="col-10"
						style="background-color: white; margin-left: 110px">


						<ul class="list-unstyled">
							<li class="border-top my-3"></li>

						</ul>
					

						<form action="dUpdate" id="dUpdateFormTag" method="get"
							style="margin-left: 200px">
							
							
							<div class="col-md-10 mb-3 ">

								<label class="hanna text-center hanna" style="background-color: aqua;">약품 상세정보란 </label> 
							</div>
							
							
							
							
							
							
							

							<div class="col-md-10 mb-3 ">

								<label class="hanna text-center">약명 </label> <input
									class="form-control text-center" type="text" id="drug_name"
									name="drug_name" value="${vo.drug_name}" readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">제조사 </label> <input
									class="form-control text-center" type="text" id="drug_company"
									name="drug_company" value="${vo.drug_company}"
									readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">효능.효과 </label> <input
									class="form-control text-center" type="text" id="drug_effect"
									name="drug_effect" value="${vo.drug_effect}"
									readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">제형 </label> <input
									class="form-control text-center" type="text"
									id="drug_formulation" name="drug_formulation"
									value="${vo.drug_formulation}" readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">성분 </label> <input
									class="form-control text-center" type="text"
									id="drug_component" name="drug_component"
									value="${vo.drug_component}" readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">모양 </label> <input
									class="form-control text-center" type="text" id="drug_shape"
									name="drug_shape" value="${vo.drug_shape}" readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">식약처분류 </label> <input
									class="form-control text-center" type="text" id="drug_disposal"
									name="drug_disposal" value="${vo.drug_disposal}"
									readonly="readonly">
							</div>
							<div class="col-md-10 mb-3 ">

								<label class="hanna">전문 / 일반약품 </label> <input
									class="form-control text-center" type="text"
									id="drug_Professional_General" name="drug_Professional_General"
									value="${vo.drug_Professional_General}" readonly="readonly">
							</div>



							<div class="col-md-10 mb-3 ">
								<img style="width: 70%; height: 55%"
									src="kimsungwook/imgfile/${vo.drug_img}" id="imgname"
									value="imgname">
							</div>
						</form>

						<div class="form-group float-end " style="margin-top: 10px;">
							<button type="button" class="btn btn-primary" id="listbtn"
								onclick="location='drugList'">전체리스트보기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</article>