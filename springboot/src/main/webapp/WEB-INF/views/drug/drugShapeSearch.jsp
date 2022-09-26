<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="text-align: center;">
	<span> <a class="btn btn-light" href="drugList"
		style="margin-right: 40px">약품 리스트</a> <a class="btn btn-light"
		href="drugSearchImg" style="margin-right: 40px">이미지 약품조회</a> <a
		class="btn btn-light" href="drugMyCase" style="margin-right: 40px">나의
			의약품케이스</a> <a class="btn btn-light" href="drugSearchHistory"
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
						<h5 class="card-title">약품 이미지 분석</h5>
						<p class="card-text">사진 한장으로 약을 찾아보세요.</p>
						<a href="drugSearchImg" class="btn btn-secondary">약품 이미지 분석</a>
					</div>
				</div>
				<div class="col-8 form-holder">
					<div class="form-content">
						<input class="form-control text-center  mt-5 mb-3" type="text"  style="background-color: transparent;"
							value="약품 정보란"
							aria-label="readonly input example" readonly>
						<div class="form-items" style="text-align: center; background-color: white;">
							<p class="text-center mb-5" style="background-color: aqua;">모양으로 약품 검색</p>
							<form method="get" action="shapeSearch" id="shapeSearchform">

								<div class="input-group justify-content-center mb-5">
									<span class="input-group-text" id="drug_identification">식별표시
										: <input style="text-align: center;"
										name="drug_identification" type="text" class="form-control"
										placeholder="약에 등록된 식별표시" aria-label="Username"
										aria-describedby="basic-addon1">
									</span>
								</div>


								<span style='margin-bottom: 50px' >
									<p style="font-size: 15px">
										전면 / 좌측 좌측 색깔 선택 : <select name="drug_color_F" class="mb-5 mx-5">

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

										</select> 후면 / 우측 색깔 선택 : <select name="drug_color_B" class="mb-5 mx-5">
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
									<span style='margin-bottom: 50px' class="mb-5 me-5"> 모양 선택 : <select class="mb-5 mx-5"
										name="drug_shape">
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
									</select> 제형 선택 : <select name="drug_formulation" class="mb-5 mx-5">
											<option value="정제">"정제"</option>
											<option value="경질캡슐">"경질캡슐"</option>
											<option value="연질캡슐">"연질캡슐"</option>
											<option value="기타">"기타"</option>
											<option value="전체" selected="selected">"전체"</option>
									</select>
								</p>
								<!-- <p>

									</span> <span style='margin-bottom: 50px'> 
									분할선 선택 : 
									<select name="drug_split_line_F">
											<option value="없음">"전 후 둘 분할선 없음"</option>
											<option value="+">"전 후 중 (+)형 "</option>
											<option value="-">"전 후 중 (-)형"</option>
											<option value="기타">"전 후 중 기타 분리선 "</option>
											<option value="전체">"전체"</option>
									</select> 
									후면 분할선 선택 : <select name="drug_split_line_B">
											<option value="없음">"없음"</option>
											<option value="+형">"(+)형"</option>
											<option value="(-)형">"(-)형"</option>
											<option value="전체">"전체"</option>
									</select>
									</span>
								</p> -->
								<div style="padding-left: 90px; padding-right: 90px;">


									<input type="submit" value="검색" style="width: 400px"
										class="btn btn-secondary btn-group-sm " />

								</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</article>

