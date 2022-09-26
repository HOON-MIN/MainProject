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
<div class="col-10">
	<div class="hboard pt-2 ps-3 pe-3">
		<div class="justify-content-center">
			<h3 class="hanna ps-3 text-center"></h3>
			<div class=" justify-content-center ">
				 <div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
					<c:forEach var="e" items="${vo }">
					<div class="col-md-5">
						<div class="card" style="width : 400px; height:180px; margin:auto;">
							<div class="row g-0">
								<div class="col-3 text-center">
									<img src=/img/doctor.png class="m-3 w-100" alt="..." />
								</div>
								<div class="col-9">
									<div class="card-body">
										<h5 class="card-title">
											<strong> ${e.dname} 의사</strong>
										</h5>
										<hr><br>
										<div class="d-flex flex-start" style="float:right;">
										<small class="text-muted">${e.dmajor}</small>
											<button class="btn btn-primary me-1"  type="button">
												예약하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div> 
				<div class="d-flex justify-content-center mt-4">
					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	$(function() {
		$('.reserve').on('click',function() {
							var dnum = $(this).children('#dnum').val();
							console.log(dnum)
							location.href = '${pageContext.request.contextPath}/reserve/doctorCalendar?dnum='+ dnum
							//location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum
						})
	})
</script>