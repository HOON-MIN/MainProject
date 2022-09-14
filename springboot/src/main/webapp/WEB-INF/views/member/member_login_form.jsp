<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<body style="background: #d5f7ef">
	<div class="container" id="login-div">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
						
						<form id="login-form" action="#" method="post">
							<div class="form-floating mb-3">
								<input type="radio" name="cate" id="choose1" value="1" /><span class="up">일반</span><br>
								<input type="radio" name="cate" id="choose2" value="2"/> <span class="up">의사</span>
									
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="id"> <label for="id">ID</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="pwd" name="pwd"
									placeholder="********"> <label for="floatingPassword">Password</label>
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-login text-uppercase fw-bold"
									style="font-size: 0.9rem; letter-spacing: 0.05rem; padding: 0.75rem 1rem;"
									type="button" id="loginBtn">Sign in</button>
							</div>
							<hr class="my-4">
							<div class="d-grid mb-2">
								<button class="btn btn-kakao btn-login text-uppercase fw-bold"
									type="submit">
									<i class="fab fa-google me-2"></i> Sign in with Kakao
								</button>
							</div>
							<div class="d-grid">
								<button class="btn btn-naver btn-login text-uppercase fw-bold"
									type="submit">
									<i class="fab fa-facebook-f me-2"></i> Sign in with Naver
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function() {
	var choose = $('input:radio[name="cate"]:checked','#login-form').val(); 
	
$('#loginBtn').click(function(){
	var id = $('#id').val();
	var pwd = $('#pwd').val();
	
	console.log("id = >"+id);
	console.log("pwd = >"+pwd);
	console.log("choose_val2 = >"+$('input:radio[name="cate"]:checked','#login-form').val());
	console.log();    
	if($('input:radio[name="cate"]:checked','#login-form').val() == 1){
	$.ajax({
		url: "idchk",
		type:"POST",
		dataType:"text",
		data:"id="+ id +"&pwd="+pwd,
	 success : function(data) {
         if (data == 0) {
        	 console.log('data => ' + data);
              alert('로그인에 실패하였습니다.')
              //$('#login-form').attr("action","${pageContext.request.contextPath}/member/memberLoginForm")
              //$('#login-form').attr("action","${pageContext.request.contextPath}/member/memberLoginForm").submit();
          } else {
              $('#login-form').attr("action","memberLogin").submit();
          }
		 }	
  		})
	}else{
		$.ajax({
			url: "${pageContext.request.contextPath}/doctor/idchk",
			type:"POST",
			dataType:"text",
			data:"did="+ id +"&dpwd="+pwd,
		 success : function(data) {
	         if (data == 0) {
	        		console.log("id = >"+id);
	        		console.log("pwd = >"+pwd);
	              alert('로그인에 실패하였습니다.')
	              //$('#login-form').attr("action","${pageContext.request.contextPath}/member/memberLoginForm")
	              //$('#login-form').attr("action","${pageContext.request.contextPath}/member/memberLoginForm").submit();
	          } else {
	        	  
	             // $('#login-form').attr("action","${pageContext.request.contextPath}/doctor/doctorLogin").submit();
	              $('#login-form').attr("action","${pageContext.request.contextPath}/doctor/doctorLogin");
	              $('#id').attr({'name':'did'});
	              $('#pwd').attr({'name':'dpwd'});
	              $('#login-form').submit();
	          }
			 }	
	  		})
		}
	});
});
	

</script>


