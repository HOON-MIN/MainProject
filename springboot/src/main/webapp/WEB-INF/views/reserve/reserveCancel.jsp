<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="today2"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
<script>
	var today = "<c:out value = '${today2}'/>";
	var rvprice = "<c:out value = '${dlist.rvprice}'/>";
	var rvstart = "<c:out value = '${dlist.rvstart}'/>";
	var today2 = new Date(today);
	var rvstart2 = new Date(rvstart);
	var cancelprice = null;
	$(function () {				
		var timeval = Math.ceil(rvstart2.getTime() - today2.getTime());
		var timeval2 = (timeval/1000/60/60/24);	
		cancelprice = timeval2 * 0.1 * rvprice;		
		$('input[name=cancelprice]').attr('value', cancelprice);
	});	
	function check() {
  		var chk = confirm("취소하시겠습니까?");
  		if(chk){
  			alert("예약을 취소하였습니다.");
  			return true;
  		}else{
  			alert("취소되었습니다.");
  			return false;
  		}
  	}
</script>
<article class="container">
        <header>
            <h1>예약 취소 페이지</h1>
        </header>
        <ul class="list-unstyled"></ul>
        <form action="reservercancelcom" method="post" onsubmit="return check();">
        <div>
        <label>예약번호</label>
        <input type="number" name="rvnum" id="rvnum" value="${dlist.rvnum }" readonly="readonly">
        </div>
        <div>
        <label>객실번호</label>
        <input type="number" name="rnum" id="rnum" value="${dlist.rnum }" readonly="readonly">
        </div>
        <div>
        <label>객실명</label>
        <input type="text" name="rname" id="rname" value="${dlist.roomvo.rname }" readonly="readonly">
        </div>
        <div>
        <label>최대인원</label>
        <input type="number" name="rmax" id="rmax" value="${dlist.roomvo.rmax }" readonly="readonly">
        </div>
        <div>
        <label>사용 시작일</label>
        <input type="text" name="rvstart" id="rvstart" value="${dlist.rvstart }" readonly="readonly">
        </div>
        <div>
        <label>사용 종료일</label>
        <input type="text" name="rvend" id="rvend" value="${dlist.rvend }" readonly="readonly">
        </div>
        <div>
        <label>총 가격</label>
        <input type="number" name="rvprice" id="rvprice" value="${dlist.rvprice }" readonly="readonly">
        </div>
        <div>
        <label>위약금</label>
        <input type="number" name="cancelprice" id="cancelprice" value="" readonly="readonly">
        </div>
        <div>
        	<input type="submit" value="예약 취소" id="cancelbtn">
        	<input type="button" value="돌아가기" id="backbtn" onclick="history.go(-1)">
        </div>
        </form>
        
   </article>