<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 컨텐츠 (연회색배경) -->
<style>
.hcategory {
	background-color: #3478f5;
	padding-top: 40px;
	height: 100%;
}

.hboard {
	background-color: #efefef;
	border-radius: 8px;
	margin: 40px;
}

a {
	text-decoration: none;
	color: white;
}

.formTitle {
	margin-top: 40px;
	text-align: right;
}

.formInput {
	margin-top: 34px;
	margin-right: 40px;
}

.formInput2 {
	margin-top: 40px;
}
</style>

<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory">
			<!-- 카테고리 프로필 (이쪽 세션 처리 하셔야합니다)-->
			<c:choose>
				<c:when test="${sessionNUM != null}">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img
							src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}"
							alt="${pageContext.request.contextPath }/imgfile/${sessionProfimg}"
							style="height: 40%;" class="mb-3">
						<h5 class="hanna text-white">${sessionNAME }님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							관리자 ・ <a
							href="${pageContext.request.contextPath }/admin/adminHospTotalList"
							style="text-decoration: none; color: white;">관리자 페이지</a>
						</span>
					</div>
				</c:when>
				<c:when test="${sessionNUM == null}">
					<div
						class="d-flex flex-column align-items-start justify-content-center ps-5"
						style="height: 160px;">
						<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
							class="mb-3">
						<h5 class="hanna text-white">게스트 님</h5>
						<span class="nanum text-white" style="font-size: 12px;">
							비회원 ・ <a
							href="${pageContext.request.contextPath }/company/joinchoice">회원가입</a>
						</span>
					</div>
				</c:when>
			</c:choose>
			<!-- 카테고리 프로필 끝 -->

			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link text-white" aria-current="page"
						href="#">약 찾기 서비스</a></li>
					<!-- 이안에 본인 카테고리 나눠주세요 -->


					<li class=" nav-item pt-2 pb-2 ps-4" value="약 리스트"><a
						class="hcatebtn nav-link text-white"
						href="${pageContext.request.contextPath }/drugInsertForm">약
							등록하기</a></li>
					<li class=" nav-item pt-2 pb-2 ps-4" value="약 리스트"><a
						class="hcatebtn nav-link text-white"
						href="${pageContext.request.contextPath }/drugList">약 리스트</a></li>
				</ul>
			</div>
			<!-- 카테고리 리스트 끝 -->
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
				<div class="row justify-content-around">

					<div class="form-body">
						<div class="row">
							<div class="form-holder">
								<div class="form-content">
									<div class="form-items">
										<h4 class="mt-3 mb-3 text-center">약품 등록</h4>

										<p class="text-center mb-5">약품정보와 관련 식별이미지를 첨부해 주세요.</p>
										<form class="requires-validation nav justify-content-center"
											method="post" action="drugInsert"
											enctype="multipart/form-data" id="cbupform">

											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_name" name="drug_name" placeholder="약품명을 입력하세요 "
													required>
											</div>

											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_code" maxlength="13" name="drug_code"
													placeholder="약품번호을 입력하세요(13자리) " required>

											</div>

											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_identification" name="drug_identification"
													placeholder="식별표시를 입력하세요 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_formulation" name="drug_formulation"
													placeholder="제형을 입력하세요 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_component" name="drug_component"
													placeholder="성분을 입력하세요 ">
											</div>


											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_company" name="drug_company"
													placeholder="제조사를 입력하세요 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_description" name="drug_description"
													placeholder="성상을 입력하세요 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="number"
													id="drug_size_l" name="drug_size_l" placeholder="장축 입력 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="number"
													id="drug_size_s" name="drug_size_s" placeholder="단축 입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="number"
													id="drug_size_w" name="drug_size_w" placeholder="두께 입력 ">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_effect" name="drug_effect" placeholder="효능.효과 입력">
											</div>
											<div class="col-md-10 mb-3 ">
												<label>전문/일반 약품 여부</label> <input type="radio"
													name="drug_Professional_General" value="전문" checked>
												<input type="radio" name="drug_Professional_General"
													value="일반">
											</div>

											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_color_F" name="drug_color_F"
													placeholder="약전면색깔  입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_color_B" name="drug_color_B"
													placeholder="약후면색깔  입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_split_line_F" name="drug_split_line_F"
													placeholder="약 전면 분할선  입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_split_line_B" name="drug_split_line_B"
													placeholder="약 후면 분할선 입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control	 text-center" type="text"
													id="drug_disposal" name="drug_disposal"
													placeholder="식약처분류  입력">
											</div>
											<div class="col-md-10 mb-3 ">

												<input class="form-control text-center" type="text"
													id="drug_shape" name="drug_shape" placeholder="약모양 입력">
											</div>



											<div class="col-md-10 mb-3  nav justify-content-end">
												<label class="col-sm-3 col-form-label btn btn-primary  mb-3"
													for="mfile">이미지업로드</label>
												<div class="col-sm-10 class">
													<input type="file" name="mfile" id="mfile"
														value="fileOriName" style="display: none;" />
												</div>
												<div
													class="col-sm-10 d-flex justify-content-center form-control ">
													<img src="kimsungwook/loadimg/noimage.jpg" alt="" id="imgx"
														style="width: 120px" height="120px">
												</div>

												<div class="row mb-1 mt-3 ">
													<div class="col-sm-10">

														<input type="submit" value="등록" id="btn1"
															class="btn btn-primary" />
													</div>
												</div>

											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>





				</div>
			</div>
		</div>
	</div>



</div>


















	<script>
		$(function() {
			$("#mfile").on('change', function() {
				readURL(this);
			});
			//---------------------------

		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imgx').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>


