<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
a:link {
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
</style>
<article>
<div class="container">
	<header class="text-center m-5" >
		<h3>사용자 후기 게시판</h3>
	</header>
	
	<!--  /taejin/img/사진이름 -->

<!-- 
<c:forEach var="e" items="${reviewlist}">
<tr>
<td class="align-middle text-center">${e.rnum }</td>
<td class="text-center"><a href="reviewDetail?rnum=${e.rnum }">${e.title }<b><span style="color: darkred;">[${e.rcount }]</span></b></a></td>

<td class="align-middle text-center">${e.id }</td>
<td class="align-middle text-center">${e.hname }</td>
<td class="align-middle text-center"><fmt:parseDate value="${e.udate}" var="udate" pattern="yyyy-MM-dd HH:mm:ss"/>
<fmt:formatDate value="${udate }" pattern="yyyy-MM-dd"/></td>
<td class="align-middle text-center">${e.hits }</td>

</tr>
</c:forEach>
 -->
 
<div class="flex-container justify-content-center">
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
	  	<input type="hidden" value="${e.likes}"> 
	  </div>
	</div><div class="card m-3" style="width: 18rem;">
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
	    <p class="card-text">열락의 보이는 자신과 것은 피다. 실현에 바이며, 역사를 주는 가는 귀는 보라. 생의 하였으며, 이상 살 그들의 얼마나 있는 열락의 뜨고, 부패뿐이다. 구하지 용감하고 끓는 속에 사막이다. 청춘의 만천하의 무엇을 이성은 그들은 창공에 끓는 내는 끓는다. 평화스러운 가슴에 작고 별과 이것이야말로 그들의 봄바람이다. 그들의 품고 살 예수는 방황하여도, 맺어, 보는 없으면 것이다. 실로 아름답고 품으며, 구하지 피는 쓸쓸하랴? 같이, 인생에 청춘 것이다.

오직 것이 있는 꽃이 사막이다. 그들은 영원히 것은 불어 가장 있다. 공자는 싶이 원질이 청춘에서만 얼음과 있다. 예수는 아름답고 그것은 것이다. 이는 있을 풀밭에 이것을 오직 지혜는 방황하였으며, 황금시대다. 가슴이 살 이 곳으로 앞이 것이 속잎나고, 힘차게 힘있다. 없으면 굳세게 온갖 꽃이 원질이 소리다.이것은 품었기 아니다. 보는 뜨거운지라, 피가 얼음과 찬미를 평화스러운 날카로우나 원질이 피어나는 있으랴? 있는 그들을 이것을 인생에 황금시대다. 열락의 발휘하기 이는 피다. 뜨거운지라, 천고에 그들의 못할 희망의 듣는다.

싹이 위하여, 석가는 끓는 것은 착목한는 동력은 교향악이다. 구할 없는 것은 것이다. 자신과 얼마나 무엇을 봄바람이다. 긴지라 목숨이 싸인 봄바람이다. 두손을 부패를 위하여 굳세게 끝에 앞이 말이다. 굳세게 실현에 역사를 힘있다. 피가 고동을 붙잡아 바이며, 우리 심장은 자신과 쓸쓸하랴? 주며, 같이, 별과 군영과 곧 대중을 사막이다. 청춘이 설레는 트고, 이것이다. 반짝이는 뛰노는 맺어, 심장은 살 그들에게 쓸쓸하랴? 기쁘며, 남는 풀이 청춘의 얼마나 봄바람이다.
 </p>
	  </div>
	  <div class="card-footer d-flex justify-content-between align-items-center">
	  	<span>${e.hname }</span> 
	  	<span class="reviewScore">점수 : 8/10</span>
	  	<input type="hidden" value="${e.rnum}"> 
	  </div>
	</div><div class="card m-3" style="width: 18rem;">
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
	  	<span class="reviewScore">점수 : 8/10</span>
	  	<input type="hidden" value="${e.rnum}"> 
	  </div>
	</div>
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
	  	<span class="reviewScore">점수 : 8/10</span>
	  	<input type="hidden" value="${e.rnum}"> 
	  </div>
	</div>
 </c:forEach>
</div>
	


	</div>

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
</article>