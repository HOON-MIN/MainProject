<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">   
<head>
<title>예약 작성</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">


<script type="text/javaScript" language="javascript"></script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}
</style>
</head>
<body>



<!-- 잘 라 내 기 -->


	<section>
	<form name="calendarFrm" id="calendarFrm" action="getCalendar" method="post">
		<div style="margin-bottom: 5px;">
			<h1 style="text-align: center; font-size: 70px; color: teal;">원하시는
				날짜를 선택해주세요</h1>
		</div>
		<input type="hidden" id="resday" name="resday" value="">
		<input type="hidden" id="dnum" name="dnum" value="${dnum }">
		
		<div class="calendar">
			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="doctorCalendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}&dnum=${dnum}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="doctorCalendar?year=${today_info.before_year}&month=${today_info.before_month}&dnum=${dnum}">
					&lt; <!-- 이전달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> <a class="before_after_month"
					href="doctorCalendar?year=${today_info.after_year}&month=${today_info.after_month}&dnum=${dnum}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="doctorCalendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}&dnum=${dnum}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>

			<table class="calendar_body">

				<thead>
					<tr bgcolor="#CECECE">
						<td class="day sun">일</td>
						<td class="day">월</td>
						<td class="day">화</td>
						<td class="day">수</td>
						<td class="day">목</td>
						<td class="day">금</td>
						<td class="day sat">토</td>
					</tr>
				</thead>
				<tbody>
					<tr class="datetr">
						<c:forEach var="dateList" items="${dateList}"
							varStatus="date_status">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today">
										<div class="date">${dateList.date}</div>
										<div></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat satdiv" style="font-size: 15px; font-weight: bold; padding-left: 3px;padding-top: 3px;">${dateList.date}</div>
										<div></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr class="datetr">
						<td class="sun_day">
							<div class="sun sundiv" style="font-size: 15px; font-weight: bold; padding-left: 3px;padding-top: 3px;">${dateList.date}</div>
							<div></div>
						</td>
						</c:when>
						<c:otherwise>
							<td class="normal_day">
								<div class="date">${dateList.date}</div>
								<div></div>
							</td>
						</c:otherwise>
						</c:choose>
						</c:forEach>
				</tbody>

			</table>
		</div>
	</form>
	</section>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
// 하 ㅅㅂ 다 갈아엎을까
		$(".datetr").children().click(function(){
			const td = $(".datetr").children("td");
			const sat = $(".satdiv");
			const sun = $(".sundiv");
			const date = $(".date");
			
			date.closest("td").attr("class","normal_day");
			sat.closest("td").attr("class","sat_day");
			sun.closest("td").attr("class","sun_day");
			
			$(".datetr").children("td").css("background-color","#EFEFEF");
			
			
			
			$(this).attr("class","today").css("background-color","#C9C9C9");
			var year = "${today_info.search_year}";
			var month = "${today_info.search_month}";
			var day = $(this).children("div").text();
			var resday = year+"-"+month+"-"+day;
			$("#resday").val(resday);
			$("#calendarFrm").submit();
			// resday 를 예약 폼으로 넘긴 후, 세부적인 시간 설정을 하게 할 생각임 ㅅㅂ
		}
	);
</script>
</html>
