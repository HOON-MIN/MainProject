<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.card {
	width:400px;
	color: #232323;
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


<div class="d-flex justify-content-center mt-4">

<section class="vh-100" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
<c:forEach var="doc" items="${vo }">
      <div class="col-md-12 col-xl-4">

          	
        <div class="card" style="border-radius: 15px;">
          <div class="card-body text-center">
            <div class="mt-3 mb-4">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp"
                class="rounded-circle img-fluid" style="width: 100px;" />
            </div>
            <h4 class="mb-2">Julie L. Arsenault</h4>
            <p class="text-muted mb-4">@Programmer <span class="mx-2">|</span> <a
                href="#!">mdbootstrap.com</a></p>
            <div class="mb-4 pb-2">
              <button type="button" class="btn btn-outline-primary btn-floating">
                <i class="fab fa-facebook-f fa-lg"></i>
              </button>
              <button type="button" class="btn btn-outline-primary btn-floating">
                <i class="fab fa-twitter fa-lg"></i>
              </button>
              <button type="button" class="btn btn-outline-primary btn-floating">
                <i class="fab fa-skype fa-lg"></i>
              </button>
            </div>
            <button type="button" class="btn btn-primary btn-rounded btn-lg">
              Message now
            </button>
            <div class="d-flex justify-content-between text-center mt-5 mb-2">
              <div>
                <p class="mb-2 h5">8471</p>
                <p class="text-muted mb-0">Wallets Balance</p>
              </div>
              <div class="px-3">
                <p class="mb-2 h5">8512</p>
                <p class="text-muted mb-0">Income amounts</p>
              </div>
              <div>
                <p class="mb-2 h5">4751</p>
                <p class="text-muted mb-0">Total Transactions</p>
              </div>
            </div>
          </div>
        </div>
      </div>
            </c:forEach>
    </div>
  </div>
</section>



































	<div class="row row-cols-1 row-cols-md-2 g-4">
		<div class="col">
			<c:forEach var="doc" items="${vo }">
				<div class="card">
					<div class="row">
						<div class="col-md-3 text-center">
							<img src=/taejin/img/doc1.svg class="img-fluid p-3" alt="..." />
						</div>
						<div class="col-md-9">
							<div class="card-body">
								<h5 class="card-title">
									<strong> ${doc.dname }</strong> <span>진료가능</span>
								</h5>
								<p class="card-text">${doc.dmajor }</p>
								<p class="card-text">
									<small class="text-muted"> <i class="bi bi-clock"></i>
										09:00 ~ 18:00
									</small>
								</p>
								<div class="reserve d-flex flex-start">
									<button class="btn btn-primary me-1 " value="${doc.dnum}"
										id="reserveBtn" type="button">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	var a = ${doc.dnum}
	console.log(a)
	$(function() {
		$('.reserve').on('click','button',function() {
				var dnum = $(this).val();
				console.log(dnum)
				location.href = '${pageContext.request.contextPath}/reserve/doctorCalendar?dnum='+ dnum
				//location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum
			})
		})
</script>