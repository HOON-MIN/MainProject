<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<article>
	<div class="form-body">
		<div class="row">
			<div class="form-holder">
				<div class="form-content">
					<div class="form-items">
						<h4 class="mt-3 mb-3 text-center">약품 등록</h4>

						<p class="text-center mb-5">약품정보와 관련 식별이미지를 첨부해 주세요.</p>
						<form class="requires-validation nav justify-content-center"
							novalidate method="post" action="drugInsert"
							enctype="multipart/form-data" id="cbupform" required>

							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_name"
									name="drug_name" placeholder="약품명을 입력하세요 " required>
							</div>
							
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_code" maxlength="13"
									name="drug_code" placeholder="약품번호을 입력하세요(13자리) " required>

							</div>
							
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_identification"
									name="drug_identification" placeholder="식별표시를 입력하세요 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_formulation"
									name="drug_formulation" placeholder="제형을 입력하세요 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_component"
									name="drug_component" placeholder="성분을 입력하세요 " >
							</div>
							
							
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_company"
									name="drug_company" placeholder="제조사를 입력하세요 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_description"
									name="drug_description" placeholder="성상을 입력하세요 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number" id="drug_size_l"
									name="drug_size_l" placeholder="장축 입력 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number" id="drug_size_s"
									name="drug_size_s" placeholder="단축 입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="number" id="drug_size_w"
									name="drug_size_w" placeholder="두께 입력 " >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_effect"
									name="drug_effect" placeholder="효능.효과 입력" >
							</div>
							<div class="col-md-10 mb-3 ">
								<label>전문/일반 약품 여부</label>
								<input type="radio" name="drug_Professional_General" value="전문" checked>
								<input type="radio" name="drug_Professional_General" value="일반" >
							</div>
							
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_color_F"
									name="drug_color_F" placeholder="약전면색깔  입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_color_B"
									name="drug_color_B" placeholder="약후면색깔  입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_split_line_F"
									name="drug_split_line_F" placeholder="약 전면 분할선  입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_split_line_B"
									name="drug_split_line_B" placeholder="약 후면 분할선 입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_disposal"
									name="drug_disposal" placeholder="식약처분류  입력" >
							</div>
							<div class="col-md-10 mb-3 ">

								<input class="form-control text-center" type="text" id="drug_shape"
									name="drug_shape" placeholder="약모양 입력" >
							</div>
							
							

							<div class="col-md-10 mb-3  nav justify-content-end">
								<label class="col-sm-3 col-form-label btn btn-primary  mb-3"
								for="mfile">이미지업로드</label>
								<div class="col-sm-10 class" >
									<input type="file" name="mfile" id="mfile"
										style="display: none;" />
								</div>
								<div class="col-sm-10 nav Justify-content-center form-control">
									<img
										src="${pageContext.request.contextPath}/resources/image/noimage.jpg"
										id="imgx" style="width: 300px" height="300px">
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

</article>