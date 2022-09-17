<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- 본문 시작  --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<article >
<div class="page-header">
		<center>
			<h1>
				<a onclick="return false; location.reload()"
					style="cursor: pointer;"><b>회원가입</b></a>
			</h1>
		</center>
		<div class="col-md-6 col-md-offset-3"></div>
	</div>

	
<form action="addMember" method="post" id="memberForm"  enctype="multipart/form-data">
		<input type="hidden" id="ssn" name="ssn" value=""> 
		<input type="hidden" id="tel" name="tel" value=""> 
		<input type="hidden" id="addr" name="addr" value=""> 
		<div class="row g-3 needs-validation ">
			<div class="col-md-7" style="width: 64%;">
					<label for="id" class="form-label">아이디</label> 
			<div class="input-group" >
					<input type="text" class="form-control" id="id" name="id" placeholder="INPUT YOUR ID"
					 required="required" pattern=".{2,10}" >
					<button class="btn btn-outline-secondary" type="button" id="id-check" style="margin-left: 19px;">중복확인</button>
			</div>
			</div>
			<div class="col-md-4">
				<p style="margin-top: 42px;"> </p>
				<i id="id-check-warn" style="margin-top: 5px; "></i>
			</div>
			<div class="col-md-6">
				<label for="mnum" class="form-label">비밀번호</label> 
				<input type="password"
					class="form-control" id="pwd" name="pwd" placeholder="YOUR PASSWORD"
					 required="required" pattern=".{2,20}">
			</div>
			<div class="col-md-6">
				<label for="mnum" class="form-label">비밀번호확인</label> 
				<input type="password"
					class="form-control" id="pwd2" name="pwd2" placeholder="PASSWORD CHECK"
					required="required" pattern=".{2,20}"><i class="fa" id="confpwd"></i>
			</div>	
			 <div class="col-md-4">
			    <label for="mname" class="form-label">이름</label>
			    <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" required>
			    <div class="valid-feedback">
			    </div>
			    <div class="invalid-feedback">
			       	이름을 입력하세요.
			    </div>
			  </div>
			  <div class="col-md-4">
				<div class="form-outline">
						<label class="form-label">주민등록번호</label>
					<input type="text" id="ssn1" name="ssn1" class="form-control" required placeholder="생년월일 6자리 입력"
							maxlength="6" pattern=".{6,6}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 
				</div>
			</div>
			<div class="col-md-1"
				style="width: 10px; text-align: center;">
				<label style="margin-top: 40px;"><b> - </b></label>
			</div>
			<div class="col-md-1">
				<div class="form-outline">
					<input type="text" id="ssn2" name="ssn2" oninput="this.value = this.value.replace(/[^1-4.]/g, '').replace(/(\..*)\./g, '$1');"
						class="form-control" maxlength="1" style="margin-top: 32.5px;" required/>
				</div>
			</div>
			<div class="col-md-2">
				<label style="margin-top: 42px;  font-size: 25px;" ><strong>* * * * * *</strong></label>
			</div>		
						
			<div class="col-md-6">
				<label class="form-label">이메일</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="name@example.com"
					required="required">
				<button class="btn btn-outline-secondary" type="button" id="mail-check">
					<i class="fa fa-search"></i>인증번호전송</button>
			</div>

			<div class="col-md-6">
				<label class="form-label">인증번호입력</label>
				<input type="text" class="form-control" id="certi-input" name="certi-input" 
					placeholder="인증번호 6자리" disabled="disabled" maxlength="6"/>
				<span id="mail-check-warn" class="mb-2"></span>
			</div>
			<div class="col-md-6">
				<label class="form-label">프로필 사진 등록</label> 
				<input type="file" class="form-control" id="mfile" name="mfile">
			<img style="width: 100%; margin-top: 8px;" src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx">		
			</div>			
			  <div class="col-md-6">
			    <label class="form-label">전화번호</label>
			    <input type="tel" class="form-control" id="telv" name="telv" placeholder="-없이 입력" required 
			    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="11">
			  </div>			
			
			
			 <label class="form-label" style="text-align: justify;" >주소</label>
			<div class="col-md-4">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
			</div>
			<div class="col-md-3">
				<input type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소"><br>
			</div>
			<div class="col-md-4">
				<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
			</div>
			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary btn-space" disabled="disabled">
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
    <script>
	var $js = jQuery.noConflict()
	
	//Email Ajax
	$js('#mail-check').click(function() {
		const eamil = $js('#email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $js('#certi-input') // 인증번호 입력하는곳 
		
		$js.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/member/mailCheck?email='+eamil,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}
		}); // end ajax
	}); // end send eamil

	// 인증번호 비교
	// blur -> focus가 벗어날 경우 발생
	$js('#certi-input').blur(function() {
		const inputCode = $js(this).val();
		const $resultMsg = $js('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$js('#mail-check').attr('disabled', true);
			$js('#email').attr('readonly', true);
			$js('#certi-input').attr('readonly', true);
			$js('#join-submit').attr('disabled', false);
		}else{
			$resultMsg.html('인증번호가 일치하지 않습니다. 다시 확인해주세요!');
			$resultMsg.css('color', 'red');
		}
	});
	
	$js('#id-check').click(function() {
		let param = $js('#id').val();
		$js.ajax({
			url: "idchk?id="+param,
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
	  $('#pwd2').blur(function(){
		    if($('#pwd').val() === $('#pwd2').val()){
		      $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
		      pwdchk = false;
		    }
		  });
	  $('#pwd').blur(function(){
		    if($('#pwd').val() === $('#pwd2').val()){
		      $('#confpwd').css('color','green').html('√ 비밀번호 일치합니다 ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X 비밀번호 일치하지 않습니다 ');
		      pwdchk = false;
		    }
		  });	 
	  
	 
		// 주민번호, 전화번호, 주소
		
		$('#memberForm').submit(function(event){
			event.preventDefault();
			
			if($('#ssn1').val().length==0 || $('#ssn2').val().length==0 || $('#telv').val().length==0 || 
			   $('#email').val().length==0 || $('#addr1').val().length==0 || $('#addr2').val().length==0){
				alert("입력되지 않은 정보가 존재합니다.");
				return false;
			}
			    const ssn = $('#ssn1').val()+'-'+$('#ssn2').val();
				var telv= $('#telv').val();
				const addr = $('#addr1').val()+" "+$('#addr2').val();
				
				$('#addr').val(addr); 
				$('#ssn').val(ssn);	//주민번호 하이픈 추가
				$('#tel').val(telv.substring(0,3)+"-"+telv.substring(3,7)+"-"+telv.substring(7)); //전화번호 하이픈 추가
				console.log("addr"+addr);
				// alert($('#ssn').val()+" : "+$('#id').val()+" : "+$('#tel').val());
				alert('회원가입에 성공하셨습니다.');
				this.submit();
				return true;	
		});	 
	  
	  $('#mfile').change(function() {
		console.log($(this).val());
		readURL(this);
	  });
	});
	// 이미지 미리보기
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

	
	
	// 주소 찾기 api
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }	
</script>
<%-- 본문 끝 --%>