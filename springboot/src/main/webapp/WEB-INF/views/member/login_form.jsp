<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="/taejin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


<!-- Custom styles for this template-->
<link href="/taejin/css/sb-admin-2.min.css" rel="stylesheet">

<div  style="height: 100%;">
	<div class="row justify-content-around" style="height: 100%; background: #3478f5;">
	<div class="container" style="background-color: 80a7ce;">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xzl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form id="login-form" action="#" method="post">
										<div class="form-group">
											<input type="radio" name="cate" id="choose1" value="1"	checked="checked" /> <span class="up"> 일반 </span> 
											<input type="radio" name="cate" id="choose2" value="2" /><span	class="up"> 의사 </span> 
											<input type="radio" name="cate"	id="choose3" value="3" /><span class="up"> 사업자 </span>
										</div>
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="id" name="id" placeholder="ID">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="pwd" name="pwd" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember	Me</label>
											</div>
										</div>
										<input type="button"
											class="btn btn-primary btn-user btn-block" id="loginBtn"
											value="Login">
										<hr>
										<a href="https://kauth.kakao.com/oauth/authorize?client_id=9dccb2506523629f6ab9df1594435577&redirect_uri=http://localhost:83/member/auth/kakao/callback&response_type=code" class="btn btn-google btn-user btn-block" style="background-color: 	#f9e000;">
											Login with KaKao
										</a> <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=OBHzshEvvkK9IWFlTExv&state=maina&redirect_uri=http://localhost:83/member/auth/naver/callback" class="btn btn-facebook btn-user btn-block" style="background-color: #1ec800">
											Login with Naver
										</a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Forgot
											Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.html">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/taejin/vendor/jquery/jquery.min.js"></script>
	<script src="/taejin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/taejin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/taejin/js/sb-admin-2.min.js"></script>
	<script>
		const input = document.querySelector('#login-form');
		input.addEventListener('keypress', function(e) {
			if (e.code == 'Enter') {
				login();
			}
		});
		$('#loginBtn').click(function() {
			login();
		})

		function login() {
			var choose = $('input:radio[name="cate"]:checked', '#login-form')
					.val();

			var id = $('#id').val();
			var pwd = $('#pwd').val();

			console.log("choose_val2 = >"+ $('input:radio[name="cate"]:checked', '#login-form').val());
			if ($('input:radio[name="cate"]:checked', '#login-form').val() == 1) {
				$.ajax({
					url : "idchk",
					type : "POST",
					dataType : "text",
					data : "id=" + id + "&pwd=" + pwd,
					success : function(data) {
						if (data == 0) {
							console.log('data => ' + data);
							alert('로그인에 실패하였습니다.')
						} else {
							$('#login-form').attr("action", "memberLogin").submit();
						}
					}
				})
			} else if ($('input:radio[name="cate"]:checked', '#login-form').val() == 2) {
				$.ajax({
							url : "${pageContext.request.contextPath}/doctor/idchk",
							type : "POST",
							dataType : "text",
							data : "did=" + id + "&dpwd=" + pwd,
							success : function(data) {
								if (data == 0) {
									console.log('data => ' + data);
									alert('로그인에 실패하였습니다.')
								} else {
									$('#id').attr({
										'name' : 'did'
									});
									$('#pwd').attr({
										'name' : 'dpwd'
									});
									$('#login-form').attr("action","${pageContext.request.contextPath}/doctor/doctorLogin").submit();
								}
							}
						})
			} else {
				$.ajax({
							url : "${pageContext.request.contextPath}/company/idchk",
							type : "POST",
							dataType : "text",
							data : "crn=" + id + "&cpwd=" + pwd,
							success : function(data) {
								if (data == 0) {
									console.log("crn = >" + id);
									console.log("cpwd = >" + pwd);
									alert('로그인에 실패하였습니다.')
								} else {

									$('#id').attr({
										'name' : 'crn'
									});
									$('#pwd').attr({
										'name' : 'cpwd'
									});
									$('#login-form').attr("action",	"${pageContext.request.contextPath}/company/companyLogin").submit();

								}
							}
						})
			}

		}
	</script>
	

