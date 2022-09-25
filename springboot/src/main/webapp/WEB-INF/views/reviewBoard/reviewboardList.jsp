<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

a:link {
	text-decoration: none;
}

.card-header {
	padding-bottom: 0px;
}

.reviewScore {
	font-size: 14px;
	background-color: #3478f5;
	padding: 4px 12px;
	border-radius: 16px;
	color: white;
}

.flex-container {
	display: flex;
	flex-direction: row;
	justify-content: between;
	flex-wrap: wrap;
	width: 100%;
	min-width: 500px;
}

.flex-items {
	flex: auto;
	min-width: 110px;
	height: 50px;
	background: #999;
	border-radius: 2px;
	margin: 3px;
	　
}

#writeBtn {
	text-align: center
}

.card-header {
	padding-bottom: 0px;
}

.reviewScore {
	font-size: 14px;
	background-color: #3478f5;
	padding: 4px 12px;
	border-radius: 16px;
	color: white;
}

.flex-container {
	display: flex;
	flex-direction: row;
	justify-content: between;
	flex-wrap: wrap;
	width: 100%;
	min-width: 500px;
}

.flex-items {
	flex: auto;
	min-width: 110px;
	height: 50px;
	background: #999;
	border-radius: 2px;
	margin: 3px;
	　
}

#writeBtn {
	text-align: center
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
				<h3 class="hanna p-4" style="text-align: center;">리뷰 리스트</h3>
				<div class="d-flex justify-content-around">
					<div class="input-group searchForm m-3 w-50" style="margin: auto;">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-bs-toggle="dropdown" aria-expanded="false"
							style="border: solid 1px #3478f5; border-radius: 16px 0 0 16px; background: #3478f5; color: white; width: 100px">카테고리</button>
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
					<div>
						<button class="btn bg-primary m-3 text-white hanna"
							data-bs-toggle="modal" data-bs-target="#exampleModal">글쓰기</button>
					</div>
				</div>


				<div class="flex-container justify-content-center">


					<c:forEach var="e" items="${reviewlist}">
						<div class="card m-3" style="width: 18rem;">
							<div
								class="card-header bg-primary text-white p-1 d-flex align-items-center justify-content-between">
								<div class="navbar-brand   m-1 p-1">

									<img src="/taejin/img/doc1.svg" alt="" width="30" height="30"
										class="d-inline-block align-text-top"> <span
										class="ms-1">${e.id }</span>
								</div>
								<span class="me-1 mb-0 span"> <fmt:parseDate
										value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd" />
								</span>

							</div>
							<div class="card-body">
								<h5 class="card-title">${e.title }</h5>
								<p class="card-text">${e.cont }</p>
							</div>
							<div
								class="card-footer d-flex justify-content-between align-items-center">
								<span>${e.hname }</span> <span class="reviewScore">점수 :
									${e.likes}/10</span> <input type="hidden" value="${e.rnum}">
							</div>
						</div>
					</c:forEach>
				</div>
				<ul class="pagination justify-content-center mt-5 mb-5">
					<c:choose>
						<c:when test="${startPage < 6 }">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
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
			</div>
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
</div>
</div>



<%-- a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}
/* paging */
table tfoot ol.paging {
	margin-left: 30%;
	list-style: none;
}

 table tfoot ol.paging {
     margin-left:30%;
     list-style:none;
 }
 table tfoot ol.paging li {
     float:left;
     margin-right:8px;
 }
 table tfoot ol.paging li a {
     display:block;
     padding:3px 7px;
     border:1px solid #00B3DC;
     color:#2f313e;
     font-weight:bold;
 }
 table tfoot ol.paging li a:hover {
     background:#00B3DC;
     color:white;
     font-weight:bold;
 }
 .disable {
     padding:3px 7px;
     border:1px solid silver;
     color:silver;
 }
 .now {
     padding:3px 7px;
     border:1px solid #ff4aa5;
     background:#ff4aa5;
     color:white;
     font-weight:bold;
 }
 .card-header{
	padding-bottom : 0px;
 }
 
 .reviewScore{
font-size: 14px;
  background-color: #3478f5;
  padding: 4px 12px;
  border-radius: 16px;
  color: white;

 }
 

.flex-container{
    display: flex;
    flex-direction: row;
    justify-content : between;
    flex-wrap: wrap;
    width: 100%;
    min-width: 500px;
}

.flex-items{
   flex: auto;
   min-width:110px;
   height: 50px;
   background:#999;
   border-radius: 2px; 
   margin:3px;
　}
#writeBtn{
   text-align:center
}

</style>
<article>
<div class="container">
	<header class="text-center m-5" >
		<h2 style="color:white;">사용자 후기 게시판</h2>
	</header>

 					<div style="text-align: center;">
						<form name="sForm" method="post" action="reviewboardlist">
							<select name="search_option">
								<option value="id"
									<c:if test="${map.search_option == 'id'}">selected</c:if>>작성자</option>

								<option value="title"
									<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>

								<option value="cont"
									<c:if test="${map.search_option == 'cont'}">selected</c:if>>내용</option>

								<option value="hname"
									<c:if test="${map.search_option == 'hname'}">selected</c:if>>병원명</option>

								<option value="all"
									<c:if test="${map.search_option == 'all'}">selected</c:if>>작성자+내용+제목+병원명</option>

							</select> <input name="keyword" id="searchbar" value="${map.keyword}"> 
							<input type="submit" value="조회">
						</form>
					</div>
					<p></p>
					<p></p>
					
					<c:if test="${sessionNUM != null}">
					<div id = "writeBtn">
							<button class="btn btn-default" type="button" name="writeBtn" style="background-color:white">글작성</button>
					</div>
					</c:if>
<p></p>

<div class="flex-container justify-content-center">


 <c:forEach var="e" items="${reviewlist}">
	<div class="card m-3" style="width: 18rem;">
	  <div class="card-header bg-primary text-white p-1 d-flex align-items-center justify-content-between">
	  	<div class="navbar-brand   m-1 p-1">
	      
	      <img src="/taejin/img/doc1.svg" alt="" width="30" height="30" class="d-inline-block align-text-top">
	      <span class="ms-1">${e.id }</span>
	    </div>
	      <span class="me-1 mb-0 span">
		      <fmt:parseDate value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
			  <fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/>
		  </span>
	    
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">${e.title }</h5>
	    <p class="card-text">${e.cont } </p>
	  </div>
	  <div class="card-footer d-flex justify-content-between align-items-center">
	  	<span>${e.hname }</span> 
	  	<span class="reviewScore">점수 : ${e.likes}/10</span>
	  	<input type="hidden" value="${e.rnum}"> 
	  </div>
	</div>
 </c:forEach>
</div>
	</div>
	<p></p>
	<p></p>
	<script type="text/javascript">
		$(function() {
			$('#writeBtn').click(function() {
				location = "reviewupForm";
			});

		});
		
		$(window).ready(function(){
			var keyword = "${map.keyword}";
			$("#searchbar").val(keyword);
		});
	</script>
</article> --%>