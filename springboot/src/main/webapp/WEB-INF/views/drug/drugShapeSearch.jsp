<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="text-align: center;">
	<span>
		<p>
			<a href="drugList" style="margin-right: 40px">약품리스트</a> <a href="drugSearchImg"
				style="margin-right: 40px">이미지로약품조회</a> <a href="drugMyCase"
				style="margin-right: 40px">나의의약품케이스</a> <a href="drugSearchHistory"
				style="margin-right: 40px">약품검색기록</a>
		</p>
	</span>
</div>

<article>
	<div class="container">
		<div class="form-body row justify-content-center ">
			<div class="row">
				<div class="form-holder">
					<div class="form-content">
						<div class="form-items  " style="text-align: center;">
							<h4 class="mt-3 mb-3 text-center">약품 정보란</h4>

							<p class="text-center mb-5">모양으로 약품 검색</p>
							<form method="get" action="shapeSearch" id="shapeSearchform">

								<div class="input-group justify-content-center mb-3">
									<span class="input-group-text" id="drug_identification">식별표시
										: <input style="text-align: center;"
										name="drug_identification" type="text" class="form-control"
										placeholder="약에 등록된 식별표시" aria-label="Username"
										aria-describedby="basic-addon1">
									</span>
								</div>


								<span style='margin-bottom: 50px'>
									<p style="font-size: 15px">
										전면 / 좌측 좌측 색깔 선택 : <select name="drug_color_F">

											<option value="하양" selected="selected">하양</option>
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

										</select> 후면 / 우측 색깔 선택 : <select name="drug_color_B">
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
									</p>
								</span>
								<p>
									<span style='margin-bottom: 50px'> 모양 선택 : <select
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
											<option value="전체">"전체"</option>
									</select> 제형 선택 : <select name="drug_formulation">
											<option value="정제">"정제"</option>
											<option value="경질캡슐">"경질캡슐"</option>
											<option value="연질캡슐">"연질캡슐"</option>
											<option value="기타">"기타"</option>
											<option value="전체">"전체"</option>
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
								<div 
									style="padding-left: 90px; padding-right: 90px;">


									<input type="submit" value="검색" style="width: 400px"
										class="btn btn-primary btn-group-sm " />

								</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</article>

