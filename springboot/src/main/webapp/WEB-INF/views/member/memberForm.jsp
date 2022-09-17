<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- ���� ����  --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<article >
<div class="page-header">
		<center>
			<h1>
				<a onclick="return false; location.reload()"
					style="cursor: pointer;"><b>ȸ������</b></a>
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
					<label for="id" class="form-label">���̵�</label> 
			<div class="input-group" >
					<input type="text" class="form-control" id="id" name="id" placeholder="INPUT YOUR ID"
					 required="required" pattern=".{2,10}" >
					<button class="btn btn-outline-secondary" type="button" id="id-check" style="margin-left: 19px;">�ߺ�Ȯ��</button>
			</div>
			</div>
			<div class="col-md-4">
				<p style="margin-top: 42px;"> </p>
				<i id="id-check-warn" style="margin-top: 5px; "></i>
			</div>
			<div class="col-md-6">
				<label for="mnum" class="form-label">��й�ȣ</label> 
				<input type="password"
					class="form-control" id="pwd" name="pwd" placeholder="YOUR PASSWORD"
					 required="required" pattern=".{2,20}">
			</div>
			<div class="col-md-6">
				<label for="mnum" class="form-label">��й�ȣȮ��</label> 
				<input type="password"
					class="form-control" id="pwd2" name="pwd2" placeholder="PASSWORD CHECK"
					required="required" pattern=".{2,20}"><i class="fa" id="confpwd"></i>
			</div>	
			 <div class="col-md-4">
			    <label for="mname" class="form-label">�̸�</label>
			    <input type="text" class="form-control" id="name" name="name" placeholder="�̸��� �Է��ϼ���" required>
			    <div class="valid-feedback">
			    </div>
			    <div class="invalid-feedback">
			       	�̸��� �Է��ϼ���.
			    </div>
			  </div>
			  <div class="col-md-4">
				<div class="form-outline">
						<label class="form-label">�ֹε�Ϲ�ȣ</label>
					<input type="text" id="ssn1" name="ssn1" class="form-control" required placeholder="������� 6�ڸ� �Է�"
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
				<label class="form-label">�̸���</label> 
					<input type="email" class="form-control" id="email" name="email" placeholder="name@example.com"
					required="required">
				<button class="btn btn-outline-secondary" type="button" id="mail-check">
					<i class="fa fa-search"></i>������ȣ����</button>
			</div>

			<div class="col-md-6">
				<label class="form-label">������ȣ�Է�</label>
				<input type="text" class="form-control" id="certi-input" name="certi-input" 
					placeholder="������ȣ 6�ڸ�" disabled="disabled" maxlength="6"/>
				<span id="mail-check-warn" class="mb-2"></span>
			</div>
			<div class="col-md-6">
				<label class="form-label">������ ���� ���</label> 
				<input type="file" class="form-control" id="mfile" name="mfile">
			<img style="width: 100%; margin-top: 8px;" src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx">		
			</div>			
			  <div class="col-md-6">
			    <label class="form-label">��ȭ��ȣ</label>
			    <input type="tel" class="form-control" id="telv" name="telv" placeholder="-���� �Է�" required 
			    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="11">
			  </div>			
			
			
			 <label class="form-label" style="text-align: justify;" >�ּ�</label>
			<div class="col-md-4">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="�����ȣ">
			</div>
			<div class="col-md-3">
				<input type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
			</div>
			<div class="col-md-8">
				<input type="text" class="form-control" id="addr1" name="addr1" placeholder="�ּ�"><br>
			</div>
			<div class="col-md-4">
				<input type="text" class="form-control" id="addr2" name="addr2" placeholder="���ּ�">
			</div>
			<div class="form-group text-center">
				<button type="submit" id="join-submit" class="btn btn-primary btn-space" disabled="disabled">
					ȸ������<i class="fa fa-check spaceLeft"></i>
				</button>

				<button type="button" class="btn btn-danger"
					onClick="location.href='/ateamfinal/main'">
					���<i class="fa fa-check spaceLeft"></i>
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
		const eamil = $js('#email').val(); // �̸��� �ּҰ� ������!
		console.log('�ϼ��� �̸��� : ' + eamil); // �̸��� ������ Ȯ��
		const checkInput = $js('#certi-input') // ������ȣ �Է��ϴ°� 
		
		$js.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/member/mailCheck?email='+eamil,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('������ȣ�� ���۵Ǿ����ϴ�.')
			}
		}); // end ajax
	}); // end send eamil

	// ������ȣ ��
	// blur -> focus�� ��� ��� �߻�
	$js('#certi-input').blur(function() {
		const inputCode = $js(this).val();
		const $resultMsg = $js('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('������ȣ�� ��ġ�մϴ�.');
			$resultMsg.css('color','green');
			$js('#mail-check').attr('disabled', true);
			$js('#email').attr('readonly', true);
			$js('#certi-input').attr('readonly', true);
			$js('#join-submit').attr('disabled', false);
		}else{
			$resultMsg.html('������ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���!');
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
					$js('#id-check-warn').css('color','red').html('�̹� ������� ���̵��Դϴ�.');
				}else{
					$js('#id-check-warn').css('color','green').html('��� ������ ���̵��Դϴ�.');
				}
			}
		});
	});
$(function() {
	var pwdchk = false;
	  $('#pwd2').blur(function(){
		    if($('#pwd').val() === $('#pwd2').val()){
		      $('#confpwd').css('color','green').html('�� ��й�ȣ ��ġ�մϴ� ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X ��й�ȣ ��ġ���� �ʽ��ϴ� ');
		      pwdchk = false;
		    }
		  });
	  $('#pwd').blur(function(){
		    if($('#pwd').val() === $('#pwd2').val()){
		      $('#confpwd').css('color','green').html('�� ��й�ȣ ��ġ�մϴ� ');
		      pwdchk = true;
		    }else{
		      $('#confpwd').css('color','red').html('X ��й�ȣ ��ġ���� �ʽ��ϴ� ');
		      pwdchk = false;
		    }
		  });	 
	  
	 
		// �ֹι�ȣ, ��ȭ��ȣ, �ּ�
		
		$('#memberForm').submit(function(event){
			event.preventDefault();
			
			if($('#ssn1').val().length==0 || $('#ssn2').val().length==0 || $('#telv').val().length==0 || 
			   $('#email').val().length==0 || $('#addr1').val().length==0 || $('#addr2').val().length==0){
				alert("�Էµ��� ���� ������ �����մϴ�.");
				return false;
			}
			    const ssn = $('#ssn1').val()+'-'+$('#ssn2').val();
				var telv= $('#telv').val();
				const addr = $('#addr1').val()+" "+$('#addr2').val();
				
				$('#addr').val(addr); 
				$('#ssn').val(ssn);	//�ֹι�ȣ ������ �߰�
				$('#tel').val(telv.substring(0,3)+"-"+telv.substring(3,7)+"-"+telv.substring(7)); //��ȭ��ȣ ������ �߰�
				console.log("addr"+addr);
				// alert($('#ssn').val()+" : "+$('#id').val()+" : "+$('#tel').val());
				alert('ȸ�����Կ� �����ϼ̽��ϴ�.');
				this.submit();
				return true;	
		});	 
	  
	  $('#mfile').change(function() {
		console.log($(this).val());
		readURL(this);
	  });
	});
	// �̹��� �̸�����
	function readURL(input) {
		if (input.files && input.files[0]) {
			// �ڹٽ�ũ��Ʈ I/O 
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

	
	
	// �ּ� ã�� api
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("addr2").focus();
            }
        }).open();
    }	
</script>
<%-- ���� �� --%>