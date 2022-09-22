<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
a:link {
	text-decoration: none;
	color: black;
}

table img {
	width: 80px;
}
/* 	#datatablesSimple a{ */
/* 		text-decoration: none; */
/* 		color:black; */
/* 	} */
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

<article>
<div class="container">
	<header>
		<h1>Hospital List</h1>
	</header>
	
    <div class="panel">
    <div class="panel-body">
        <div class="btns" style="text-align: center;">
        <h4>진료과목 조회</h4>
        <c:forEach var="e" items="${hcate }" varStatus="status">
           <input type="button" name="hbtn${status.index}" value="${e.hcate }" class="hcatebtn btn btn-outline-primary"/>
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
			<th >병원명</th>
			<th>위치</th>
			<th>영업시간</th>
			<th >진료과목</th>
		</tr>
	</thead>

	<tbody>
		<%-- for start --%>
		<c:forEach var="e" items="${list }">
 			<tr> 
				<td class="linktd">${e.r_num }</td>
				<td class="linktd"><a href="hospitalDetail?num=${e.cnum }"> ${e.hname }</a></td>
				<td class="linktd">${e.hloc }</td>
				<td class="linktd">${e.otime }~${e.ctime }</td>
				<td class="linktd">${e.hcate }</td>
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
				href="hospitalList?cPage=${startPage-1}&category=${category}&search=${search}">이전으로</a></li>
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
					href="hospitalList?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
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
				href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
		</c:when>
		<c:otherwise>
			<li>
			<li><a
				href="hospitalList?cPage=${endPage+1 }&category=${category}&search=${search}">다음으로</a></li>
		</c:otherwise>
	</c:choose>
</ol>
</td>
</tr>
<tr>
<td colspan="5">
<form class="sForm" name="sForm" method="get" action="hospitalList">
<input type="hidden" name="searchreset" value="1">
	<select name="category" id="category">
		<option value="hloc">병원위치</option>
		<option value="hname">병원명</option>
		<option value="hcate" hidden="hidden" id="hcate">진료과목</option>
		<option value="all">병원위치+병원명</option>
	</select> 
	<input type="text" name="search" id="hsearch">
    <input type="submit" id="searBtn" value="조회">
</form>

</td>
</tr>

</tfoot>
</table>

</div>

</article>


<!-- 이전 jquery 임포트 코드 ...!!! -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script>
$(function(){
	$('.linktd').click(function(){
		var href = $(this).parent("tr").children("td").children("a").attr("href")
// 		alert(href);
		window.location = href;
	});
});
</script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    $('.hcatebtn').click(function(){
    	var hcatename = $(this).val();
    	$("#hcate").attr("selected", "selected");
    	$("#hsearch").val(hcatename);
    	$(".sForm").submit();
    });
 
// var path = "${pageContext.request.contextPath }";
// var qustr = "${searchVO.qustr}";
 
// $(function(){
// 	$(".btns").on('click', "input",function(){
// 		console.log("button click");
// 		var cate = $(this).val();  //버튼이 클릭 되었을 때 그 버튼의 value를 var kind로 가져와서	
// 		$.ajax({
// 			 url : 'hospitalList', // 이 주소로 
//               type : "POST", // 포스트 방식으로 보내는데
//               cache: false,
//               headers: {"cache-control":"no-cache", "pragma": "no-cache"},
//               data : {
//             	  "cPage" : 1,
//             	  "hcate" : cate
            	  
//               }, // kind를 kind로 명명하여 보내겠다
//               success : function(data){ 
//                  console.log(data);
//                 	location.href='${pageContext.request.contextPath}/hospital/hospitalList?cPage=1&hcate='+cate;
					
//                  $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
//               },
//               error : function(data){
//             	 alert('error');
               
//               }//error
// 		})//ajax
// 	});//click
// });//ready
    
//     $("input:button[name='button']").on('click',function(){
//         var kind = $(this).val();       //버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담겨집니다.
//         $.ajax({
            
//             url : path+"/onlinecounsel/expertmb/list_ajax.do",
//             type : "post",
//             cache : false,
//             headers : {"cache-control":"no-cache","pragma":"no-cache"},
//             data : {
//                  id : $(this).val(),
//                 "kind":kind    // 버튼의 value값에 따라 작동합니다.
                
//             },
//             success : function(data){
//                 console.log(data);
//                 $('body').html(data); // 성공 시, body부분에 data라는 html 문장들을 다 적용시킵니다.
//             },
//             error : function(data){
//                 alert('error');
//             }//error
//         })//ajax
//     });//button click
 
</script>




