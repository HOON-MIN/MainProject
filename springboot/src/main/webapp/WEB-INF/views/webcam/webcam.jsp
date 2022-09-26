<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link type="text/css" href="https://fonts.googleapis.com/css?family=Raleway:500">
<style>
.color-field{
    height:40px;
    width: 40px;  
    min-height:40px;
    min-width: 40px;
    cursor:pointer;
    border-radius: 50%;
    display: inline-block;
    box-sizing:border-box;
    border: 2px solid white;
    align-self:center;
}
h1 {
	font-family: sans-serif;
	color:#333;
}
.container_cam{
	margin:0px auto;
	width:450px;
	height: 400px;
	border: 10px #333 solid;
	background-color:black;

}
#chat2 .form-control {
border-color: transparent;
}

#chat2 .form-control:focus {
border-color: transparent;
box-shadow: inset 0px 0px 0px 1px transparent;
}

.divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.card-body {
  height:150px;
  overflow-y: scroll;
}



</style>
<article class="container m-5">
<h1>진 료</h1>

<input type="button" value="연결" onclick="makeCall()">

<div class="row" style="height: 500px;">

<div id="yourstream" class="col-6 ">
<div class="row container_cam">
<video id="video2" width="700" height="400" autoplay="autoplay" playsinline></video>
</div>
<div class="row">
	<div class="col-sm-6"></div>
    <div class="col-sm-3 float-right" style="position:relative; left:30px; top:5px;" >
        <Input class="range" type="range" id="vol_bar" name="" value="0" min="0" max="1000" style="display: inline" onChange="rangeSlide(this.value)" onmousemove="rangeSlide(this.value)"></Input>
     </div>
    <div class="col-sm-2">
        <button type="button" id="mute"><img alt="" src="/img/on.png" width="20" height="20" style="display: inline"> </button>
    </div>
    <div class="col-sm-1"></div>
    <audio id="audi1" volume="true"  autoplay></audio>
</div>
</div>
<div class="col-sm-6 ">
<div class="container_cam row">
<video id="video1"  width="500" height="400" autoplay="autoplay" playsinline></video>
</div>
<div class="row">
<button type="button" id="camera">카메라 off</button>
<select  id="cameras" name="" value="카메라 선택" style="position: relative;">
</select>
</div>
</div>

</div>

<div class="row">
<div class="col-sm-6">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" id="navCanvasId">Canvas</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="navDescriptionId">처방</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="navPinfoId">환자정보</a>
  </li>
</ul>
</div>
<div id="nav_div" class="row">

<div id="candiv" class="m-3">
<canvas id="canv"  width="500" height="400"  style="border:1px solid #000000;"></canvas >
</div>
<div onclick="change_color(this)" class="color-field" style="background: black;"></div>
<div onclick="change_color(this)" class="color-field" style="background: white;"></div>
<div onclick="change_color(this)" class="color-field" style="background: red;"></div>
<div onclick="change_color(this)" class="color-field" style="background: blue;"></div>
<div onclick="change_color(this)" class="color-field" style="background: green;"></div>
<div onclick="change_color(this)" class="color-field" style="background: yellow;"></div>
<button onclick="clearAll()">clear</button>
<button onclick="canvas_back()">back</button>
<input type="number" value="y값" step="2" onclick="change_ft(this)">

</div>
</div>
<div class="col-6">
    <div class="d-flex justify-content-center">
      <div class="col-md-10 col-lg-8 col-xl-6" style="width:90%;">

        <div class="card" id="chat2">
          <div class="card-header d-flex justify-content-between align-items-center p-3">
            <h5 class="mb-0">Chat</h5>
          </div>
          <div id="chatbox" class="card-body" data-mdb-perfect-scrollbar="true" style="position: relative; height: 400px">


          </div>
          <div class="card-footer text-muted d-flex justify-content-start align-items-center p-3">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"
              alt="avatar 3" style="width: 40px; height: 100%;">
            <input type="text" class="form-control form-control-lg" id="chat_msg"
              placeholder="Type message" onkeyup='if(window.event.keyCode==13){sendMsg()}'">
            <a class="ms-1 text-muted" href="#!"><i class="fas fa-paperclip"></i></a>
            <a class="ms-3 text-muted" href="#!"><i class="fas fa-smile"></i></a>
            <a class="ms-3" href="#!"><i class="fas fa-paper-plane"></i></a>
          </div>
        </div>

      </div>
    </div>
</div>
</div>




<script src="/js/webcam.js?ver=1.1"></script>


