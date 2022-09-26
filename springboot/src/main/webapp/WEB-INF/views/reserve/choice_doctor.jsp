<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.card {
	width: 350px;
	color: #232323;
	height: 300px;
}

.card-body button {
	font-size: 8px;
	max-width: 200px;
}

.card-text p {
	margin-top: 16px;
	text-decoration: none;
}

.card-title span {
	margin-left: 16px;
	font-size: 14px;
	background-color: #3478f5;
	padding: 4px 12px;
	border-radius: 16px;
	color: white;
}

Link {
	color: #232323;
	text-decoration: none;
}
</style>

<jsp:include page="../mypage/sidebar/sidebar_header.jsp" flush="true"></jsp:include>

<div style="height: 80%;">
	<h3 class="hanna m-3 text-center">의사선택</h3>
	<div class="row hDetail justify-content-around" style="height: 100%">
	</div>
</div>
<div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
	<c:forEach var="e" items="${vo }">
		<div class="col-md-5">
			<div class="card" style="width: 400px; height: 180px; margin: auto;">
				<div class="row g-0">
					<div class="col-3 text-center">
						<img src=/img/doctor.png class="m-3 w-100" alt="..." />
					</div>
					<div class="col-9">
						<div class="card-body">
							<h5 class="card-title">
								<strong> ${e.dname} 의사</strong>
							</h5>
							<hr>
							<br> <small class="text-muted"> ${e.dmajor}</small>
							<div class="reserve d-flex flex-start">
							<input type="hidden" value="${e.dnum }" id="dnum">
								<input class="btn btn-primary me-1" type="button" value="예약하기">
									
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<jsp:include page="../mypage/sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script>
	$(function() {
		$('.reserve')
				.on(
						'click',
						function() {
							var dnum = $(this).children('#dnum').val();
							console.log(dnum)
							location.href = '${pageContext.request.contextPath}/reserve/doctorCalendar?dnum='
									+ dnum
							//location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum
						})
	})
</script>