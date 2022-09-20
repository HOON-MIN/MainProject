<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
		<%-- for start --%>
		<c:forEach var="e" items="${list}">
			<tr>
				<td class="linktd">${e.r_num}</td>
				<td class="linktd">${e.qcate}</td>
				<td class="linktd"><a href="qbDetail?qnum=${e.qnum}">${e.qtitle}</a></td>
				<td class="linktd">${e.id}</td>
				<td class="linktd" id="check">${e.qhit}</td>
				<td class="linktd">${e.qdate}</td>
			</tr>
		</c:forEach>
		<%-- for end --%>
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
<!-- 이전 jquery 임포트 코드 ...!!! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var chk;
$(function(){
	$('.linktd').click(function(){
		var href = $(this).parent("tr").children("td").children("a").attr("href")
// 		alert(href);
		window.location = href;
	});
	
	$('#writeBtn').click(function(){
		location ="qbForm";
	});
	
	$('.qcatebtn').click(function(){
    	var qcatename = $(this).val();
    	$("#qcate").attr("selected", "selected");
    	$("#qsearch").val(qcatename);
    	$(".sForm").submit();
    });
	
	
	$('.table1').on('click','tr',function(){
		chk=(this).children('#check').text();
		chk1 = window.location.pathname;
		console.log('chk => ' + chk);
		console.log('path => ' + chk1);
		console.log('chk => ' + chk);
		$.ajax({
			url:'test?chk1='+chk1,
			success : function(){
			}
		})
	})
	
});
</script>
