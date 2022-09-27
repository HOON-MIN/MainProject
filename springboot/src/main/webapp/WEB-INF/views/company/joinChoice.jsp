<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mycontext" value="${pageContext.request.contextPath }"></c:set>
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
}

a {
	text-decoration: none;
	color: white;
}
</style>

<div class="container-fluid">


	<!-- 컨텐츠 (연회색배경) -->
	<div class="col-10 flex-column" style="margin:auto;">
		<div class="hboard pt-2 ps-3 pe-3 pb-3">
			<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
<!-- Pills navs -->
				<div style="margin-top: 15px;">
					<ul class="nav nav-pills nav-justified mb-3" id="ex1"
						role="tablist">
						<li class="nav-item" role="presentation" style="height: 60px;">
							<a class="nav-link active" id="mem-register-form-link" href="#"
							style="font-size: 25px;">개인 일반회원</a>
						</li>
						<li class="nav-item" role="presentation" style="height: 60px;">
							<a type="" class="nav-link" id="company-register-form-link"
							href="#" style="font-size: 25px;">사업자 병원회원</a>
						</li>
					</ul>
				</div>
				<!-- Pills navs -->
				<!-- 일반회원가입 -->
				<div class="tab-content"style="height: 500px;">

					
						<div class="text-center mt-5">
							<h3 style="height: 53px; margin-top: 36px;">Ateam 홈페이지에 오신것을
								환영합니다.</h3>
							<h5 style="height: 25px;">지금 회원 가입하신 후 Allcare의 다양한 서비스를
								만나보세요.</h5>
						

						<!-- 회원가입버튼 -->
						<div class="text-center mb-3" style="margin-top: 40px;">
							<form id="mem-register-form" role="form">

								<a type="button" class="btn btn-primary mb-4"
									href="${mycontext}/member/joinForm"
									style="width: 195px; height: 57px; text-align: inherit; font-size: 20px; font-weight: bold; padding-top: 14px;">
									가입하기</a>
							</form>
						</div>

					</div>
					<form id="company-register-form" method="post"
						action="${pageContext.request.contextPath }/admin/caInsert"
						role="form">
						<input type="hidden" id="crn" name="crn" value=""> <input
							type="hidden" id="ccate" name="ccate" value="">
						<div class="form_box">
							<div class="text-center mb-3">
								<h3 style="height: 53px; margin-top: 36px;">Allcare 홈페이지에
									오신것을 환영합니다.</h3>
								<h5 style="height: 25px;">사업자 병원회원 가입 페이지 입니다.</h5>
							</div>
							<div class="col-md-4"
								style="margin-right: auto; margin-left: 280px; margin-top: 10px;">
								<div class="form-check form-check-inline">
									<label class="form-check-label" for="ccate">병원등록</label> <input
										class="form-check-input" type="radio" name="ccatev"
										id="ccatev" value="병원" checked="checked">
								</div>
								<div class="form-check form-check-inline">
									<label class="form-check-label" for="ccate">약국등록</label> <input
										class="form-check-input" type="radio" name="ccatev"
										id="ccatev" value="약국">
								</div>
							</div>
							<div class="form-group" style="margin-top: 20px;">
								<input type="text" name="crnv" id="crnv" tabindex="1"
									class="form-control" required placeholder="사업자 등록번호 10자리"
									style="height: 57px; width: 400px; margin-left: auto; margin-right: auto; text-align: center;"
									pattern=".{10,10}">
								<!-- 				 style="height: 57px; width: 400px; margin-left: auto; margin-right: auto; text-align: center;" maxlength="10" pattern=".{10,10}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -->
								<div class="text-center mb-4">
									<i class="agreeInfo" id="confcrn"
										style="font-size: 17px; padding-top: 15px;"></i>
								</div>
							</div>
						</div>

						<div class="text-center mb-3" style="margin-top: 36px;">
							<p id="bizMsg" class="ability_chk" style="display: none"></p>
							<p class="agreeInfo">인증에 문제가 있을 경우, NICE평가정보㈜
								고객센터(02-3771-1011)로 문의 부탁 드립니다.</p>
							<p class="agreeInfo">
								<strong>사업자 번호를 도용하여 가입시, 형사처벌 대상에 해당됩니다.</strong>
							</p>
						</div>
						<div class="text-center mb-3" style="margin-top: 30px;">
							<button type="button" id="crnBtn"
								class="btn btn-primary btn-block mb-4"
								style="width: 195px; height: 57px; text-align: inherit; font-size: 20px; font-weight: bold; padding-top: 14px;"
								disabled="disabled">인증</button>
						</div>
					</form>
				</div>
		</div>
	</div>
	<!-- 컨텐츠 영역 끝 -->
