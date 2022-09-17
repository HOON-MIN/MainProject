<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<article>
<!-- Pills navs -->
<div style="margin-top: 15px;">
<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist" >
  <li class="nav-item" role="presentation" style="height: 60px;" >
    <a class="nav-link active" id="mem-register-form-link" href="#" style="font-size: 25px;">���� �Ϲ�ȸ��</a>
  </li>
  <li class="nav-item" role="presentation" style="height: 60px;">
    <a type="" class="nav-link" id="company-register-form-link"  href="#" style="font-size: 25px;" >����� ����ȸ��</a>
  </li>
</ul>
</div>
<!-- Pills navs -->

<!-- �Ϲ�ȸ������ -->
<div class="tab-content">
    <form id="mem-register-form" role="form">
      <div class="text-center mb-3">
        <h3 style="height: 53px; margin-top: 36px;">Ateam Ȩ�������� ���Ű��� ȯ���մϴ�.</h3>
        <h5 style="height: 25px;">���� ȸ�� �����Ͻ� �� Allcare�� �پ��� ���񽺸� ����������.</h5>
      </div>

      <!-- ȸ�����Թ�ư -->
      <div class="text-center mb-3" style="margin-top: 55px;">
        <a type="button" class="btn btn-primary btn-block mb-4" 
        	href="${mycontext}/member/joinForm" 
        	style="width: 195px; height: 57px; text-align: inherit; font-size: 20px; font-weight: bold; padding-top : 14px;" >
        	�����ϱ�</a>
      </div>
    </form>

    <form id="company-register-form" method="post" action="${pageContext.request.contextPath }/admin/caInsert" role="form">
      <input type="hidden" id="crn" name="crn" value=""> 
      <input type="hidden" id="ccate" name="ccate" value=""> 
      <div class="form_box">
	      <div class="text-center mb-3">
	        <h3 style="height: 53px; margin-top: 36px;">Allcare Ȩ�������� ���Ű��� ȯ���մϴ�.</h3>
    	    <h5 style="height: 25px;">����� ����ȸ�� ���� ������ �Դϴ�.</h5>
      	  </div>
		<div class="col-md-4" style="margin-right: auto; margin-left: 280px; margin-top: 10px;" >
			<div class="form-check form-check-inline">
			  <label class="form-check-label" for="ccate">�������</label>
			  <input class="form-check-input" type="radio" name="ccatev" id="ccatev" value="����" checked="checked">
			</div>	
			<div class="form-check form-check-inline">
			  <label class="form-check-label" for="ccate">�౹���</label>
			  <input class="form-check-input" type="radio" name="ccatev" id="ccatev" value="�౹" >
			</div>	
		</div>	      	  
			<div class="form-group" style=" margin-top: 20px;">
			<input type="text" name="crnv" id="crnv" tabindex="1" class="form-control" required placeholder ="����� ��Ϲ�ȣ 10�ڸ�"
				 style="height: 57px; width: 400px; margin-left: auto; margin-right: auto; text-align: center;" maxlength="10" pattern=".{10,10}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<div class="text-center mb-4">
				<i class="fa" id="confcrn" style="font-size: 17px; padding-top: 15px;" ></i></div>
			</div>
	</div>
	
	<div class="text-center mb-3" style="margin-top: 36px;">
		<p id="bizMsg" class="ability_chk" style="display:none"></p>
		<p class="agreeInfo">������ ������ ���� ���, NICE�������� ������(02-3771-1011)�� ���� ��Ź �帳�ϴ�.
		</p>
                 <p class="agreeInfo"><strong>����� ��ȣ�� �����Ͽ� ���Խ�, ����ó�� ��� �ش�˴ϴ�.</strong></p>
	</div>
      <div class="text-center mb-3" style="margin-top: 30px;">
        <button type="button" id="crnBtn" class="btn btn-primary btn-block mb-4" 
        	style="width: 195px; height: 57px; text-align: inherit; font-size: 20px; font-weight: bold; 
        	padding-top : 14px;" disabled="disabled" >
        	����</button>
      </div>
    </form>
</div>
<!-- Pills content -->
</article>

