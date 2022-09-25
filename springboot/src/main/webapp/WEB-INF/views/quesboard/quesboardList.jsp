<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

.searchForm .searchBtn {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}

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

.qacard {
	border: solid 1px #3478f5;
}

.card-header {
	border: 0;
}
</style>

<div class="container-fluid">
	<div class="row justify-content-around">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 -->
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
						href="#">모든 약국</a></li>
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
		</div>
		<!-- 카테고리 영역 끝 -->

		<!-- 컨텐츠 (연회색배경) -->
		<div class="col-10 flex-column">
			<div class="hboard pt-2 ps-3 pe-3 pb-3">

				<h3 class="hanna p-5" style="text-align: center;">
					의료 지식인 보드
					</h5>
					<div class="d-flex justify-content-around">
						<div class="input-group searchForm m-3 w-50" style="margin: auto;">
							<button class="btn btn-outline-secondary dropdown-toggle"
								type="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="border: solid 1px #3478f5; border-radius: 16px 0 0 16px; background: #3478f5; color: white;">카테고리</button>
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
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">질문 작성 </h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control"
											id="exampleFormControlInput1">
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">질문내용</label>
										<textarea class="form-control"
											id="exampleFormControlTextarea1" rows="3"></textarea>
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary">글쓰기</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									
								</div>
							</div>
						</div>
					</div>
					<div class="card qacard mb-3" style="width: 80%; margin: auto;">
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">Q</span>
							질문 제목
						</h5>
						<div class="card-body col-10 ">
							<p class="card-text">With supporting text below as a natural
								lead-in to additional content.</p>

						</div>
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">A</span>
							답변 제목
						</h5>
						<div class="card-body row">
							<div class="col-10">
								<h5 class="card-title">진료과 의사 이름</h5>
								<p class="card-text">
									답변내용 <br>With supporting text below as a natural lead-in
									to additional content.
								</p>
							</div>

							<div class="col-2">
								<img src="/taejin/img/doc3.svg">
							</div>

						</div>
					</div>
					<div class="card qacard" style="width: 80%; margin: auto;">
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">Q</span>
							질문 제목
						</h5>
						<div class="card-body col-10 ">
							<p class="card-text">With supporting text below as a natural
								lead-in to additional content.</p>

						</div>
						<h5 class="card-header">
							<span class="hanna" style="color: #3478f5; font-size: 32px;">A</span>

						</h5>
						<div class="card-body row">
							<div class="col-10">
								<label class="text-muted">아직 답변이 되지 않았습니다</label>
								<textarea class="form-control formInput2"
									id="exampleFormControlTextarea1" rows="3"></textarea>
							</div>

							<div class="col-2 d-flex flex-column justify-content-center">
								<button class="btn bg-primary m-3 text-white hanna">답변하기
								</button>
							</div>
						</div>
						<div class="card-body col-10 ">
							<p class="card-text"></p>

						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</div>



<%-- <style>
a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}

#datatablesSimple a {
	text-decoration: none;
	color: black;
}

table tbody tr {
	cursor: pointer;
}

table tfoot ol.paging {
	margin-left: 30%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
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
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>

<div class="container">
	<article>
	<header>
		<h1>의학지식인</h1>
	</header>
	<div class="panel">
    <div class="panel-body">
        <div class="btns" style="text-align: center;">
        <h4>질문 카테고리</h4>
        <c:forEach var="e" items="${qcate }" varStatus="status">
           <input type="button" name="hbtn${status.index}" value="${e.qcate }" class="qcatebtn btn btn-outline-primary"/>
			<c:choose>
				<c:when test="${status.index == 8}">
		           <p style="margin: 5px;"></p>				
				</c:when>
			</c:choose>
        </c:forEach>
        </div><br>
    </div> 
	</div> 

<table class="table1 table table-hover" style="text-align: center;">
	<thead>
		<tr>
			<th width="50px;">No.</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>ID</th>
			<th>조회수</th>
			<th>작성날짜</th>
		</tr>
	</thead>
	<tbody>
		for start
		<c:forEach var="e" items="${list}">
			<tr>
				<td class="linktd">${e.r_num}</td>
				<td class="linktd">${e.qcate}</td>
				<td class="linktd">${e.qtitle}</td>
				<td class="linktd">${e.id}</td>
				<td class="linktd">${e.qhit}</td>
				<td class="linktd">${e.qdate}</td>
				<td class="linktd" hidden="hidden"><a href="qbDetail?qnum=${e.qnum}"></a></td>
				<!-- link를 걸면 조회수 업데이트 되는 실행이 두 번 작용해서 hidden으로 숨김  -->
			</tr>
		</c:forEach>
		for end
	</tbody>
<tfoot>
<tr>
<td colspan="5">
<ol class="paging">
	<c:choose>
		<c:when test="${startPage < 6 }">
			<li class="disable">이전으로</li>
		</c:when>
		<c:otherwise>
			<li><a
				href="qbList?cPage=${startPage-1}&category=${category}&search=${search}">이전으로</a></li>
		</c:otherwise>
	</c:choose>
	<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
		step="1">
		<c:choose>
			<c:when test="${i.index == nowPage}">
				<li class="now">${i.index }</li>
			</c:when>
			<c:otherwise>
				<li><a
					href="qbList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage >= totalPage}">
			<li class="disable">다음으로</li>
		</c:when>
		<c:when test="${totalPage > (nowPage+pagePerBlock)}">
			<li>
			<li><a
				href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
		</c:when>
		<c:otherwise>
			<li>
			<li><a
				href="qbList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
		</c:otherwise>
	</c:choose>
</ol>
</td>
</tr>
<tr>
<td colspan="5">
<form class="sForm" name="sForm" method="get" action="qbList">
<input type="hidden" name="searchreset" value="1">
	<select name="category" id="category">
		<option value="qtitle">제목</option>
		<option value="qcont">내용</option>
		<option value="id">작성자</option>
		<option value="qcate" hidden="hidden" id="qcate">카테고리</option>
		<option value="all">제목+내용+작성자</option>
	</select> 
	<input type="text" name="search" id="qsearch">
    <input type="submit" id="searBtn" value="조회">
</form>
<p style="margin: 5px;"></p>	
<c:if test="${sessionID != null}">
	<input type="button" value="질문하기" id="writeBtn" class="btn btn-primary" >
</c:if>

</td>
</tr>

</tfoot>
</table>

</article>
</div>

	 --%>
<!-- 이전 jquery 임포트 코드 ...!!!  .linktd function 이 작동하기 위해서 있어야 됨   -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var chk;
	$(function() {
		$('.linktd').click(
				function() {
					var href = $(this).parent("tr").children("td")
							.children("a").attr("href")
					// 		alert(href);
					window.location = href;
				});

		$('#writeBtn').click(function() {
			location = "qbForm";
		});

		$('.qcatebtn').click(function() {
			var qcatename = $(this).val();
			$("#qcate").attr("selected", "selected");
			$("#qsearch").val(qcatename);
			$(".sForm").submit();
		});
	});

	// 	$('.table1').on('click','tr',function(){
	// 		chk=(this).children('#check').text();
	// 		chk1 = window.location.pathname;
	// 		console.log('chk => ' + chk);
	// 		console.log('path => ' + chk1);
	// 		console.log('chk => ' + chk);
	// 		$.ajax({
	// 			url:'test?chk1='+chk1,
	// 			success : function(){
	// 			}
	// 		})
	// 	})
