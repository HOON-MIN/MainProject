  /**
 * 
 */
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
				str += "			  <div class='bg-white'><img src='/img/bot.png'></div>";
				//str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
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
				str += "			  <div class='d-print-flex rounded-circle bg-white'><img src='/img/bot.png'></div>";
				//str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
				str += "          <\/span>";
				str += "          <div class=\"cm-msg-text\">";
				str += msg.anstext;
				str += "          <\/div>";
				str += "        <\/div>";
			}
		}else{
			str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
			str += "          <span class=\"msg-avatar\">";
			str += "			  <div class='d-print-flex rounded-circle bg-white'><img src='/img/user.png'></div>";
			//str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
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
	
	$(document).keyup(function(e){
		if(e.keyCode == 27){
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
			document.getElementById("chat-input").value = "";
			document.getElementById("chat-input").focus();
		}
	});
})