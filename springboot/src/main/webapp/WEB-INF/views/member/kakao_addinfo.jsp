<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="h-100">
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col">
				<div class="card card-registration my-4">
					<div class="row g-0">

						<form id="kakaoForm" action="/member/kakaoLogin" method="post">
								<div class="card-body p-md-5 text-black">
									<h3 class="mb-5 text-uppercase">추가정보요청</h3>

									<div class="row">
										<input type="hidden" id="id" name="id" value="${kakaoData.id}">
										<input type="hidden" id="pwd" name="pwd"
											value="${kakaoData.pwd}"> <input type="hidden"
											id="name" name="name" value="${kakaoData.name}"> <input
											type="hidden" id="profimg" name="profimg"
											value="${kakaoData.profimg}"> <input type="hidden"
											id="ssn" name="ssn" value=""> <input type="hidden"
											id="tel" name="tel" value="">
										<div class="col-md-6 mb-4">
											<div class="form-outline">
												<input type="text" id="ssn1"
													class="form-control form-control-lg" maxlength="6" /> <label
													class="form-label" for="ssn1">주민등록번호</label>
											</div>
										</div>
										<div class="col-md-1 mb-4"
											style="width: 10px; text-align: center;">
											<label><b> - </b></label>
										</div>
										<div class="col-md-1 mb-4">
											<div class="form-outline">
												<input type="text" id="ssn2"
													class="form-control form-control-lg" maxlength="1" />
											</div>
										</div>
										<div class="col-md-4 mb-4">
											<label>* * * * * *</label>
										</div>
									</div>

									<div class="form-outline mb-4">
										<input type="text" id="telv" name="telv"
											class="form-control form-control-lg" maxlength="11"
											placeholder="-없이 입력" /> <label class="form-label" for="telv">전화번호</label>
									</div>

									<c:choose>
										<c:when test="${kakaoData.email == null }">
											<div class="form-outline mb-4">
												<input type="text" id="email" name="email"
													class="form-control form-control-lg" /> <label
													class="form-label" for="tel">이메일</label>
											</div>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="email" name="email"
												value="${kakaoData.email}">
										</c:otherwise>
									</c:choose>

									<div class="d-flex justify-content-end pt-3">
										<button type="button" class="btn btn-light btn-lg">Reset
											all</button>
										<button type="submit" class="btn btn-warning btn-lg ms-2">Submit
											form</button>
									</div>

								</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- 본문 끝 --%>