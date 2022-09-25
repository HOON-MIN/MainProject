<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Drug List</title>
<style>
a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}

/* paging */
table tfoot ol.paging {
	margin-left: 40%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
	background-color: #33CCFF;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #ffffff;
	color: #ffffff;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: white;
}

table tfoot ol li.now {
	padding: 3px 7px;
	background-color: #ffff00;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<article>
		<header>
			<h1 style="text-align: center;">
				<c:choose>
					<c:when test="${plmn eq 'totaldruglist' }">
					전체 약품 
					</c:when>
					<c:when test="${plmn eq 'drugMyCaseList' }">
					나의 의약품 케이스
					</c:when>
					<c:when test="${plmn eq 'drugSearchHistoryList' }">
					약품 검색기록 
					</c:when>
					<c:when test="${plmn eq 'drugSearchList' }">
					약품 검색 결과
					</c:when>
					<c:when test="${plmn eq 'drugImageSearchList' }">
					<h2>약품 이미지 검색 결과</h2>
					<div> 검색된 결과입니다. 찾으시는 약품과 유사한 결과를 선택하세요 </div> 
											
					</c:when>
				</c:choose>
				<!-- Example single danger button -->
				<div class="btn-group ms-3 float-end">
					<button type="button" class="btn btn-success dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">이동</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="drugSearchShape">모양으로
								약품찾기 </a></li>
						<li><a class="dropdown-item" href="drugSearchImg">이미지로 검색하기 </a></li>
						<li><a class="dropdown-item" href="drugSearchHistory">약품검색
								기록 </a></li>
						<li><a class="dropdown-item" href="drugMyCase">나의 약품 케이스
						</a></li>
						<li><a class="dropdown-item" href="drugList">전체리스트보기 </a></li>
						<!-- <li><a class="dropdown-item" href="#">조회순</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">검색</a></li> -->
					</ul>
				</div>
			</h1>
		</header>
		<ul class="list-unstyled">
			<li class="border-top my-3"></li>
		</ul>
		<div>
			<%-- 리팩토링 해야 함 --%>
			<table class="table table-bordered">
				<thead>
					<tr>

						<th>식별이미지</th>
						<th>제품명</th>
						<th>제형</th>
						<th>성분</th>
						<th>제조사</th>
					</tr>
				</thead>
				<tbody>
					<%-- for start --%>
					<c:forEach var="e" items="${list}">
						<tr>

							<td><a href="drugDetail?drugIdx=${e.drug_idx}"><img
									style="width: 150px" ; height="150px"
									src="kimsungwook/imgfile/${e.drug_img}" id="imgname"
									value="imgname"></a></td>
							<td>${e.drug_name}</td>
							<%-- <td>${e.content}</td> --%>
							<td>${e.drug_formulation}</td>
							<td>${e.drug_component}
							<td>${e.drug_company}<span class="float-end"> <c:choose>
										<c:when test="${plmn eq 'totaldruglist' or 'drugSearchList' }">
											<button class="btn btn-primary" type="button"
												onclick="location='insertMyDrugCase?drugIdx=${e.drug_idx}'">담기</button>
										</c:when>
										<c:when test="${plmn eq 'drugMyCaseList' }">
											<button class="btn btn-danger" type="button"
												onclick="location='deleteMyDrugCase?drugIdx=${e.drug_idx}'">삭제</button>
										</c:when>
										<c:when test="${plmn eq 'drugSearchHistoryList' }">
											<label>검색 일시 : ${e.drug_date}</label>
										</c:when>
										

									</c:choose>




									<button class="btn btn-primary" type="button"
										onclick="location='insertDrugSearchHistory?drugIdx=${e.drug_idx}'">상세보기</button>
							</span>


							</td>
						</tr>
					</c:forEach>
					<%-- for end --%>
				</tbody>
				<tfoot>
					<tr class="text-center ">
						<td colspan="6">
							<ol class="paging">
								<c:choose>
									<c:when test="${plmn eq 'totaldruglist' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="disable">이전으로</li>
											</c:when>
											<c:otherwise>
												<li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="now">${i.index }</li>
												</c:when>
												<c:otherwise>
													<li><a href="drugList?dPage=${i.index }">${i.index }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<c:otherwise>
												<li><a href="drugList?dPage=${endPage + 1 }">다음으로</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${plmn eq 'drugMyCaseList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="disable">이전으로</li>
											</c:when>
											<c:otherwise>
												<li><a href="drugMyCase?dPage=${startPage -1 }">이전으로</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage }"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="now">${i.index }</li>
												</c:when>
												<c:otherwise>
													<li><a href="drugMyCase?dPage=${i.index }">${i.index }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<c:otherwise>
												<li><a href="drugMyCase?dPage=${endPage + 1 }">다음으로</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${plmn eq 'drugSearchList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="disable">이전으로</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="drugSearchList?dPage=${startPage -1 }&content=${content}&searchSelect=${searchSelect}">이전으로</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage }"
											end="${endPage}" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="now">${i.index }</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="drugSearchList?dPage=${i.index }&content=${content}&searchSelect=${searchSelect}">${i.index }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="drugSearchList?dPage=${endPage + 1 }&content=${content}&searchSelect=${searchSelect}">다음으로</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									
									
									<c:when test="${plmn eq 'drugImageSearchList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="disable">이전으로</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="drugImageSearch?dPage=${startPage -1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">이전으로</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage }"
											end="${endPage}" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="now">${i.index }</li>
												</c:when>
												<c:otherwise>
													<li><a
														href="drugImageSearch?dPage=${i.index }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">${i.index }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPage }">
												<li class="disable">다음으로</li>
											</c:when>
											<c:otherwise>
												<li><a
													href="drugImageSearch?dPage=${endPage + 1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">다음으로</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>

								</c:choose>
							</ol>

						</td>
					</tr>
					<tr>
						<th colspan="6">
							<form action="drugSearchList" id="drugSearchTag" method="get">

								<span style="text-align: center">
									<p style="font-size: 15px; margin-bottom: 0px">
										검색 선택 <select name="searchSelect">
											<option value="searchName" selected>이름 검색</option>
											<option value="searchComponent">성분 검색</option>
											<option value="searchCompany">제조사 검색</option>
										</select> <input type="text" style="width: 400px" id="contentSearchID"
											name="content" maxlength="300" placeholder="검색할 내용을 입력하세요 "
											required>
										
										<input type="submit" value="검색" id="drugSearchSubmitBtn"
											class="btn btn-primary" />
										
										<button  type="button" class="btn btn-primary ml-2" id="listbtn"
											onclick="location='drugList'">전체리스트보기</button>
										
									</p>
									
								</span>






							</form>

						</th>
					</tr>
				</tfoot>

			</table>

			<%-- 리팩토링 !!!!!!!! --%>
		</div>

	</article>



</body>
</html>