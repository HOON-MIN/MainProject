<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="container"> -->
<link href="/mireu/css/chatbot.css?" rel="stylesheet" />

<style>
/* 전체 틀 */
body {
	margin: 0;
}

.outer {
	height: 100vh;
	overflow-y: auto;
}

.outer::-webkit-scrollbar {
	display: none;
}

.inner {
	height: 100vh;
	position: relative;
	background-color: #3478f5;
}

.innerImg {
	height: 100%;
}

.mainImg {
	width: 100%;
}

/* 첫 슬라이드  */
.textMain1 {
	position: absolute;
	top: 40%;
	left: 10%;
	width: 100%;
	color: white;
}

.btnMain1 {
	width: 10%;
	height: 10%;
	margin-top: 40px;
	padding: 10px;
	color: white;
	border: solid 1px #ffffff;
	border-radius: 20px;
	background-color: #80a7ce;
}

.btnMain1:hover {
	background-color: white;
	color: #80a7ce;
	border: solid 1px #ffffff;
	border-radius: 20px;
}

/* 두번째 슬라이드 */
.btnGroupMain2 {
	position: absolute;
	top: 22%;
	left: 50%;
	transform: translate(-50%, 0%);
}

.btnMain2 {
	width: 200px;
	height: 64px;
	color: #3478f5;
	font-weight: bolder;
	border: solid 1px #3478f5;
	margin: 0 16px;
	border-radius: 20px;
	background-color: white;
}

/* 세번째 슬라이드 */
.textMain3 {
	position: absolute;
	top: 30%;
	left: 40%;
	transform: translate(-50%, 0%);
	color: white;
}

.btnMain3 {
	width: 200px;
	height: 48px;
	margin-top: 40px;
	padding: 10px;
	color: white;
	border: solid 1px #ffffff;
	border-radius: 20px;
	background-color: #3478f5;
}

.button-6 {
	align-items: center;
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: .25rem;
	box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
	box-sizing: border-box;
	color: rgba(0, 0, 0, 0.85);
	cursor: pointer;
	display: inline-flex;
	font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
	font-size: 16px;
	font-weight: 600;
	justify-content: center;
	line-height: 1.25;
	margin: 0;
	min-height: 3rem;
	padding: calc(.875rem - 1px) calc(1.5rem - 1px);
	position: relative;
	text-decoration: none;
	transition: all 250ms;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: baseline;
	width: auto;
}

.button-6:hover,
.button-6:focus {
  border-color: rgba(0, 0, 0, 0.15);
  box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
  color: rgba(0, 0, 0, 0.65);
}

.button-6:hover {
  transform: translateY(-1px);
}

.button-6:active {
  background-color: #F0F0F1;
  border-color: rgba(0, 0, 0, 0.15);
  box-shadow: rgba(0, 0, 0, 0.06) 0 2px 4px;
  color: rgba(0, 0, 0, 0.65);
  transform: translateY(0);
}

.chatbot {
	position : fixed;
	width: 80px;
	height: 80px; 
	bottom: 5%;
	right: 5%;
	background-color: white;
	border-radius: 40px;
}

.chatbot img{
	width: 50px; 
	height : 50px;
}

</style>
<div class="inner">
	<div class="innerImg">
		<img src="https://ifh.cc/g/RXBz7C.jpg" class="mainImg" />
	</div>
	<div class="textMain1">
		<h2>HeyDr.</h2>
		<br></br> <span> 비대면 의료 통합 웹 서비스 <br> 삶의 질을 높여드리는 건강한 서비스
			입니다.
		</span> <br></br>
		<button class="btnMain1">병원리스트 보기</button>
	</div>
</div>
<div class="inner">
	<div class="innerImg">
		<img src=https://ifh.cc/g/tzoLJK.jpg class="mainImg" />
	</div>
	<div class="btnGroupMain2">
		<button type="button" class="btnMain2">App Store</button>
		<button type="button" class=" btnMain2">Google Play</button>
	</div>
</div>
<div class="inner">
	<div class="innerImg">
		<img src="https://ifh.cc/g/zTr63k.jpg" class="mainImg" />
	</div>
	<div class="textMain3">
		<h2>HeyDr.</h2>
		<br></br> <span>비대면 진료 와 약 배송을 한번에.</span> <br></br>
		<button class="btnMain3">서비스페이지로</button>

	</div>
</div>

<div id="center-text">
	<h2>ChatBox UI</h2>
	<p>Message send and scroll to bottom enabled</p>
