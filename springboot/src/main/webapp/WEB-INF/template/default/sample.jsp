<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이지 기본 틀  -->
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
	margin-right : 40px;
}

.formInput2 {
	margin-top: 40px;
} 

</style>

<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 (이쪽 세션 처리 하셔야합니다)-->
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->

			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<li class=" nav-item pt-5 pb-2 ps-4"><a
						class="hcateAllbtn nav-link active text-white" aria-current="page"
						href="#">카테고리 리스트</a></li>
					<!-- 이안에 본인 카테고리 나눠주세요 -->
					<%-- 	<c:forEach var="e" items="${hcate }" varStatus="status">
						
						<li class=" nav-item pt-2 pb-2 ps-4" value="${e.hcate }" 
							name="hbtn${status.index}"
							><a 
							class="hcatebtn nav-link text-white" href="#">${e.hcate }</a></li>
						<input type="button" name="hbtn${status.index}"
							value="${e.hcate }" class="hcatebtn btn btn-outline-primary" />
					</c:forEach> --%>
				</ul>
			</div>
			<!-- 카테고리 리스트 끝 -->
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">
				<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->

			</div>
		</div>
		<!-- 컨텐츠 영역 끝 -->
	</div>
</div>



	<!-- 테이블(게시판) -->
	<!-- 스타일
	.htable {
		width: 100%;
	}
	
	.htable thead {
		height: 40px;
		color: grey;
	}
	
	.htable th {
		font-weight: lighter;
		padding-left: 12px;
	}
	
	.htable tbody {
		border-collapse: collapse;
		border-radius: 16px;
		box-shadow: 0px 0px 8px #ababab;
	}
	
	.htable td {
		padding: 14px 12px;
		font-size: 14px;
	}
	
	.htable td>a {
		color: #232323;
		font-weight: bold;
	}
 -->
	<%-- 
<table class="htable mb-3" style="cursor: pointer;">
	<thead>
		<tr>
			<th class="hanna ps-3"></th>
			<th class="hanna ps-3">약국명</th>
			<th class="hanna ps-3">전화번호</th>
			<th class="hanna ps-3">주소</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${list }">
			<tr>
				<td>${e.pnum }</td>
				<td class="nanum"><a
					href="${pageContext.request.contextPath}/pharmacy/ShopDetail?pnum=${e.pnum}">
						${e.pname } </a></td>

				<td>${e.ptel }</td>
				<td>${e.ploc }</td>
			</tr>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
	</tfoot>
	
</table> --%>




	<!-- 페이지네이션(부트스트랩 그대로 만진게 없음) -->
	<%-- HTML 
<ul class="pagination justify-content-center mt-5 mb-5">
		<c:choose>
			<c:when test="${startPage < 6 }">
				<li class="page-item disabled"><a class="page-link"
					href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
				<!-- 	<li class="disable">이전으로</li> -->
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="hospitalList?cPage=${startPage-1}&category=${category}&search=${search}">Previous</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
		<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
		<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

		<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
			step="1">
			<c:choose>
				<c:when test="${i.index == nowPage}">
					<li class="page-item now"><a class="page-link"
						style="background: #3478F5; color: white;">${i.index }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="hospitalList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
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
					href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
			</c:when>
			<c:otherwise>
				<li>
				<li class="page-item"><a class="page-link"
					href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
			</c:otherwise>
		</c:choose>
</ul>
--%>



	<!-- 카테고리 없는 검색 폼  -->

	<!-- 스타일
.searchForm input {
	border: solid 1px #3478f5;
	border-radius: 16px 0 0 16px;
	background-color:
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}

 -->

	<!-- HTML
<form class="sForm m-3" name="sForm" method="get" action="hospitalList"
	style="width: 400px;">
						###
	<input type="hidden" name="category" id="category" value="all">
	<input type="hidden" name="searchreset" value="1" hidden="hidden">
	<div class="input-group searchForm mb-3">
		<input type="text" class="form-control" id="hsearch"
			aria-label="Recipient's username" name="search"
			aria-describedby="hospitalSearch">
		<button type="submit" class="btn" name="searBtn" id="searBtn">
			<img alt="검색아이콘" src="/img/search.png">
		</button>
	</div>
