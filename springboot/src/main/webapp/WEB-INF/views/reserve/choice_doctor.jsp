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


				<div class="d-flex justify-content-center mt-4">
					<section class="vh-100" style="background-color: #eee;">
						<div class="container py-3 h-50">
							<div
								class="row d-flex justify-content-center align-items-center h-100">
								<div style="height: 30%;">
									<h3 class="hanna m-3 text-center">예약하실 의사선생님 목록</h3>
									<hr>
									<div class="row hDetail justify-content-around"
										style="height: 100%"></div>
								</div>
								<c:forEach var="doc" items="${vo }">
									<div class="col-4 m-3">
										<div class="card h-80" style="border-radius: 15px;">
											<div class="card-body text-center">
												<div class="mt-3 mb-4">
													<img
														src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
														class="rounded-circle img-fluid" style="width: 100px;" />
												</div>
												<h4 class="mb-2">${doc.dname }</h4>
												<p class="text-muted mb-4">
													전공<span class="mx-2">|</span>${doc.dmajor }
												</p>
												<div class="reserve" >
												<input type="hidden" value="${doc.dnum }" id="dnum">
												<input type="button" value="Reserve !"
													class="btn btn-primary btn-rounded btn-lg" id="reserveBtn">
													
													
													</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<ul class="pagination justify-content-center mt-3">
									<c:choose>
										<c:when test="${startPage < 6 }">
											<li class="page-item disabled"><a class="page-link"
												href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
											<!-- 	<li class="disable">이전으로</li> -->
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="choice_doctor?cPage=${startPage-1}&category=${category}&search=${search}">Previous</a></li>
										</c:otherwise>
									</c:choose>
									<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
									<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
									<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

									<c:forEach varStatus="i" begin="${startPage}" end="${endPage}"
										step="1">
										<c:choose>
											<c:when test="${i.index == nowPage}">
												<li class="page-item now"><a class="page-link"
													style="background: #3478F5; color: white;">${i.index }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="choice_doctor?cPage=${i.index}&category=${category}&search=${search}">${i.index}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${endPage >= totalPage}">
											<li class="page-item disabled"><a class="page-link"
												aria-disabled="true">Next</a></li>
										</c:when>
										<c:when test="${totalPage > (nowPage+pagePerBlock)}">
											<li>
											<li class="page-item"><a class="page-link"
												href="choice_doctor?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
										</c:when>
										<c:otherwise>
											<li>
											<li class="page-item"><a class="page-link"
												href="choice_doctor?cPage=${endPage+1 }&category=${category}&search=${search}">Next</a></li>
										</c:otherwise>
									</c:choose>
									<!-- 							<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
								</ul>
							</div>
						</div>
					</section>
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