</div>
<div id="body">

	<div id="chat-circle" class="btn btn-raised chatbot d-flex justify-content-center align-items-center bg-white">
		<div id="chat-overlay"></div>
		<img alt="챗봇" src="/img/bot.png">
	</div>

	<div class="chat-box">
		<div class="chat-box-header">
			ChatBot <span class="chat-box-toggle"><i
				class="material-icons">close</i></span>
		</div>
		<div class="chat-box-body">
			<div class="chat-box-overlay"></div>
			<div class="chat-logs"></div>
			<!--chat-log -->
		</div>
		<div class="chat-input">
			<form>
				<input type="text" id="chat-input" placeholder="Send a message..." />
				<button type="submit" class="chat-submit" id="chat-submit">
					<i class="material-icons">send</i>
				</button>
			</form>
		</div>
	</div>

</div>

<script>
	$(function() {
		var INDEX = 0;
		$("#chat-submit").click(function(e) {
			e.preventDefault();
			var msg = $("#chat-input").val();
			
			if (msg.trim() == '') {
				document.getElementById("chat-input").focus();
				return false; 
			}

			$.ajax({
				url : 'http://192.168.0.83:9000/chatanswer?questext='+msg+'&callback',
				type:'GET',
				dataType:'jsonp',
				jsonp: 'callback',
				success: function(data){
					console.log(data);
					generate_message(msg, 'self');
					var buttons = [ {
						name : 'Existing User',
						value : 'existing'
					}, {
						name : 'New User',
						value : 'new'
					} ];
					setTimeout(function() {
						generate_message(data, 'user');
					}, 1000)
					
					document.getElementById("chat-input").value = "";
					document.getElementById("chat-input").focus();
				}
			});
		})

		function generate_message(msg, type) {
			INDEX++;
			var str = "";
			if(type == 'user'){
				if(msg.anstext.substring(0,4) == 'http'){
					idx = 0;
					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
					str += "          <span class=\"msg-avatar\">";
					str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
					str += "          <\/span>";
					str += "          <div class=\"cm-msg-text\">";
					for(var m of msg.url){
						
						str += "<p style='color:green; display:inline;'>#</p>" +msg.hname[idx] + "<br>";
						str += "<button class='button-6' onclick=window.open('"+m+"') style='margin-bottom:10px;'>예약하러가기</button><br>";
						idx++;
					}
					
					str += "          <\/div>";
					str += "        <\/div>";
				}else{
					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
					str += "          <span class=\"msg-avatar\">";
					str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
					str += "          <\/span>";
					str += "          <div class=\"cm-msg-text\">";
					str += msg.anstext;
					str += "          <\/div>";
					str += "        <\/div>";
				}
			}else{
				str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
				str += "          <span class=\"msg-avatar\">";
				str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
				str += "          <\/span>";
				str += "          <div class=\"cm-msg-text\">";
				str += msg;
				str += "          <\/div>";
				str += "        <\/div>";
			}

			$(".chat-logs").append(str);
			$("#cm-msg-" + INDEX).hide().fadeIn(300);
			if (type == 'self') {
				$("#chat-input").val('');
			}
			$(".chat-logs").stop().animate({
				scrollTop : $(".chat-logs")[0].scrollHeight
			}, 1000);
		}

		/* 미샤용 */
		function generate_button_message(msg, buttons) {
			/* Buttons should be object array
			  [
			    {
			      name: 'Existing User',
			      value: 'existing'
			    },
			    {
			      name: 'New User',
			      value: 'new'
			    }
			  ]
			 */

			INDEX++;
			var btn_obj = buttons
					.map(
							function(button) {
								return "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"
										+ button.name + "<\/a><\/li>";
							}).join('');
			var str = "";
			str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
			str += "          <span class=\"msg-avatar\">";
			str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
			str += "          <\/span>";
			str += "          <div class=\"cm-msg-text\">";
			str += msg;
			str += "          <\/div>";
			str += "          <div class=\"cm-msg-button\">";
			str += "            <ul>";
			str += btn_obj;
			str += "            <\/ul>";
			str += "          <\/div>";
			str += "        <\/div>";
			$(".chat-logs").append(str);
			$("#cm-msg-" + INDEX).hide().fadeIn(300);
			$(".chat-logs").stop().animate({
				scrollTop : $(".chat-logs")[0].scrollHeight
			}, 1000);
			$("#chat-input").attr("disabled", true);
		}

		/* 클릭이벤트 */
		$(document).delegate(".chat-btn", "click", function() {
			var value = $(this).attr("chat-value");
			var name = $(this).html();
			$("#chat-input").attr("disabled", false);
			generate_message(name, 'self');
		})

		$("#chat-circle").click(function() {
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})

		$(".chat-box-toggle").click(function() {
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})

	})
</script>