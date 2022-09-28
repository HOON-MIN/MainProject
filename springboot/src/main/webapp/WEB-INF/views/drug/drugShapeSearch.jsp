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
	margin-top: 36px;
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
					<div class="card col-3 mt-2">
						<div
							style="background-color: #efefef; height: 18rem; position: relative;"
							class="mt-3">
							<img src="/img/pills2.png" class="card-img-top"
								style="position: absolute; left: 50%; top: 50%; width: 8rem; height: 8rem; left: 50%; transform: translate(-50%, -50%);">

						</div>
						<div class="card-body">
							<h5 class="card-title hanna">약품 이미지 분석</h5>

							<p class="card-text nanum">사진으로 약을 찾아보세요.</p>
							<a href="drugSearchImg" class="btn btn-secondary">약품
								이미지 분석</a>
						</div>
					</div>
					<div class="col-7 mt-2 justify-content-center">
						<h3 class="hanna" style="text-align: center;">약품 정보란</h3>
						<div class="row justify-content-center">
							<div class="col-3">
								<ul class="nav flex-column">
									<li class=" nav-item hanna formTitle"><h6>식별표시</h6></li>
									<li class=" nav-item hanna formTitle"><h6>모양선택</h6></li>
									<li class=" nav-item hanna formTitle"><h6>색깔선택</h6></li>
									<li class=" nav-item hanna formTitle"></li>
									<li class=" nav-item hanna formTitle"><h6>제형선택</h6></li>
								</ul>
							</div>
							<div class="col-9">
								<form method="get" action="shapeSearch" id="shapeSearchform">
									<input type="text" name="drug_identification" id="drug_identification"
										class="form-control-sm formInput  " placeholder="식별표시를 입력하세요." />
									<select class="form-select formInput form-select-sm"  name="drug_shape"
										aria-label=".form-select-sm example">
										<option value="전체" selected>모양을 선택하세요.</option>
										<option value="원형">"원형"</option>
										<option value="타원형">"타원형"</option>
										<option value="장방형">"장방형"</option>
										<option value="반원형">"반원형"</option>
										<option value="삼각형">"삼각형"</option>
										<option value="사각형">"사각형"</option>
										<option value="마름모형">"마름모형"</option>
										<option value="오각형">"오각형"</option>
										<option value="육각형">"육각형"</option>
										<option value="팔각형">"팔각형"</option>
										<option value="기타">"기타"</option>
										<option value="전체">"전체"</option>
									</select> <select class="form-select form-select-sm formInput" name="drug_color_F"
										aria-label="Default select example">
										<option value="전체" selected>전면/좌측 선택</option>
										<option value="하양">하양</option>
										<option value="노랑">노랑</option>
										<option value="주황">주황</option>
										<option value="분홍">분홍</option>
										<option value="빨강">빨강</option>
										<option value="갈색">갈색</option>
										<option value="연두">연두</option>
										<option value="초록">초록</option>
										<option value="청록">청록</option>
										<option value="파랑">파랑</option>
										<option value="남색">남색</option>
										<option value="자주">자주</option>
										<option value="보라">보라</option>
										<option value="회색">회색</option>
										<option value="검정">검정</option>
										<option value="전체">전체</option>
									</select> <select class="form-select form-select-sm" name="drug_color_B"
										aria-label="Default select example">
										<option value="전체" selected>후면/좌측 선택</option>
										<option value="없음">전면과 동일</option>
										<option value="하양">하양</option>
										<option value="노랑">노랑</option>
										<option value="주황">주황</option>
										<option value="분홍">분홍</option>
										<option value="빨강">빨강</option>
										<option value="갈색">갈색</option>
										<option value="연두">연두</option>
										<option value="초록">초록</option>
										<option value="청록">청록</option>
										<option value="파랑">파랑</option>
										<option value="남색">남색</option>
										<option value="자주">자주</option>
										<option value="보라">보라</option>
										<option value="회색">회색</option>
										<option value="검정">검정</option>
										<option value="투명">투명</option>
										<option value="전체">전체</option>
									</select> 

									<select class="form-select form-select-sm formInput" style="margin-top: 45px"
										aria-label="Default select example" name="drug_formulation">
										<option value="전체" selected>제형 선택</option>
										<option value="정제">"정제"</option>
										<option value="경질캡슐">"경질캡슐"</option>
										<option value="연질캡슐">"연질캡슐"</option>
										<option value="기타">"기타"</option>
										<option value="전체">"전체"</option>
									</select>
									<div class="d-flex justify-content-end mt-3">
										<input type="submit" class="btn bg-primary text-white me-3" value="검색"/>

									</div>

								</form>
							</div>
						</div>
						<!----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
						<!-- <p class="text-center mb-5 hanna">모양으로 약품 검색</p>
						<form method="get" action="shapeSearch" id="shapeSearchform">
							<div class="input-group justify-content-center mb-5 col-md-8">
								<span class="input-group-text hanna" id="drug_identification">식별표시
									: <input style="text-align: center;" name="drug_identification"
									type="text" class="form-control ms-3" placeholder="약에 등록된 식별표시"
									aria-label="Username">
								</span>
							</div>
						</form>


						<span style='margin-bottom: 50px'> <label class=form-label>전면
								/ 좌측 좌측 색깔 선택</label> <select name="drug_color_F"
							class="mb-5 mx-5 hanna">

								<option value="하양">하양</option>
								<option value="노랑">노랑</option>
								<option value="주황">주황</option>
								<option value="분홍">분홍</option>
								<option value="빨강">빨강</option>
								<option value="갈색">갈색</option>
								<option value="연두">연두</option>
								<option value="초록">초록</option>
								<option value="청록">청록</option>
								<option value="파랑">파랑</option>
								<option value="남색">남색</option>
								<option value="자주">자주</option>
								<option value="보라">보라</option>
								<option value="회색">회색</option>
								<option value="검정">검정</option>
								<option value="전체" selected="selected">전체</option>

						</select> 후면 / 우측 색깔 선택 : <select name="drug_color_B"
							class="mb-5 mx-5 hanna">
								<option value="없음" selected="selected">전면과 동일</option>
								<option value="하양">하양</option>
								<option value="노랑">노랑</option>
								<option value="주황">주황</option>
								<option value="분홍">분홍</option>
								<option value="빨강">빨강</option>
								<option value="갈색">갈색</option>
								<option value="연두">연두</option>
								<option value="초록">초록</option>
								<option value="청록">청록</option>
								<option value="파랑">파랑</option>
								<option value="남색">남색</option>
								<option value="자주">자주</option>
								<option value="보라">보라</option>
								<option value="회색">회색</option>
								<option value="검정">검정</option>
								<option value="투명">투명</option>
								<option value="전체">전체</option>


						</select>
							</p>
						</span>
						<p>
							<span style='margin-bottom: 50px' class="mb-5 me-5"> 모양 선택
								: <select class="mb-5 mx-5 hanna" name="drug_shape">
									<option value="원형">"원형"</option>
									<option value="타원형">"타원형"</option>
									<option value="장방형">"장방형"</option>
									<option value="반원형">"반원형"</option>
									<option value="삼각형">"삼각형"</option>
									<option value="사각형">"사각형"</option>
									<option value="마름모형">"마름모형"</option>
									<option value="오각형">"오각형"</option>
									<option value="육각형">"육각형"</option>
									<option value="팔각형">"팔각형"</option>
									<option value="기타">"기타"</option>
									<option value="전체" selected="selected">"전체"</option>
							</select> 제형 선택 : <select name="drug_formulation" class="mb-5 mx-5 hanna">
									<option value="정제">"정제"</option>
									<option value="경질캡슐">"경질캡슐"</option>
									<option value="연질캡슐">"연질캡슐"</option>
									<option value="기타">"기타"</option>
									<option value="전체" selected="selected">"전체"</option>
							</select>
						</p>
						<p>

							</span> <span style='margin-bottom: 50px'> 분할선 선택 : <select
								name="drug_split_line_F">
									<option value="없음">"전 후 둘 분할선 없음"</option>
									<option value="+">"전 후 중 (+)형 "</option>
									<option value="-">"전 후 중 (-)형"</option>
									<option value="기타">"전 후 중 기타 분리선 "</option>
									<option value="전체">"전체"</option>
							</select> 후면 분할선 선택 : <select name="drug_split_line_B">
									<option value="없음">"없음"</option>
									<option value="+형">"(+)형"</option>
									<option value="(-)형">"(-)형"</option>
									<option value="전체">"전체"</option>
							</select>
							</span>
						</p>
						<div style="padding-left: 90px; padding-right: 90px;">


							<input type="submit" value="검색" style="width: 400px"
								class="btn btn-secondary btn-group-sm hanna" />

						</div>
					</div>
					</form> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="card col-7 mt-2">
						<div class="card-body">
						
							<div class="col-8 form-holder">
								<div class="form-content">
									<input class="form-control text-center  mt-5 mb-3 hanna"
										type="text" style="background-color: transparent;"
										value="약품 정보란" aria-label="readonly input example" readonly>
										
										
									<div class="form-items"
										style="text-align: center; background-color: white;">
										<p class="text-center mb-5 hanna">모양으로 약품 검색</p>
										<form method="get" action="shapeSearch" id="shapeSearchform">

											<div class="input-group justify-content-center mb-5">
												<span class="input-group-text hanna"
													id="drug_identification">식별표시 : <input
													style="text-align: center;" name="drug_identification"
													type="text" class="form-control hanna"
													placeholder="약에 등록된 식별표시" aria-label="Username"
													aria-describedby="basic-addon1">
												</span>
											</div>


											<span style='margin-bottom: 50px'>
												<p style="font-size: 15px">
													전면 / 좌측 좌측 색깔 선택 : <select name="drug_color_F"
														class="mb-5 mx-5 hanna">

														<option value="하양">하양</option>
														<option value="노랑">노랑</option>
														<option value="주황">주황</option>
														<option value="분홍">분홍</option>
														<option value="빨강">빨강</option>
														<option value="갈색">갈색</option>
														<option value="연두">연두</option>
														<option value="초록">초록</option>
														<option value="청록">청록</option>
														<option value="파랑">파랑</option>
														<option value="남색">남색</option>
														<option value="자주">자주</option>
														<option value="보라">보라</option>
														<option value="회색">회색</option>
														<option value="검정">검정</option>
														<option value="전체" selected="selected">전체</option>

													</select> 후면 / 우측 색깔 선택 : <select name="drug_color_B"
														class="mb-5 mx-5 hanna">
														<option value="없음" selected="selected">전면과 동일</option>
														<option value="하양">하양</option>
														<option value="노랑">노랑</option>
														<option value="주황">주황</option>
														<option value="분홍">분홍</option>
														<option value="빨강">빨강</option>
														<option value="갈색">갈색</option>
														<option value="연두">연두</option>
														<option value="초록">초록</option>
														<option value="청록">청록</option>
														<option value="파랑">파랑</option>
														<option value="남색">남색</option>
														<option value="자주">자주</option>
														<option value="보라">보라</option>
														<option value="회색">회색</option>
														<option value="검정">검정</option>
														<option value="투명">투명</option>
														<option value="전체">전체</option>


													</select>
												</p>
											</span>
											<p>
												<span style='margin-bottom: 50px' class="mb-5 me-5">
													모양 선택 : <select class="mb-5 mx-5 hanna" name="drug_shape">
														<option value="원형">"원형"</option>
														<option value="타원형">"타원형"</option>
														<option value="장방형">"장방형"</option>
														<option value="반원형">"반원형"</option>
														<option value="삼각형">"삼각형"</option>
														<option value="사각형">"사각형"</option>
														<option value="마름모형">"마름모형"</option>
														<option value="오각형">"오각형"</option>
														<option value="육각형">"육각형"</option>
														<option value="팔각형">"팔각형"</option>
														<option value="기타">"기타"</option>
														<option value="전체" selected="selected">"전체"</option>
												</select> 제형 선택 : <select name="drug_formulation"
													class="mb-5 mx-5 hanna">
														<option value="정제">"정제"</option>
														<option value="경질캡슐">"경질캡슐"</option>
														<option value="연질캡슐">"연질캡슐"</option>
														<option value="기타">"기타"</option>
														<option value="전체" selected="selected">"전체"</option>
												</select>
											</p>
											<p>

												</span> <span style='margin-bottom: 50px'> 분할선 선택 : <select
													name="drug_split_line_F">
														<option value="없음">"전 후 둘 분할선 없음"</option>
														<option value="+">"전 후 중 (+)형 "</option>
														<option value="-">"전 후 중 (-)형"</option>
														<option value="기타">"전 후 중 기타 분리선 "</option>
														<option value="전체">"전체"</option>
												</select> 후면 분할선 선택 : <select name="drug_split_line_B">
														<option value="없음">"없음"</option>
														<option value="+형">"(+)형"</option>
														<option value="(-)형">"(-)형"</option>
														<option value="전체">"전체"</option>
												</select>
												</span>
											</p>
											<div style="padding-left: 90px; padding-right: 90px;">


												<input type="submit" value="검색" style="width: 400px"
													class="btn btn-secondary btn-group-sm hanna" />

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
	<!-- 컨텐츠 영역 끝 -->

