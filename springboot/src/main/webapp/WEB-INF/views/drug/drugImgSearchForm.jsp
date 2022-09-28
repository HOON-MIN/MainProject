<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-10 flex-column">
	<div class="hboard pt-2 ps-3 pe-3 pb-3">
		<!-- 안 쪽에 자신의 컨텐츠를 넣어주세요 -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h4 class="mt-3 mb-3 text-center hanna" style="background-color: aqua;">약품
						이미지 검색</h4>


					<input type="text"
						class="form-control text-center text-center mb-5 hanna"
						placeholder="식별표시가 잘보이도록 등록해주세요 ." readonly="readonly">

					<form method="post" id="drugImageSearchId">


						<div style="text-align: center;">
							<label class=" btn btn-light hanna" for="mfile">이미지업로드</label>
							<div>
								<input type="file" name="mfile" id="mfile" value="fileOriName"
									style="display: none;" />
							</div>
							<div>
								<img src="kimsungwook/loadimg/noimage.jpg" alt="" id="imgx"
									style="width: 600px" height="500px">
							</div>
							<!-- <input type="hidden" id="shape" name="shape" value="">
			<input type="hidden" id="color" name="color" value=""> -->
							<div class="row mb-1 mt-3 ">
								<button type="button" id="imgSearchBtn" class="btn btn-info hanna">검색</button>
							</div>

						</div>
					</form>
					<form method="get" id="drugExtractResultSendId"
						action="drugImageSearch" style="display: none;">
						<input id="drugShapeExtractResultID" name="drugShapeExtractResult"
							type="text" /> <input id="drugColorExtractResultID"
							name="drugColorExtractResult" type="text" /> <input
							id="drugColorExtractResultID" name="identificationCharResult"
							type="text" />
					</form>
					<!-- <div id="target"></div> -->
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$(function() {
		$("#mfile").on('change', function() {
			readURL(this);
		});
		//---------------------------

		$('#imgSearchBtn').on('click', function() {
			uploadFile();
			/* 					$.ajax({
			 url: 'http://localhost:9000/drug/json_Drug_Extract',
			 success: function(data){
			 console.log(data);
			 console.log(data.columns);
			 console.log(data.data);
			
			 }
			 });
			 */
			/* $.ajax({
				url: 'http://localhost:9000/drug/json_Drug_Extract?callback',
				type: 'GET',
				dateType:'jsonp',
				
				jsonp: 'callback',
				success: function(data){
					console.log(data);
				    console.log(data.columns);
			        console.log(data.data);
			        
			    },
			    error:function(err){
			    	console.log('Errir =>'+$('#target').text());
			    } 
			}); */
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgx').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	function uploadFile() {

		var form = $('#drugImageSearchId')[0];
		console.log(form);
		var formData = new FormData(form);
		console.log(formData);

		$.ajax({
			url : "http://192.168.0.68:9000/drug/json_Drug_Extract",
			type : 'POST',
			data : formData,
			contentType : false,
			processData : false
		}).done(
				function(data) {
					/* jsonp로 받을시 callback? */
					/* callback(data); */

					console.log(data);
					console.log(data.columns);
					console.log(data.data);
					console.log(data.data[0][0]);

					/* $('#target').text(data.data) */
					/* $('input[name=inputValue]').attr('value',"test"); */
					$('input[name=drugShapeExtractResult]').attr('value',
							data.data[0][0]);
					$('input[name=drugColorExtractResult]').attr('value',
							data.data[0][1]);
					$('input[name=identificationCharResult]').attr('value',
							data.data[0][2]);
					$('#drugExtractResultSendId').submit();
				});

	}
</script>