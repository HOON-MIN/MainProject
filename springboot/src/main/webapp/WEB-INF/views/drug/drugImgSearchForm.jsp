<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<article>

	<h4 class="mt-3 mb-3 text-center">약품 이미지 검색</h4>


	<p class="text-center mb-5">약품정보를 찾을 약품사진를 식별표시가 잘보이도록 등록해주세요 .</p>
	
	<form class="requires-validation nav justify-content-center" 
		method="post" id="drugImageSearchId">


		<div class="col-md-10 mb-3  nav justify-content-end">
			<label class="col-sm-3 col-form-label btn btn-primary  mb-3"
				for="mfile">이미지업로드</label>
			<div class="col-sm-10 class">
				<input type="file" name="mfile" id="mfile" value="fileOriName"
					style="display: none;" />
			</div>
			<div class="col-sm-5 d-flex justify-content-center form-control ">
				<img src="kimsungwook/loadimg/noimage.jpg" alt="" id="imgx"
					style="width: 600px" height="500px">
			</div>
			<!-- <input type="hidden" id="shape" name="shape" value="">
			<input type="hidden" id="color" name="color" value=""> -->
			<div class="row mb-1 mt-3 ">
					<button type="button"  id="imgSearchBtn" class="btn btn-primary" >검색</button>
			</div>

		</div>
	</form>	
	<form method="get" id="drugExtractResultSendId" action="drugImageSearch" style="display: none;">
		<input id="drugShapeExtractResultID" name="drugShapeExtractResult" type="text"/>
		<input id="drugColorExtractResultID" name="drugColorExtractResult" type="text"/>
		<input id="drugColorExtractResultID" name="identificationCharResult" type="text"/>
	</form>
	<!-- <div id="target"></div> -->
		<script>
			$(function() {
				$("#mfile").on('change', function() {
					readURL(this);
				});
				//---------------------------
				
				
				$('#imgSearchBtn').on('click',function(){
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
			
			function uploadFile(){
				    
				    var form = $('#drugImageSearchId')[0];
					console.log(form);
				    var formData = new FormData(form);
					console.log(formData);
				 
				    $.ajax({
				        url : "http://localhost:9000/drug/json_Drug_Extract",
				        type : 'POST',
				        data : formData,
				        contentType : false,
				        processData : false        
				    }).done(function(data){
					     /* jsonp로 받을시 callback? */
				        /* callback(data); */
						
						console.log(data);
					    console.log(data.columns);
		                console.log(data.data);
		                console.log(data.data[0][0]);

		                /* $('#target').text(data.data) */
		                /* $('input[name=inputValue]').attr('value',"test"); */
		                $('input[name=drugShapeExtractResult]').attr('value',data.data[0][0]);
		                $('input[name=drugColorExtractResult]').attr('value',data.data[0][1]);
		                $('input[name=identificationCharResult]').attr('value',data.data[0][2]);
		                $('#drugExtractResultSendId').submit(); 
				    });
				 
			}

		</script>
</article>
