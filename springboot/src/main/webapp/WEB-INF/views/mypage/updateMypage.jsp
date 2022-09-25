<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.hcategory {
	background-color: #3478f5;
	padding-top: 40px;
	height: 100%;
}

.hboard {
	background-color: #efefef;
	border-radius: 8px;
	margin: 40px;
	height: 90%;
}

a {
	text-decoration: none;
	color: white;
}

.searchForm input {
	border: solid 1px #3478f5;
	border-radius: 16px 0 0 16px;
	background-color:
}

.searchForm button {
	background-color: #3478f5;
	width: 64px;
	border-radius: 0 16px 16px 0;
}

.searchForm img {
	width: 18px;
}

.htable {
	width: 100%;
}

.htable thead {
	height: 40px;
	color: grey;
}

.htable th {
	font-weight: lighter;
	padding-left: 12px;
}

.htable tbody {
	border-collapse: collapse;
	border-radius: 16px;
	box-shadow: 2px 2px 2px 2px #ababab;
}

.htable td {
	padding: 14px 12px;
	font-size: 14px;
}
</style>








<div class="container-fluid" style="height: 100%;">
	<div class="row justify-content-around" style="height: 100%;">
		<!-- 카테고리 영역 -->
		<div class="col-2 hcategory ">
			<!-- 카테고리 프로필 -->
			<div
				class="d-flex flex-column align-items-start justify-content-center ps-5"
				style="height: 160px;">
				<img src="/taejin/img/doc3.svg" alt="프로필사진" style="height: 40%;"
					class="mb-3">
				<h5 class="hanna text-white">${member.name }님</h5>
				<span class="nanum text-white" style="font-size: 12px;"> 일반회원
					・ <a href="${pageContext.request.contextPath }/member/memberMypage">마이페이지</a>
				</span>
			</div>
			<!-- 카테고리 프로필 끝 -->
			<!-- 카테고리 리스트 -->
			<div>
				<ul class="nav flex-column">
					<c:choose>
						<c:when test="${sessionNUM != null}">
							<li class="nav-item pt-2 pb-2 ps-4" name="hbtn${status.index}">
								<a class="nav-link text-white"	href="${pageContext.request.contextPath }/member/memberMypage_list">예약목록
							</a>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 카테고리 영역 끝 -->

		<div class="col-10">
			<div class="hboard pt-2 ps-3 pe-3">
				<div class="hboard pt-2 ps-3 pe-3 border">
					<div class="justify-content-center"
						style="border: solid 1px tomato;">
						<h3 class="hanna ps-3 text-center">개인정보</h3>
						<div class="border  justify-content-center ">
							<!-- 내용 -->
							<div class="container">
								<div class="input-form-backgroud row">
									<div class="input-form col-md-12 mx-auto">
										<form class="validation-form" method="post"
											action="updateMypage" enctype="multipart/form-data">
											<div class="row">
												<div class="col-md-6 mb-3">
													<label for="name">이름</label> <input type="text"
														class="form-control" id="name" name="name"
														placeholder="name" value="${member.name }" required>
													<div class="invalid-feedback">이름을 입력해주세요.</div>
												</div>
												<div class="col-md-6 mb-3">
													<label for="nickname">전화번호</label> <input type="text"
														class="form-control" id="tel" name="tel" placeholder="tel"
														value="${member.tel }" required>
													<div class="invalid-feedback">전화번호를 입력해주세요.</div>
												</div>

											</div>

											<div class="mb-3">
												<label for="email">이메일</label> <input type="email"
													class="form-control" id="email" name="email"
													placeholder="you@example.com" value="${member.email }"
													required>
												<div class="invalid-feedback">이메일을 입력해주세요.</div>
											</div>
											<div class="mb-3">

												<img id="View" src="#" alt="" /><br> <label
													for="fileOriName">프로필 사진</label> <input type="file"
													class="form-control" id="fileOriName" name="fileOriName"
													value="fileOriName">
												<div class="invalid-feedback">프로필 사진을 업로드해주세요.</div>
											</div>


											<div class="mb-4"></div>
											<button class="btn btn-primary btn-lg btn-block"
												type="submit">수정하기</button>
										</form>
									</div>
								</div>
								<footer class="my-3 text-center text-small">
									<p class="mb-1">&copy; 2022 YD</p>
								</footer>
							</div>
							<!-- 내용 끝 -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


























<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
<script>
	$(function() {
		$("#fileOriName").on('change', function() {
			readURL(this);
		});
		//---------------------------
		$("#inputGroupFile01")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#View').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

