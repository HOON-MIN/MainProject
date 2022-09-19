<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function () {
		$(".date").datepicker('setDate', 'today');
	});
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년',
	  minDate: "+1D",
	  maxDate: "+3M",
	  beforeShowDay: cannotreserve
	});	
	$(function () {
		$(".date").datepicker();
	});
	$(function () {
		$("#rvend").change(function () {
			var before = new Date($("#rvstart").val());
			var after = new Date($("#rvend").val());
			console.log($("#rvstart").val());
			console.log($("#rvend").val());
			var timeval = Math.ceil(after.getTime() - before.getTime());
			var timeval2 = (timeval/1000/60/60/24);	
			var rprice = "<c:out value = '30000'/>";
			console.log(rprice);
			console.log(timeval2);
			if(timeval < 0){
				$("#target").html("올바른 날짜를 입력하세요");
				$("#rebtn").attr("disabled", true);
			}else if(timeval > 0){
				$("#target").html("날짜가 정상적으로 입력되었습니다.");
				let totalprice = timeval2 * rprice;
				$("#rvprice").attr("value", totalprice);
				$("#rebtn").attr("disabled", false);
			}else{
				$("#target").html("같은 날짜는 예약할 수 없습니다.");
				$("#rebtn").attr("disabled", true);
			}
		});
	});
	
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
	function cannotreserve() {	
		var dateRange = [];
		var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
		<c:forEach var="day" items="${cannot }">			
				var start = "${day.rvstart}";
				var end = "${day.rvend}";
				for(var d = new Date(start); d<= new Date(end); d.setDate(d.getDate()+1)){
					dateRange.push($.datepicker.formatDate('yy-mm-dd',d));
				}
				return [dateRange.indexOf(dateString) == -1];
		</c:forEach>
	}
</script>
<article class="container">
        <header>
            <h2>예약 페이지</h2>
        </header>        
        <form action="addReserve" method="post">
        <%--
        var rprice = "<c:out value = ${room.rprice}/>";
        
        <div>
        	<h5>객실 정보</h5>    
        	회원 아이디 : <input type="text" name="mid" id="mid" value="${sessionScope.sessionID }" readonly="readonly"><br>   	       	
        	객실번호 : <input type="number" name="rnum" id="rnum" value="${room.rnum }" readonly="readonly"><br>
         	1박 당 가격 : <input type="number" name="rpirce" id="rprice" value="${room.rprice }" readonly="readonly">
        </div>
         --%>
        <div>
        	<h5>예약하기 폼</h5>    
        	의사 이름 : <input type="text" name="dname" id="dname" value="${vo.dname }" readonly="readonly"><br>   	       	
        	의사 과 : <input type="text" name="dmajor" id="dmajor" value="${vo.dmajor }" readonly="readonly"><br>
        </div>
        <div>
        
  			<h5>예약 기간 선택</h5>
  			<label>사용 시작일</label>
  			<input type="date" class="date" name="rdate" id="rdate" placeholder="예약 날짜">
  			<!-- <div id="target"></div>  	 -->		
        </div>
        <div>
        	증상 : <input type="text" name="symptom" id="symptom" placeholder="증상">
        </div>
        <div>
        	증상 : <textarea name="symptomComm" id="symptomComm" placeholder="증상을 상세하게 적어주세요"></textarea>
        </div>
        <div>
        	<input type="submit" value="예약하기" id="rebtn" disabled="disabled">
        </div>
        </form>
    </article>