</form>
-->


	<!-- 카테고리 있는 검색 폼 -->

	<!-- 스타일
.searchForm input {
	border: solid 1px #3478f5;
	border-radius: 16px 0 0 16px;
	background-color:
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}
-->

	<!-- HTML
	<div class="input-group searchForm m-3 w-50" style="margin: auto;">
		<button class="btn btn-outline-secondary dropdown-toggle"
			type="button" data-bs-toggle="dropdown" aria-expanded="false"
			style="border: solid 1px #3478f5; border-radius: 16px 0 0 16px; background: #3478f5; color: white; width:100px;">카테고리</button>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="#">Action</a></li>
			<li><a class="dropdown-item" href="#">Another action</a></li>
			<li><a class="dropdown-item" href="#">Something else
					here</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><a class="dropdown-item" href="#">Separated link</a></li>
		</ul>
		<input type="text" class="form-control col-lg-5">
		<button type="submit" class="btn searchBtn" name="searBtn"
			id="searBtn">
			<img alt="검색아이콘" src="/img/search.png">
		</button>
	</div>
-->


	<!-- 지도(핵심기능) 있는 상세페이지 -->

	<!-- HTML	
<div style="height: 80%;">
	<h3 class="hanna ps-3">약국 상세페이지</h3>
	<div class="row hDetail justify-content-around" style="height: 100%">
		<div class="col-5 map"
			style="background-color: white; border-radius: 8px;">
			<div id="map_div" class="mt-3" style="border-radius: 8px;"></div>
			<div class="map_act_btn_wrap clear_box"></div>
			<div>이쪽에 이름 넣고해도 되고 편하신대로 지도를 늘려도 되고</div>
		</div>
		<div class="col-6 map align-items-center ">
			<h1 class="hanna m-3">약국 이름</h1>

			<h5 class="nanum m-3 pt-3">약국 주소</h5>

			<h6 class="m-3">약국 URL</h6>
			<h6 class="m-3">약국 오픈 시간</h6>

			<p class="m-3" style="height: 240px">약국 소개</p>
			<button class="btn btn-lg mt-4 ms-3 hanna"
				style="border: solid 1px #3478f5; background: #3478f5; color: white; width: 240px">만들
				버튼</button>

		</div>
	</div>
</div> 
-->



<!-- 작성 폼 -->
<!-- 스타일
.formTitle {
	margin-top: 40px;
	text-align: right;
}

.formInput {
	margin-top: 34px;
	margin-right : 40px;
}

.formInput2 {
	margin-top: 40px;
} 
-->


<!-- HTML
<div class="row justify-content-center">
	<h3 class="hanna text-center m-5">후기 작성</h3>
	<div class="col-2"">
		<ul class="nav flex-column">
			<li class=" nav-item hanna formTitle"><h5>제목</h5></li>
			<li class=" nav-item hanna formTitle"><h5>병원명</h5></li>
			<li class=" nav-item hanna formTitle"><h5>의사선생님</h5></li>
			<li class=" nav-item hanna formTitle"><h5>후기점수</h5></li>
			<li class=" nav-item hanna formTitle"><h5>후기내용</h5></li>
		</ul>
	</div>
	<div class="col-9">
		<form>
			<input type="text" name="hname" id="hname"
				class="form-control formInput " placeholder="병원명 입력하세요." /> <input
				type="text" name="hname" id="hname" class="form-control formInput"
				placeholder="병원명 입력하세요." /> <input type="text" name="hname"
				id="hname" class="form-control formInput" placeholder="병원명 입력하세요." />
			<select class="form-select formInput"
				aria-label="Default select example">
				<option selected>점수</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<div class="mb-3">
				<textarea class="form-control formInput2"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			<div class="d-flex justify-content-end">
				<button type="button" class="btn bg-primary text-white me-3">작성</button>
				<button type="button" class="btn bg-dark text-white me-3">뒤로가기</button>
			</div>

		</form>
	</div>
</div> 
-->