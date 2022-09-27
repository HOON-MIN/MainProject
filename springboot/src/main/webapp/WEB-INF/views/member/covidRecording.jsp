<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 30%;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 display: none;
 text-align: center; 
 }
  
#loading-image {  
 position: absolute;  
 top: 30%;  
 left: 40%; 
 z-index: 100; }
</style>
<div class="container-fluid covidUpload p-5">
	<div class="row">
		<div class="col">
			<h1 id="covidh1">COVID19 검사</h1>
			<p>
				<small>Made by the <a href="https://addpipe.com"
					target="_blank">Pipe Video Recording Platform</a></small>
			</p>
			<p>1. 자신의 기침소리를 현재 웹에서 녹음해주세요.</p>
			<p>2. 녹음된 .wav파일을 Drag&Drop 또는 파일탐색기에서 업로드해주세요.</p>
			<p>3. 호흡기질환, 발열, 근육통 여부를 체크해주세요.
			<p>4. 검사버튼을 누르시면 몇 초뒤 검사 결과를 가져옵니다.</p>

			<div id="controls">
				<button id="recordButton">Record</button>
				<button id="pauseButton" disabled>Pause</button>
				<button id="stopButton" disabled>Stop</button>
			</div>
			<div id="formats">Format: start recording to see sample rate</div>
			<p>
				<strong>Recordings:</strong>
			</p>
			<ol id="recordingsList"></ol>
			<!-- inserting these scripts at the end to be able to use all the elements in the DOM -->

		</div>

		<div class="col" style="height: 400px; display: table-cell; vertical-align: middle; ">
			<div class="upREC" style="background-color: #f2f7ff;">
				<div class="card" style="margin-top: 120px; ">
					<h3>Upload Files</h3>
					<div class="drop_box" style="justify-content: center;">
						<!-- JS에서 내용이 바뀌는 부분 -->
						<header>
							<h4>Select File here</h4>
						</header>
						<p>Files Supported: WAV, MP3</p>
						<input type="file" hidden accept=".wav" id="fileID"
							style="display: none;">
						<button class="btn">Choose File</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<hr>

	<div class="row covidresv">
		<div class="col">
			<h4>Q1. 호흡기질환(천식, 폐렴 등)이 있으십니까?</h4>
			<div class="col-md-6">
				<label class="radio">있음 <input type="radio"
					checked="checked" name="is_respiratory" value="1"> <span
					class="checkround"></span>
				</label> <label class="radio">없음 <input type="radio"
					name="is_respiratory" value="0"> <span class="checkround"></span>
				</label>
			</div>
		</div>

		<div class="col">
			<h4>Q2. 발열 및 근육통이 있으십니까?</h4>
			<div class="col-md-6">
				<label class="radio">있음 <input type="radio"
					checked="checked" name="is_fever" value="1"> <span
					class="checkround"></span>
				</label> <label class="radio">없음 <input type="radio" name="is_fever"
					value="0"> <span class="checkround"></span>
				</label>
			</div>
		</div>
	</div>
	<div style="display: flex; justify-content: right;">
		<button class="btn cust-btn " type="button" id="checkbtn">검사하기</button>
	</div>
</div>

<div id="loading" class="loading">
<img src="/images/dhlee/loading.gif"></div>
<script>
$(window).ready(function(){
	var sessionID = "<c:out value='${sessionID}'/>";
	if(sessionID.length == 0){
		alert("로그인 후 이용가능합니다.");
		location.href = "/member/memberLoginForm";
	}
});

$(document).ready(function() {
    $('#loading').hide();
});
</script>
<%-- 본문 끝 --%>