<script>
var $js = jQuery.noConflict()
$js(function() {
    
	$('#company-register-form').hide();
	
	$js('#mem-register-form-link').click(function(e) {
		$("#mem-register-form").delay(100).fadeIn(100);
 		$("#company-register-form").fadeOut(100);
		$('#company-register-form-link').removeClass('active');
		$(this).addClass('active');
		 e.preventDefault(); 
	});
    	$js('#company-register-form-link').click(function(e) {
    		$("#company-register-form").delay(100).fadeIn(100);
     		$("#mem-register-form").fadeOut(100);
    		$('#mem-register-form-link').removeClass('active');
    		$(this).addClass('active');
    		e.preventDefault();
    	});	
	// db�� ����ڵ�Ϲ�ȣ�� �ߺ��Ǵ��� Ȯ��
		$js('#crnv').focusout(function() {
		let param = $js('#crnv').val();
		console.log("param : " + param);
		$js.ajax({
			url: "${pageContext.request.contextPath}/company/crncheck?crnv="+param,
			success:function(data){
				console.log(data);
				if(data == 1){
					$js('#confcrn').css('color','red').html('����Ʈ�� ��ϵ� ����ڹ�ȣ�Դϴ�.');
					$js('#crnBtn').attr('disabled', true);
				}else{
					$js('#confcrn').css('color','green').html('����Ʈ�� ����� ���� ����ڹ�ȣ�Դϴ�.');
					   // ����� ��Ϲ�ȣ openAPI �ҷ����� ajax()�Լ� �ҷ�����	
					$js('#crnBtn').attr('disabled', false);
					   $js('#crnBtn').click(function() {
								ajax();
							});
						
				}
			}
		});
	});
/* 		var chk = $('input[name="ccate"]:checked').val();
		console.log('chk : '+chk); 
		$('input[type="radio"][name="ccate"]').click(function() {
			var chk1 = $('input[name="ccate"]:checked').val();
			console.log('click chk1 : '+chk1); 
		}); */
/* 	$('input[type="checkbox"][name="ccate"]').click(function() {
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="ccate"]').prop('checked', false);
			$(this).prop('checked', true);
			const chk = $('input[type="checkbox"][name="ccate"]').prop('checked');
			console.log('chk : '+chk); 
		}
	}); */
	
    	
    	
 
});
 	//var array = []; 
 	//array.push("3988701116");
 	//'#crn').val()
	//data.b_no = array; */ // b_no�� => key || crn�� value ����ڹ�ȣ 
	//var data1 ="{\"b_no\" : [3988701116]}";
	
     // var data = {
	//   		 "b_no": ["3988701116"] // �̷����ؼ� data������ �߳���
	//};  
     
    // ���������� ���л���Ʈ���� ����û_����ڵ������ ����Ȯ�� �� ������ȸ ���� open Api��� 
	function ajax(){
    	var cate = $('input[name="ccatev"]:checked').val();
		var num = $('#crnv').val();
	 	var data = '{"b_no":["'+num+'"]}';
	 	var sKey = "nfny9fgEcFysNpZT/WcPRTtJ3F86RlxpeJkFRVxGWsXmNCJYWNPSWeF4NcUBsoqRCu9YBj9S2lG0N8727L0CQw==";	  
		console.log("������ data : "+data);
	$.ajax({
	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="+sKey,  // serviceKey ���� xxxxxx�� �Է�
	  type: "POST",
	  data: data,
	  //data: JSON.stringify(data), // json �� string���� ��ȯ�Ͽ� ����
	  dataType: "JSON",
	  contentType: "application/json",
	  accept: "application/json",
	  success: function(result) {
		  //console.log("Ÿ��"+typeof(JSON.stringify(data_1)));
		 // console.log("Ÿ��"+JSON.stringify(data_1));
		  console.log(typeof(data));
		  console.log("������Է¹�ȣ"+$('#crn').val());
	      console.log("������ data : "+data);
	      console.log(result);
	      console.log(result.data[0].tax_type);
	      
	      if(result.data[0].tax_type === "����û�� ��ϵ��� ���� ����ڵ�Ϲ�ȣ�Դϴ�."){
	    	  if(result.data[0].b_no === "3988701111"){ // ��¥ �����Ϲ�ȣ
	    		  /*  $('#confcrn').css('color','green').html('�� �����Ǿ����ϴ�.');
		      		var chk = $('#crn').val(num);
		      		console.log("delaybefore num : "+num);
		      	 	setTimeout(function() {
		    		  console.log("submit num : "+num);
		    		  $('#crn').val(num);
		    		  $('#company-register-form').submit();
		    		  return true;
		    	}, 3000); */
	    	  }else{
		    	  $('#confcrn').css('color','red').html('X ����û�� ��ϵ��� ���� ����ڵ�Ϲ�ȣ�Դϴ�.');
		    	  let reset = "";
		    	  $('#crnv').val(reset);
		    	  $js('#crnBtn').attr('disabled', true);
		    	  return false;
	    	  }
	      }
	      $('#confcrn').css('color','green').html('�� �����Ǿ����ϴ�.');
	      		console.log("delaybefore num : "+num);
	      		console.log("delaybefore cate : "+cate);
	      	setTimeout(function() {
	    		  console.log("submit num : "+num);
	    		  $('#crn').val(num);
	    		  $('#ccate').val(cate);
	    		  if(cate === '����'){
	    		 	 $('#company-register-form').attr("action","${mycontext}/hospital/joinHospitalForm");
	    		 		 alert('���� ��� �������� �̵��մϴ�.');
	    		 	 $('#company-register-form').submit();
	    		  }else{
	    		  $('#company-register-form').attr("action","${mycontext}/pharmacy/joinPharmacyForm");
	    			  alert('�౹ ��� �������� �̵��մϴ�.');
	    		  $('#company-register-form').submit();
	    		  }
	    		  return true;
	    	}, 2000);	
	      	
	  },
	  error: function(result) {
	      console.log(result.responseText); //responseText�� �����޼��� Ȯ��
	  }
	});
	}	 
	 

</script>



