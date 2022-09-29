<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid" style="height: 100%;">
	<div class="row justify-content-around" style="height: 100%; background: #3478f5;">
	<div class="col-2 hcategory ">
					<div class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<c:choose>
				<c:when test="${sessionNUM != null }">
				<img src="${pageContext.request.contextPath }/imgfile/${sessionProfimg}" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">${sessionNAME } 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="" style="text-decoration: none;color: white;">마이페이지</a>
				</span>
				</c:when>
				<c:when test="${sessionNUM == null }">
				<img src="/taejin/img/doc3.svg" alt="/taejin/img/doc3.svg" style="height: 40%;" class="rounded-circle img-fluid">
				<h5 class="hanna text-white">게스트 님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 
				<a href="${pageContext.request.contextPath }/member/memberLoginForm"
				 style="text-decoration: none;color: white;">로그인</a> ・ 
				<a href="${pageContext.request.contextPath }/member/joinForm"
				 style="text-decoration: none; color: white;" >회원가입</a>
				</span>
				</c:when>
				</c:choose>
			</div>
					<div>
						<ul class="nav flex-column">
							<li class="nav-item pt-2 pb-2 ps-4"><a
								class="nav-link text-white"
								href="${pageContext.request.contextPath }/member/memberMypage_list">예약목록
							</a></li>
						</ul>
					</div>
				</div>
		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="justify-content-center">
					<h3 class="hanna ps-3 text-center"></h3>
					<div class=" justify-content-center ">
					<div class="container py-4"
							style="width: 80%; margin: auto; padding: 10px 5px;">
							<h1 class="display-5 fw-bold">의사 예약 스케줄 잡기</h1>
							<div id='calendar' style="height: 80%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css'
	rel='stylesheet'>
<link href='/taejin/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='/taejin/fullcalendar/lib/main.js'></script>
<script>
   var today = new Date();
   var dnum = ${dnum}
   var res;
   var ref;
   var name;
   var sta;
   var arr = [];
   var arrt = [];
   var arrc = [];
   var dict = {};
   var calendar;
   var sessionNum = ${sessionNUM}
   document.addEventListener('DOMContentLoaded', function() {
	   console.log('dnum = ' ,dnum)
	    var calendarEl = document.getElementById('calendar');
	    	$.ajax({
	    		url:'doctorReserveList?dnum=' + dnum,
	    		type:'GET',
	    		success:function(data){
	    			// 예약이 있을경우
	    			if(data.length != 0){
	    				console.log(' data = > ' ,data)
	    			console.log(data[0].reserveVO[0].rdate)
	    			console.log(data[0].reserveVO[0].memberVO.name)
	    			var datas = data[0].reserveVO;
	    			for(var i of datas){
	    				console.log('i = ',i)
	    				f = new Date(i.rdate)
	    				//console.log(typeof(f))
	    				//console.log('f = ' +f)
	    				//console.log('today = ' +today)
	    				//console.log(typeof(today))
	    				// 월이 10 이하일경우 -> 9 => 09
	    				if(f >= today){
	    					arr.push({'start' : dateFormat(i.rdate)+'T'+i.rtime,
	    	    				'title' : ' '+i.memberVO.num+'. '+ i.memberVO.name,
	    	    			});
	    				}
	    				console.log('arr = ',arr)
	    			}
		    
		     calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      themeSystem: 'bootstrap5',
		      initialDate: dateFormat(today),
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true,
		      selectable: true,
		      eventClick: function(info) {
				console.log('클릭이벤트! ' + info.event.title)
		      },
		      dateClick: function(info){
		    	  res = info.dateStr
		    	  console.log('날짜 클릭! = '+res)
		    	  if(sessionNum==null){
		    		  var message = '로그인하세요!'
		    		  alert(message)
		    	  }else{
		    	  location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum+'&rdate='+res
		    	  }
		      },
		      events:arr
		    	  
		      });
		    // calendar - 끝
		    calendar.render();
		    
	    			}else{
	    				
	    		// 예약이 없을경우
			     calendar = new FullCalendar.Calendar(calendarEl, {
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			      },
			      themeSystem: 'bootstrap5',
			      initialDate: dateFormat(today),
			      navLinks: true, // can click day/week names to navigate views
			      businessHours: true, // display business hours
			      editable: true,
			      selectable: true,
			      eventClick: function(info) {
			      },
			      dateClick: function(info){
			    	  res = info.dateStr
			    	  console.log('날짜 클릭! = '+res)
			    	  location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum+'&rdate='+res
			      }
			     });
			    // calendar - 끝
			    calendar.render();
	    	    	}
		    	}// success - 끝
		    });// ajax - 끝
	   });
   //날짜 변환 function
   function dateFormat(res){		
		var date = new Date(res);
   //console.log('date => ' +date)
		var yyyy = date.getFullYear();
		var mm = ('0' + (date.getMonth() + 1)).slice(-2);
		var dd = ('0' + date.getDate()).slice(-2);
		return yyyy+'-'+mm+'-'+dd;
	}
</script>