<script type="text/javascript">
$(function(){
	startCanvas();
	makeConn('192.168.0.104');
	myMsg='${sessionScope.id}';
	console.log('${sessionScope.id}');
	$('#navPinfoId').click(function(e) {
		$.ajax({
			method:"GET",
			url:"/pInfo",
			data:{name:"환자"},
			dataType:"json",
			success: function(data){
				let pInfoData=JSON.parse(JSON.stringify(data));
				pInfoData.forEach(data=>{
					console.log(data.pnum);
					console.log(data.pname);
					console.log(data.pdate);
				})
				let ex_form='<div class="form_wrapper"><div class="form_container"><div class="title_container">'+
					      '<h2>Responsive Registration Form</h2></div><div class="row clearfix"><div class="">'+
					        '<form>'+
					          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>'+
					            '<input type="email" name="email" placeholder="Email" required />'+
					          '</div>'+
					          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>'+
					            '<input type="password" name="password" placeholder="Password" required />'+
					          '</div>'+
					          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>'+
					            '<input type="password" name="password" placeholder="Re-type Password" required />'+
					          '</div>'+
					          '<div class="row clearfix">'+
					            '<div class="col_half">'+
					              '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>'+
					                '<input type="text" name="name" placeholder="First Name" />'+
					              '</div>'+
					            '</div>'+
					            '<div class="col_half">'+
					              '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>'+
					                '<input type="text" name="name" placeholder="Last Name" required />'+
					              '</div>'+
					            '</div>'+
					          '</div>'+
					            	'<div class="input_field radio_option">'+
					              '<input type="radio" name="radiogroup1" id="rd1">'+
					              '<label for="rd1">Male</label>'+
					              '<input type="radio" name="radiogroup1" id="rd2">'+
					              '<label for="rd2">Female</label>'+
					              '</div>'+
					              '<div class="input_field select_option">'+
					                '<select>'+
					                  '<option>Select a country</option>'+
					                  '<option>Option 1</option>'+
					                  '<option>Option 2</option>'+
					                '</select>'+
					                '<div class="select_arrow"></div>'+
					              '</div>'+
					            '<div class="input_field checkbox_option">'+
					            	'<input type="checkbox" id="cb1">'+
					    			'<label for="cb1">I agree with terms and conditions</label>'+
					            '</div>'+
					            '<div class="input_field checkbox_option">'+
					            	'<input type="checkbox" id="cb2">'+
					    			'<label for="cb2">I want to receive the newsletter</label>'+
					            '</div>'+
					          '<input class="button" type="submit" value="Register" />'+
					        '</form>'+
					      '</div>'+
					    '</div>'+
					  '</div>'+
					'</div>';
					$('#nav_div').html(ex_form);
			}
		});
		navChange($(this));
	});
	$('#navDescriptionId').click(function(e) {
		let ex_form='<div class="form_wrapper"><div class="form_container"><div class="title_container">'+
	      '<h2>Responsive Registration Form</h2></div><div class="row clearfix"><div class="">'+
	        '<form>'+
	          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>'+
	            '<input type="email" name="email" placeholder="Email" required />'+
	          '</div>'+
	          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>'+
	            '<input type="password" name="password" placeholder="Password" required />'+
	          '</div>'+
	          '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>'+
	            '<input type="password" name="password" placeholder="Re-type Password" required />'+
	          '</div>'+
	          '<div class="row clearfix">'+
	            '<div class="col_half">'+
	              '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>'+
	                '<input type="text" name="name" placeholder="First Name" />'+
	              '</div>'+
	            '</div>'+
	            '<div class="col_half">'+
	              '<div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>'+
	                '<input type="text" name="name" placeholder="Last Name" required />'+
	              '</div>'+
	            '</div>'+
	          '</div>'+
	            	'<div class="input_field radio_option">'+
	              '<input type="radio" name="radiogroup1" id="rd1">'+
	              '<label for="rd1">Male</label>'+
	              '<input type="radio" name="radiogroup1" id="rd2">'+
	              '<label for="rd2">Female</label>'+
	              '</div>'+
	              '<div class="input_field select_option">'+
	                '<select>'+
	                  '<option>Select a country</option>'+
	                  '<option>Option 1</option>'+
	                  '<option>Option 2</option>'+
	                '</select>'+
	                '<div class="select_arrow"></div>'+
	              '</div>'+
	            '<div class="input_field checkbox_option">'+
	            	'<input type="checkbox" id="cb1">'+
	    			'<label for="cb1">I agree with terms and conditions</label>'+
	            '</div>'+
	            '<div class="input_field checkbox_option">'+
	            	'<input type="checkbox" id="cb2">'+
	    			'<label for="cb2">I want to receive the newsletter</label>'+
	            '</div>'+
	          '<input class="button" type="submit" value="Register" />'+
	        '</form>'+
	      '</div>'+
	    '</div>'+
	  '</div>'+
	'</div>';
	$('#nav_div').html(ex_form);
		navChange($(this));
	});
	$('#navCanvasId').click(function(e) {
		let ex_canv='<div id="candiv" class="m-3">'+
			'<canvas id="canv"  width="500" height="400"  style="border:1px solid #000000;"></canvas >'+
			'</div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: black;"></div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: white;"></div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: red;"></div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: blue;"></div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: green;"></div>'+
			'<div onclick="change_color(this)" class="color-field" style="background: yellow;"></div>'+
			'<button onclick="clearAll()">clear</button>'+
			'<button onclick="canvas_back()">back</button>'+
			'<input type="number" value="y값" step="2" onclick="change_ft(this)">';
		$('#nav_div').html(ex_canv);
		startCanvas();
		draw_all();
		navChange($(this));
	});
	
/*	$("#volume").slider({
	  	min: 0,
	  	max: 100,
	  	value: 0,
			range: "min",
	  	slide: function(event, ui) {
	    	setVolume(ui.value / 100);
	  	}
		});
		
*/	
});
var myMedia = document.createElement('audio');
$('#player').append(myMedia);
myMedia.id = "myMedia";

function playAudio(fileName, myVolume) {
		myMedia.src = fileName;
		myMedia.setAttribute('loop', 'loop');
	setVolume(myVolume);
	myMedia.play();
}

function setVolume(myVolume) {
var myMedia = document.getElementById('myMedia');
myMedia.volume = myVolume;
}
function navChange(th){
	let navList=th.parent().parent().find('a');
	navList.each(function(i, element) {
	if(element.getAttribute('id')==th.attr('id')){
			element.setAttribute("class", "nav-link active");
		}else{
			element.setAttribute("class","nav-link");
		}
	})

};


</script>

</article>