<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>







<jsp:include page="./sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<div style="height: 80%;">
	<h3 class="hanna m-3 text-center">${sessionNAME }님의 수정페이지</h3>
	<div class="row hDetail justify-content-around" style="height: 100%">
	</div>
</div>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form class="validation-form" method="post" action="updateMypage"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="name"
							value="${member.name }" required>
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
						placeholder="you@example.com" value="${member.email }" required>
					<div class="invalid-feedback">이메일을 입력해주세요.</div>
				</div>
				<div class="mb-3">

					<img id="View" src="#" alt="" /><br> <label for="fileOriName">프로필
						사진</label> <input type="file" class="form-control" id="fileOriName"
						name="fileOriName" value="fileOriName">
					<div class="invalid-feedback">프로필 사진을 업로드해주세요.</div>
				</div>


				<div class="col-3 mb-4" style="float:right;">
				<button class="btn btn-primary btn-lg btn-block" type="submit">수정하기</button>
				
				<button class="btn btn-primary btn-lg btn-block" onclick="location.href='${pageContext.request.contextPath}/meber/memberMypage'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2022 YD</p>
	</footer>
</div>
<!-- 내용 끝 -->


<jsp:include page="./sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
























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

