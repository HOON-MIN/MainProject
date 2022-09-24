<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="mycontext" value="${pageContext.request.contextPath}"/>     
<%-- 본문 시작  --%>
<jsp:include page="../mypage/sidebar/sidebar_header.jsp" flush="true"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<article >
<div class="page-header">
		<center>
			<h1>
				<a onclick="return false; location.reload()"
					style="cursor: pointer;"><b>의사등록</b></a>
			</h1>
		</center>
		<div class="col-md-6 col-md-offset-3"></div>
	</div>

<!--dnum,hnum,dname,did,dpwd,dmajor  -->	
<form action="" method="post" id="joinDoctor">
		<input type="hidden" id="cnum" name="cnum" value="${vo.cnum}"> 
		<div class="row g-3 needs-validation ">
			<div class="col-md-7" style="width: 64%;">
					<label for="id" class="form-label">아이디</label> 
			<div class="input-group" >
					<input type="text" class="form-control" id="did" name="did" placeholder="INPUT YOUR ID"
					 required="required" pattern=".{2,10}" >
					<button class="btn btn-outline-secondary" type="button" id="id-check" style="margin-left: 19px;">중복확인</button>
			</div>
			</div>
			<div class="col-md-4">
				<p style="margin-top: 42px;"> </p>
				<i id="id-check-warn" style="margin-top: 5px; "></i>
			</div>
			<div class="col-md-6">
				<label for="dpwd" class="form-label">비밀번호</label> 
				<input type="password"
					class="form-control" id="dpwd" name="dpwd" placeholder="YOUR PASSWORD"
					 required="required" pattern=".{2,20}">
			</div>
			<div class="col-md-6">
				<label for="dpwd2" class="form-label">비밀번호확인</label> 
				<input type="password"
					class="form-control" id="dpwd2" name="dpwd2" placeholder="PASSWORD CHECK"
					required="required" pattern=".{2,20}"><i class="fa" id="confpwd"></i>
			</div>	
			 <div class="col-md-4">
			    <label for="dname" class="form-label">이름</label>
			    <input type="text" class="form-control" id="dname" name="dname" placeholder="이름을 입력하세요" required>
			    <div class="valid-feedback">
			    </div>
			    <div class="invalid-feedback">
			       	이름을 입력하세요.
			    </div>
			  </div>
		<div class="col-md-4">
			<div class="form-outline">
				<label class="form-label">진료과목</label>
			    <input type="text" class="form-control" id="dmajor" name="dmajor" value="${vo.hcate}" readonly="readonly">
			</div>
		</div>		
		<div class="col-md-6"  style="padding: 10px;">
				<label class="form-label">프로필 사진 등록</label> 
				<div class="col-md-4">
			<img style="width: 100%; margin-top: 8px;" src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx">
			</div>		
				<input type="file" class="form-control" id="mfile" name="mfile">
				
			</div>
						
			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary btn-space" >
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>

				<button type="button" class="btn btn-danger"
					onClick="location.href='/ateamfinal/main'">
					취소<i class="fa fa-check spaceLeft"></i>
				</button>

			</div>
		</div>
	</form>
 <!-- comment end -->
    </article>
    <jsp:include page="../mypage/sidebar/sidebar_footer.jsp" flush="true"></jsp:include>
    <script>
	var $js = jQuery.noConflict()
	// did 중복체크
	$js('#id-check').click(function() {
		let param = $js('#did').val();
		$js.ajax({
			url: "drIdCheck?did="+param,
			success:function(data){
				console.log(data);
				
				if(data == 1){
					$js('#id-check-warn').css('color','red').html('이미 사용중인 아이디입니다.');
				}else{
					$js('#id-check-warn').css('color','green').html('사용 가능한 아이디입니다.');
				}
			}
		});
	});
$(function() {
	var pwdchk = false;
	  $('#dpwd2').blur(function(){
		    if($('#dpwd').val() === $('#dpwd2').val()){
		      $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
		      pwdchk = false;
		    }
		  });
	  $('#dpwd').blur(function(){
		    if($('#dpwd').val() === $('#dpwd2').val()){
		      $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
		      pwdchk = false;
		    }
	  });
      //직접입력 인풋박스 기존에는 숨어있다가
     /* $("#directlabel").hide();
      $("#selboxDirect").hide();
      $("#selbox").change(function() {
            //직접입력을 누를 때 나타남
    		if($("#selbox").val() === "direct") {
    			$("#directlabel").show();
    			$("#selboxDirect").show();
    			
    		}  else {
    			$("#directlabel").hide();
    			$("#selboxDirect").hide();
    		}
    	}) */
  // <!--dnum,hnum,dname,did,dpwd,dmajor  -->  
    $('#join-submit').click(function() {
    	if($('#dname').val().length==0 || $('#did').val().length==0 || $('#dpwd').val().length==0 || 
				   $('#dmajor').val().length==0 ){
					alert("입력되지 않은 정보가 존재합니다.");
					console.log('dname : '+$('#dname').val());
					console.log('did : '+$('#did').val());
					console.log('dpwd : '+$('#dpwd').val());
					console.log('dmajor : '+$('#dmajor').val());
					return false;
		}else if($('#didchk').val() == 0){
			alert("아이디 중복체크를 해주세요!");
			return false;
		}else{
			$('#joinDoctor').attr("action", "${mycontext}/doctor/addDoctor");
			$('#joinDoctor').submit(function() {
			alert('등록에 성공하셨습니다.');	
			return true;
			});
			
		}
			
			
    });
    
		 
	
		
    $('#imgx').css('display', 'none');
    $('#mfile').change(function() {
		console.log($(this).val());
		readURL(this);
		$('#imgx').css('display', 'block');
	  });
	});
function readURL(input) {
	if (input.files && input.files[0]) {
		// 자바스크립트 I/O 
		var reader = new FileReader();
		//
		reader.onload = function(e) {
			//e.target.result
			console.log("Path :" + e.target.result);
			$('#imgx').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	}

</script>
<%-- 본문 끝 --%>