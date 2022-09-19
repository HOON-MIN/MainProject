<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.card {
  width: 450px;
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

	<div class="text-center m-5"><h2>의사 선택 </h2></div>
	<hr>
<div class="d-flex justify-content-center mt-4">
	
	<c:forEach var="doc" items="${vo }">
      <div class="card">
        <div class="row g-0">
          <div class="col-md-3 text-center">
            <img src=/taejin/img/doc1.svg class="img-fluid p-3" alt="..." />
          </div>
          <div class="col-md-9">
            <div class="card-body">
              <h5 class="card-title">
                <strong> ${doc.dname }</strong>
                <span>진료가능</span>
              </h5>
              <p class="card-text">${doc.dmajor }</p>
              <p class="card-text">
                <small class="text-muted">
                  <i class="bi bi-clock"></i> 09:00 ~ 18:00
                </small>
              </p>
              <div class="reserve d-flex flex-start">
                <button class="btn btn-primary me-1 " value="${doc.dnum}" id="reserveBtn" type="button">
                예약하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>
 
<script>
var a = ${doc.dnum}
console.log(a)
$(function(){
	
	$('.reserve').on('click','button',function(){
		var dnum = $(this).val();
		console.log(dnum)
		
		location.href='${pageContext.request.contextPath}/reserve/doctorCalendar?dnum='+dnum
		//location.href='${pageContext.request.contextPath}/reserve/reserveForm?dnum='+dnum
	})
	
})
</script>