</div>

<!-- 
<div class="col-10 flex-column">
	<div class="hboard pt-2 ps-3 pe-3 pb-3">
		안 쪽에 자신의 컨텐츠를 넣어주세요
		<div style="text-align: center;">
			<span> <a class="btn btn-light hanna" href="drugList"
				style="margin-right: 40px">약품 리스트</a> <a class="btn btn-light hanna"
				href="drugSearchImg" style="margin-right: 40px">이미지 약품조회</a> <a
				class="btn btn-light hanna" href="drugMyCase" style="margin-right: 40px">나의
					의약품케이스</a> <a class="btn btn-light hanna" href="drugSearchHistory"
				style="margin-right: 40px">약품 검색 기록</a>

			</span>
		</div>

		<article>
			<div class="container">
				<div class="form-body row justify-content-center ">
					<div class="row">
						<div class="card col-4 mt-2" style="width: 18rem;">
							<img src="kimsungwook/loadimg/drugimgeSearch.jpg"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title hanna">약품 이미지 분석</h5>
								<p class="card-text hanna">사진 한장으로 약을 찾아보세요.</p>
								<a href="drugSearchImg" class="btn btn-secondary">약품 이미지 분석</a>
							</div>
						</div>
						
						
				</div>
			</div>
	</div>
</div>
컨텐츠 영역 끝

</article>
 -->