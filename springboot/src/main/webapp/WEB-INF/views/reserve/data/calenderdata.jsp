<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<link href='/taejin/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='/taejin/fullcalendar/lib/main.js'></script>
    
<div id='calendar'></div>
<script>
function dateFormat(res){		//작성일 기준 2022-03-25
	var date = new Date(res);
console.log('date => ' +date)
	var yyyy = date.getFullYear();
	var mm = ('0' + (date.getMonth() + 1)).slice(-2);
	if(mm > 10){
		mm = '0'+mm;
	}
	var dd = ('0' + date.getDate()).slice(-2);
	
	return yyyy+'-'+mm+'-'+dd;
}


var todays = new Date();

var res = dateFormat(todays);
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var data = [<c:forEach var="e" items="${list }">
    				<c:forEach var="i" items="${e.reserveVO}" varStatus="status">
				    {
				        title: "${i.memberVO.name}",//멤버이름
				        start: dataFormat(new Date('${i.rdate}'))+'T${i.rtime}:00',
				        constraint: 'businessHours' // "코로나"
				      },
				    </c:forEach>
    			</c:forEach>]
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      themeSystem: 'bootstrap5',
      initialDate: todays,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events: [
        {
          title: 'Business Lunch',//멤버이름
          start: '2020-09-03T13:00:00',//rdate + rtime
          constraint: 'businessHours' // "코로나"
        },
      ]
    });

    calendar.render();
  });

</script>

