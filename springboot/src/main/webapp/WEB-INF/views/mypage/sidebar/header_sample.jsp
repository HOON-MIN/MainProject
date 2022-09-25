<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="border-end bg-white col-sm-2" id="sidebar-wrapper">
	
		<div class="d list-group list-group-flush">
		<c:choose>
			<c:when test="${sessionNUM == 1}">
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/admin/adminHospTotalList">전체 병원</a>
			<a	dis class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/admin/adminHospRegistList">등록된 병원</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/admin/waitingList">업체승인 대기목록</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/admin/adminRegistChart">차트</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			
			<c:when test="${sessionNUM != null}">
			<a	style="on" class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage">프로필</a>
				
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/member/memberMypage_list">예약 목록</a> 
				
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/reserve/reserveForm">예약하기</a> 
				
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/medInq/medInqDetail?mednum=${sessionNUM}">나의 문진표</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			
			<c:when test="${sessionDNUM != null}">
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#">Scheduler</a>
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#">Reserve List</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">??</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Events</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>

			<c:when test="${sessionCNUM != null}">
			<a 	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/doctor/joinDoctorForm">Add Doctor</a>
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="${pageContext.request.contextPath }/company/hospitalDoctorList">Doctor List</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#" id="hgrade">Analysis Dashboard</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Events</a> 
			<a	class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Profile</a> 
			<a  class="list-group-item list-group-item-action list-group-item-light p-3"
				href="#!">Status</a>
			</c:when>
			
			</c:choose>
		</div>
	</div>
	<script>
	var sessionGrade = '${sessionHGRADE}'
	$('#hgrade').click(function(){
		console.log('sessionGrade = ' + sessionGrade)
		if(sessionGrade == '베이직'){
			alert('프리미엄등급으로 등록을 해주세요!!')
		}else{
			location.href='${mycontext }/hospitalP/dashboard'
		}
	})
	</script>
				