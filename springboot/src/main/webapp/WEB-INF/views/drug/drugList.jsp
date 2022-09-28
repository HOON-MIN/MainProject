<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Drug List</title>
</head>
<body>
	<article>
		<div class="col-10 flex-column" style="margin-left: 150px">
			<div class="hboard pt-2 ps-3 pe-3 pb-3 text-center">
				<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
				<div class="container-fluid" style="margin-left: 50px">
					<div class="row">
						<div class="col-8">

							<h1 class="hanna" style="text-align: center;">
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
										<div>검색된 결과입니다. 찾으시는 약품과 유사한 결과를 선택하세요</div>
									</c:when>
									<c:when test="${plmn eq 'shapeSearch'}">
										<p style="background-color: aqua;">모양 검색 결과</p>
									</c:when>
								</c:choose>
							</h1>
							<!-- Example single danger button -->
						</div>
						<div class="col-4 " style="border-color: white;">
							<div class="btn-group ms-3 ">
								<button type="button" class="btn btn-light dropdown-toggle"
									data-bs-toggle="dropdown" aria-expanded="false">이동</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="drugSearchShape">모양으로
											약품찾기 </a></li>
									<li><a class="dropdown-item" href="drugSearchImg">이미지로
											검색하기 </a></li>
									<li><a class="dropdown-item" href="drugSearchHistory">약품검색
											기록 </a></li>
									<li><a class="dropdown-item" href="drugMyCase">나의 약품
											케이스 </a></li>
									<li><a class="dropdown-item" href="drugList">전체리스트보기 </a></li>
									<!-- <li><a class="dropdown-item" href="#">조회순</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">검색</a></li> -->
								</ul>
							</div>
						</div>
					</div>


					<!-- 		<ul class="list-unstyled">
			<li class="border-top my-3"></li>
		</ul> -->

					<div class="row">
						<div class="col" style="margin-left: 300px">

							<table class="text-center table-light table-striped"
								style="width: 70%">
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
										<tr class="align-middle">

											<td><a href="drugDetail?drugIdx=${e.drug_idx}"><img
													style="width: 380px" height="250px"
													src="kimsungwook/imgfile/${e.drug_img}" id="imgname"
													value="imgname"></a></td>
											<td>${e.drug_name}</td>
											<%-- <td>${e.content}</td> --%>
											<td>${e.drug_formulation}</td>
											<td>${e.drug_component}</td>
											<td>${e.drug_company}<span class="float-end"> <c:choose>
														<c:when
															test="${plmn eq 'totaldruglist' or plmn eq 'drugSearchList' or plmn eq 'shapeSearch' or plmn eq 'drugImageSearchList' }">
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
													<button class="btn btn-primary ms-3" type="button"
														onclick="location='insertDrugSearchHistory?drugIdx=${e.drug_idx}'">상세보기</button>
											</span>


											</td>


										</tr>
									</c:forEach>
									<%-- for end --%>
								</tbody>

							</table>

							<!-- 페이지 네이션 -->
							<ul class="pagination justify-content-center p-3">

								<c:choose>
									<c:when test="${plmn eq 'totaldruglist' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="drugList?dPage=${startPage -1 }">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="drugList?dPage=${i.index }">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="drugList?dPage=${endPage + 1 }">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="drugList?dPage=${endPage + 1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${plmn eq 'drugMyCaseList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="drugMyCase?dPage=${startPage -1 }">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage }"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="drugMyCase?dPage=${i.index }">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="drugMyCase?dPage=${endPage + 1 }">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="drugMyCase?dPage=${endPage + 1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${plmn eq 'drugSearchList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="drugSearchList?dPage=${startPage -1 }&content=${content}&searchSelect=${searchSelect}">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="drugSearchList?dPage=${startPage -1 }&content=${content}&searchSelect=${searchSelect}">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="drugSearchList?dPage=${startPage -1 }&content=${content}&searchSelect=${searchSelect}">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="drugSearchList?dPage=${startPage -1 }&content=${content}&searchSelect=${searchSelect}">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>


									<c:when test="${plmn eq 'drugImageSearchList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="drugImageSearch?dPage=${startPage -1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="drugImageSearch?dPage=${startPage -1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="drugImageSearch?dPage=${startPage -1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="drugImageSearch?dPage=${startPage -1 }&drugShapeExtractResult=${drugShapeExtractResult}&drugColorExtractResult=${drugColorExtractResult}&identificationCharResult=${identificationCharResult}">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>



									<c:when test="${plmn eq 'shapeSearch' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="shapeSearch?dPage=${startPage -1 }&drug_identification=${drug_identification}&drug_color_F=${drug_color_F}&drug_color_B=${drug_color_B}&drug_shape=${drug_shape}&drug_formulation=${drug_formulation}">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="shapeSearch?dPage=${startPage -1 }&drug_identification=${drug_identification}&drug_color_F=${drug_color_F}&drug_color_B=${drug_color_B}&drug_shape=${drug_shape}&drug_formulation=${drug_formulation}">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="shapeSearch?dPage=${startPage -1 }&drug_identification=${drug_identification}&drug_color_F=${drug_color_F}&drug_color_B=${drug_color_B}&drug_shape=${drug_shape}&drug_formulation=${drug_formulation}">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="shapeSearch?dPage=${startPage -1 }&drug_identification=${drug_identification}&drug_color_F=${drug_color_F}&drug_color_B=${drug_color_B}&drug_shape=${drug_shape}&drug_formulation=${drug_formulation}">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>

									<c:when test="${plmn eq 'drugSearchHistoryList' }">
										<c:choose>
											<c:when test="${startPage < 6  }">
												<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
												<!-- <li class="disable">이전으로</li> -->
											</c:when>
											<c:otherwise>
												<%-- <li><a href="drugList?dPage=${startPage -1 }">이전으로</a></li> --%>

												<li class="page-item"><a class="page-link"
													href="drugSearchHistory?dPage=${startPage -1 }">Previous</a></li>
											</c:otherwise>
										</c:choose>
										<!-- i.index 사용해서 페이징의 인덱스가 유지 -->
										<c:forEach varStatus="i" begin="${startPage}"
											end="${endPage }" step="1">
											<c:choose>
												<c:when test="${i.index == nowPage }">
													<li class="page-item now"><a class="page-link"
														style="background: #3478F5; color: white;""">${i.index }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="drugSearchHistory?dPage=${startPage -1 }">${i.index}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:choose>
											<c:when test="${endPage >= totalPage}">
												<li class="page-item disabled"><a class="page-link"
													aria-disabled="true">Next</a></li>
											</c:when>


											<c:when test="${totalPage > (nowPage+pagePerBlock)}">
												<li>
												<li class="page-item"><a class="page-link"
													href="drugSearchHistory?dPage=${startPage -1 }">Next</a></li>
											</c:when>

											<c:otherwise>
												<li>
												<li class="page-item"><a class="page-link"
													href="drugSearchHistory?dPage=${startPage -1 }">Next</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>




								</c:choose>
							</ul>
							<!-- -- -->

							<form action="drugSearchList" id="drugSearchTag" method="get">

								<span style="text-align: center">
									<p style="font-size: 15px; margin-bottom: 0px">
										전체 리스트 검색 선택 <select name="searchSelect">
											<option value="searchName" selected>이름 검색</option>
											<option value="searchComponent">성분 검색</option>
											<option value="searchCompany">제조사 검색</option>
										</select> <input type="text" style="width: 400px" id="contentSearchID"
											name="content" maxlength="300" placeholder="검색할 내용을 입력하세요 "
											required> <input type="submit" value="검색"
											id="drugSearchSubmitBtn" class="btn btn-primary" />

										<button type="button" class="btn btn-primary ml-2"
											id="listbtn" onclick="location='drugList'">전체리스트보기</button>
									</p>
								</span>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</article>



</body>
</html>