<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/package.json"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="today2"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
    
    <script>
      var today = "<c:out value = '${today2}'/>";
      var start = null;
	  var end = null;
	  var start2 = null;
	  var end2 = null;
	  var rnum = "<c:out value = '${rnum }'/>";
      document.addEventListener('DOMContentLoaded', function() {
    	  var datalist = [];
          $.ajax({
              url: "${mycontext}/member/reserve/cannotreserve?today="+today+"&rnum="+rnum,
              type:"GET",
              dataType: "json",
              success: function(result) {
                   $.each(result, function(index, value){
                         datalist.push(value);
                   });
                   openCalander(datalist);
              }
          }); 
          });        
      function openCalander(datalist){  
    	var calendarEl = document.getElementById('calendar');       
        var calendar = new FullCalendar.Calendar(calendarEl, {	        	
          initialView: 'dayGridMonth',
          locale: "ko",
          selectable: true,          
          validRange: function(today) {
        	    return {
        	      start: today        	      
        	    };
          },         
          dateClick: function(info) {
        	  var radiocheck = $('input[name=selectd]:checked').val();
        	  if(radiocheck == 'start1'){
        		  start = info.dateStr;
        		  start2 = new Date(start);
        		  if(start == today){
        			  alert("당일 예약은 불가능합니다.");
        		  }else{
        			  $('input[name=rvstart]').attr('value', start);  
        		  }        		          		 
        	  }else if(radiocheck == 'end1'){        		 
        		  if(start == null){
        			  alert("시작 날짜를 입력하세요");
        			  $("#rebtn").attr("disabled", true);
        		  }else{
        			  end = info.dateStr;
            		  end2 = new Date(end);            		  
            		  if(end2 < start2){
            			  alert("종료 날짜가 시작 날짜보다 빠릅니다.");
            			  $('input[name=rvend]').attr('value', "");
            			  $("#rebtn").attr("disabled", true);
            		  }else if(end2 > start2){
            			  $('input[name=rvend]').attr('value', end);             			 
            			  var timeval = Math.ceil(end2.getTime() - start2.getTime());
            			  var timeval2 = (timeval/1000/60/60/24);	
            			  var rprice = "<c:out value = '${rprice}'/>";
            			  var totalprice = timeval2 * rprice;
          				  $('input[name=rvprice]').attr("value", totalprice);
          				$("#rebtn").attr("disabled", false);
            		  }else{
            			  alert("시작 날짜와 종료 날짜는 같을 수 없습니다.");
            			  $('input[name=rvend]').attr('value', "");
            			  $("#rebtn").attr("disabled", true);
            		  } 
        		  }        		  
        	  }else{
        		  alert("시작 날짜/종료 날짜 구분을 선택해주세요");
        	  }
          },
          events : datalist,
          eventColor: "#f2b75b"
        }); 
        calendar.render();
      }     
      function check() {
  		var chk = confirm("예약하시겠습니까?");
  		if(chk){
  			alert("예약되었습니다.");
  			return true;
  		}else{
  			alert("예약이 취소되었습니다.");
  			return false;
  		}
  	}
    </script>    
<article class="container">
        <header>
            <h2>예약 페이지</h2>
        </header>        
        <form action="addreserve" method="post" onsubmit="return check();">        
        <div>
        	<h5>객실 정보</h5>    
        	회원 아이디 : <input type="text" name="mid" id="mid" value="${sessionScope.sessionid }" readonly="readonly"><br>   	       	
        	객실번호 : <input type="number" name="rnum" id="rnum" value="${rnum }" readonly="readonly"><br>
         	1박 당 가격 : <input type="number" name="rpirce" id="rprice" value="${rprice }" readonly="readonly">
        </div>        
        <div>        
  			<h5>예약 기간 선택</h5>
  			<label><input type="radio" name="selectd" value="start1">시작 날짜 선택하기</label>
      		<label><input type="radio" name="selectd" value="end1">종료 날짜 선택하기</label>
  			<div id='calendar' style="float: center; width: 600px;"></div> 		
  			<label>사용 시작일</label>
  			<input type="text" class="date" value="" name="rvstart" id="rvstart" placeholder="사용 시작일">
  			<label>사용 종료일</label>  			
  			<input type="text" class="date" value="" name="rvend" id="rvend" placeholder="사용 종료일">
  		 					
        </div>
        <div>
        	<h5>총 금액</h5>
        	<input type="number" name="rvprice" id="rvprice" value="" placeholder="총 금액" readonly="readonly">        	
        </div>
        <div>
        	<input type="submit" value="예약하기" id="rebtn" disabled="disabled">
        	<input type="button" value="돌아가기" id="backbtn" onclick="history.go(-1)">
        </div>        
        </form>
    </article> 