</div>

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
		// db에 사업자등록번호와 중복되는지 확인
		$js('#crnv')
				.focusout(
						function() {
							let param = $js('#crnv').val();
							console.log("param : " + param);
							$js
									.ajax({
										url : "${pageContext.request.contextPath}/company/crncheck?crnv="
												+ param,
										success : function(data) {
											console.log(data);
											if (data == 1) {
												$js('#confcrn').css('color',
														'red').html(
														'사이트에 등록된 사업자번호입니다.');
												$js('#crnBtn').attr('disabled',
														true);
											} else {
												$js('#confcrn')
														.css('color', 'green')
														.html(
																'사이트에 등록지 않은 사업자번호입니다.');
												// 사업자 등록번호 openAPI 불러오는 ajax()함수 불러오기	
												$js('#crnBtn').attr('disabled',
														false);
												$js('#crnBtn').click(
														function() {
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
	//data.b_no = array; */ // b_no는 => key || crn은 value 사업자번호 
	//var data1 ="{\"b_no\" : [3988701116]}";

	// var data = {
	//   		 "b_no": ["3988701116"] // 이렇게해서 data보내면 잘나옴
	//};  

	// 공공데이터 포털사이트에서 국세청_사업자등록정보 진위확인 및 상태조회 서비스 open Api사용 
	function ajax() {
		var cate = $('input[name="ccatev"]:checked').val();
		var num = $('#crnv').val();
		var data = '{"b_no":["' + num + '"]}';
		var sKey = "nfny9fgEcFysNpZT/WcPRTtJ3F86RlxpeJkFRVxGWsXmNCJYWNPSWeF4NcUBsoqRCu9YBj9S2lG0N8727L0CQw==";
		//var sKey = "GV+G8cEsEquteXOMC7fFvyF/if0pyTS5gyKeSSHjl83AhoHuuNr2qL/37wDuGvincFMMIsagkDYayBxjtduOiQ==";	  
		console.log("실행전 data : " + data);
		$
				.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="
							+ sKey, // serviceKey 값을 xxxxxx에 입력
					type : "POST",
					data : data,
					//data: JSON.stringify(data), // json 을 string으로 변환하여 전송
					dataType : "JSON",
					contentType : "application/json",
					accept : "application/json",
					success : function(result) {
						//console.log("타입"+typeof(JSON.stringify(data_1)));
						// console.log("타입"+JSON.stringify(data_1));
						console.log(typeof (data));
						console.log("사업자입력번호" + $('#crn').val());
						console.log("실행후 data : " + data);
						console.log(result);
						console.log(result.data[0].tax_type);

						if (result.data[0].tax_type === "국세청에 등록되지 않은 사업자등록번호입니다.") {
							if (result.data[0].b_no === "3988701111") { // 가짜 사업등록번호
								/*  $('#confcrn').css('color','green').html('√ 인증되었습니다.');
									var chk = $('#crn').val(num);
									console.log("delaybefore num : "+num);
								 	setTimeout(function() {
								  console.log("submit num : "+num);
								  $('#crn').val(num);
								  $('#company-register-form').submit();
								  return true;
								}, 3000); */
							} else {
								$('#confcrn').css('color', 'red').html(
										'X 국세청에 등록되지 않은 사업자등록번호입니다.');
								let reset = "";
								$('#crnv').val(reset);
								$js('#crnBtn').attr('disabled', true);
								return false;
							}
						}
						$('#confcrn').css('color', 'green').html('√ 인증되었습니다.');
						console.log("delaybefore num : " + num);
						console.log("delaybefore cate : " + cate);
						setTimeout(
								function() {
									console.log("submit num : " + num);
									$('#crn').val(num);
									$('#ccate').val(cate);
									if (cate === '병원') {
										$('#company-register-form')
												.attr("action",
														"${mycontext}/hospital/joinHospitalForm");
										alert('병원 등록 페이지로 이동합니다.');
										$('#company-register-form').submit();
									} else {
										$('#company-register-form')
												.attr("action",
														"${mycontext}/pharmacy/joinPharmacyForm");
										alert('약국 등록 페이지로 이동합니다.');
										$('#company-register-form').submit();
									}
									return true;
								}, 2000);

					},
					error : function(result) {
						console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});
	}
</script>



