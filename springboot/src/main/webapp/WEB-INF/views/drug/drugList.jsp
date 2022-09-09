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
	margin-left: 25%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
	background-color: #42484a;
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

.now {
	padding: 3px 7px;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
<article>
	<header>
		<h1 style="text-align: center;">
			검색 결과
			<!-- Example single danger button -->
			<div class="btn-group ms-3 float-end">
				<button type="button" class="btn btn-success dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">이동</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="drugSearchShape">모양으로 약품찾기
					</a></li>
					<li><a class="dropdown-item"
						href="">이미지로 검색하기
					</a></li>
					<li><a class="dropdown-item"
						href="">나의 약품 케이스
					</a></li>
					<li><a class="dropdown-item"
						href="drugList">전체리스트보기
					</a></li>
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
						
						<td><a href="drugDetail?drugIdx=${e.drug_idx}"><img style="width: 80px"; height="80px"
				src="${pageContext.request.contextPath}/resources/imgfile/${e.drug_img}"
				id="imgname" value="imgname"></a></td>
						<td>${e.drug_name}</td>
						<%-- <td>${e.content}</td> --%>
						<td>${e.drug_formulation}</td>
						<td>${e.drug_component}
						<td>${e.drug_company}
								<span class="float-end"><button class="btn btn-primary"
										type="button" onclick="location='myDrugCase?drugIdx=${e.drug_idx}'">담기</button>
									<button class="btn btn-primary" type="button"
										onclick="location='drugDetail?drugIdx=${e.drug_idx}'">상세보기</button> </span>
							

						</td>
					</tr>
				</c:forEach>
				<%-- for end --%>
			</tbody>
			<tfoot>
				<tr class="text-center">
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
									<c:forEach varStatus="i" begin="${startPage }"
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
								<c:when test="${plmn eq 'mySuggestionBox' }">
									<c:choose>
										<c:when test="${startPage < 6  }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="mySuggestionBox?cPage=${startPage -1 }">이전으로</a></li>
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
												<li><a href="mySuggestionBox?cPage=${i.index }">${i.index }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endPage >= totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a href="mySuggestionBox?cPage=${endPage + 1 }">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${plmn eq 'contentSearch' }">
									<c:choose>
										<c:when test="${startPage < 6  }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="contentSearch?cPage=${startPage -1 }&content=${content}&seacrchSelect=${seacrchSelect}">이전으로</a></li>
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
												<li><a
													href="contentSearch?cPage=${i.index }&content=${content}&seacrchSelect=${seacrchSelect}">${i.index }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endPage >= totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="contentSearch?cPage=${endPage + 1 }&content=${content}&seacrchSelect=${seacrchSelect}">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>

							</c:choose>
						</ol>						
					</td>
				</tr>
				<tr>
					<th colspan="6">
						<form action="drugSearch" id="drugSearchTag" method="get">

							<span>
								<p style="font-size: 15px;margin-bottom: 0px">검색 선택 
								<select name="seacrchSelect">
									<option value ="selectedName" selected>이름 검색</option>
									<option value ="selectedCompnent">성분 검색</option>
									<option value ="selectedCompany">제조사 검색</option>
								</select>
								</p>
							</span>


							<textarea id="contentSearchID" name="content" cols="80" rows="1"
								placeholder="검색할 내용을 입력하세요 " required></textarea>
							<input type="submit" value="검색" id="ccbSubmitBtn"
								class="btn btn-primary float-end" />


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