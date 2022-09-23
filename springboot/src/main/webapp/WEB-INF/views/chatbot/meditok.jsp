<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.chatheader {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	padding: 10px 0;
	background-color: #DDD;
	color: #000;
	text-align: center;
}

.chatfooter {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 10px 0;
	background-color: #FFF;
	color: #000;
	text-align: center;
}
</style>
<div style="padding:0px;height:100%;background-color:#e8e8e8;">
    <div class="chatheader">
        <table width="100%" border="0">
            <tr>
            <td width="50%" align="left" style="font-size:20px;">
                <img src="{% static '_images/chaticon.png' %}" style="height:20px;opacity: 0.5;" />
                깨비 BOT
            </td>
            <td width="50%" align="right">
                <span onclick="chatTrain()" style="cursor:pointer;">Train</span>
            </td>
            </tr>
        </table>
    </div>
    <div id="chatbox" style=height:450px;margin-top:50px;padding:10px;background-color:#BBCCDD;overflow-y:scroll;overflow-x:hidden;max-height:100vh;"></div>
    <div class="chatfooter">
        <table width="100%">
            <tr>
            <td width="90%">
                <input id="chattext" style="padding:5px 0;width:100%;border:solid 0px #FFF;">
            </td>
            <td width="10%"><button style="padding:5px 0;width:100%;" id="sendbtn">SEND</button></td>
            </tr>
        </table>
    </div>
</div>
<script>
function getCookie(name) {
	var cookieValue = null;
	if (document.cookie && document.cookie !== '') {
		var cookies = document.cookie.split(';');
		for (var i = 0; i < cookies.length; i++) {
			var cookie = jQuery.trim(cookies[i]);
			// Does this cookie string begin with the name we want?
			if (cookie.substring(0, name.length + 1) === (name + '=')) {
				cookieValue = decodeURIComponent(cookie
						.substring(name.length + 1));
				break;
			}
		}
	}
	return cookieValue;
}

var csrftoken = getCookie('csrftoken');
var xhr;

$("#sendbtn").click(function(){
	chattext = document.getElementById("chattext").value;
	if (chattext == "") {
		document.getElementById("chattext").focus();
		return false; 
	}
	addtext = "<div style='margin:15px 0;text-align:right;'> <span style='padding:3px 10px;background-color:#3388cc;border-radius:3px;'>"
		+ chattext + "</span></div>";
	document.getElementById("chatbox").innerHTML += addtext;
	
	$.ajax({
		url : 'http://192.168.200.67:9000/chatanswer?questext='+chattext+'&callback',
		type:'GET',
		dataType:'jsonp',
		jsonp: 'callback',
		success: function(data){
			console.log(data);
			bottext = "<div style='margin:15px 0;text-align:left;'><span style='padding:3px 10px;background-color:#DDD;border-radius:3px;'>"
				+ data.anstext + "</span></div>";
			document.getElementById("chatbox").innerHTML += bottext;
			
			var objDiv = document.getElementById("chatbox");
			objDiv.scrollTop = objDiv.scrollHeight;

			//입력란 공백처리 및 포커싱
			document.getElementById("chattext").value = "";
			document.getElementById("chattext").focus();
		}
	});
});
document.getElementById("chattext").addEventListener("keyup", function(event) {
	  if (event.keyCode === 13) {
	    document.getElementById("sendbtn").click();
	  }
});


	function sendAsk() {
		chattext = document.getElementById("chattext").value;
		if (chattext == "") {
			document.getElementById("chattext").focus();
			return false;
		}

		addtext = "<div style='margin:15px 0;text-align:right;'> <span style='padding:3px 10px;background-color:#3388cc;border-radius:3px;'>"
				+ chattext + "</span></div>";
		document.getElementById("chatbox").innerHTML += addtext;

		var strurl = "chatanswer?questext=" + chattext;
		//alert(strurl);
		//return false;

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				var data = xhr.responseText;

				var obj = JSON.parse(data);

				if (obj.flag == "0") {

					bottext = "<div style='margin:15px 0;text-align:left;'><span style='padding:3px 10px;background-color:#DDD;border-radius:3px;'>"
							+ obj.anstext + "</span></div>";
					document.getElementById("chatbox").innerHTML += bottext;

					var objDiv = document.getElementById("chatbox");
					objDiv.scrollTop = objDiv.scrollHeight;

					document.getElementById("chattext").value = "";
					document.getElementById("chattext").focus();

				}
			}
		};
		xhr.open("GET", strurl);
		xhr.setRequestHeader("X-CSRFToken", csrftoken);
		xhr.send(null);
	}

	function chatTrain() {

		var strurl = "chattrain";
		alert(strurl);
		//return false;

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				var data = xhr.responseText;

				var obj = JSON.parse(data);
				alert(obj.result_msg);
			}
		};
		xhr.open("GET", strurl);
		xhr.setRequestHeader("X-CSRFToken", csrftoken);
		xhr.send(null);
	};
</script>
<%-- 본문 끝 --%>