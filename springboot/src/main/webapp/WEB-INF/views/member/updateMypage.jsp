<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <form method="post" action="upload" enctype="multipart/form-data">
<input type="file" name="fileOriName"><br>
<input type="submit">
</form> -->
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" method="post" action="updateMypage" enctype="multipart/form-data">
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
					<div class="mb-3" id="img_res" style="width: 100px; height: 80px;">
						<img src="${pageContext.request.contextPath }/profimg/${member.profimg}">
					</div>
					<div class="mb-3">
						<label for="fileOriName">프로필 사진</label> <input type="file"
							class="form-control" id="fileOriName" name="profimg"
							value="fileOriName">
						<div class="invalid-feedback">프로필 사진을 업로드해주세요.</div>
					</div>


					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 YD</p>
		</footer>
	</div>


</body>
</html>