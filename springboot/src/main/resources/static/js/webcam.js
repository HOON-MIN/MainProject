var conn;
var canvas, ctx, flag = false,prevX = 0,currX = 0,prevY = 0,currY = 0,dot_flag = false;
var canv_col = "black",canv_size = 2;
var canvasrect;
var canvas_store=[];
var canvas_idx=-1;
var list_canv="";
var peerConnection;
var dataChannel;
var roomname;
var vObj=document.getElementById('video1');
var vObj2=document.getElementById('video2');
var audi=document.getElementById('audi1');

var stream;
var cameras;
var myMsg;
var currMsg;
var today;
const chatbox=document.getElementById('chatbox');
const muteBtn=document.getElementById('mute');
const cameraBtn=document.getElementById('camera');
const cameraSelect=document.getElementById('cameras');
let muted=false;
let cameraoff=false;

async function makeConn(ip){
	conn= new WebSocket("ws://"+ip+":83/webcam/socket");
	conn.onopen=function(){
		console.log("socket connected!");
		peercon();
	}

	conn.onmessage= async function(msg){
		if(!conn)return;
	    var content = JSON.parse(msg.data);
	    var data = content.data;
	    switch (content.event) {
	    case "offer":
	        handleOffer(data);
	    case "answer":
	        handleAnswer(data);
	        break;
	    case "candidate":
	        handleCandidate(data);
	        break;
	    case "quit":
	    	quit();
	    	break;
	    default:
	        break;
	    }
	}

}

function send(msg){
	console.log(msg);
	conn.send(JSON.stringify(msg));
}

async function getCameras(){
	try{
		const devices=await navigator.mediaDevices.enumerateDevices();
		console.log(devices);
		const cameras=devices.filter(device=>device.kind ==="videoinput");
		cameras.forEach(camera=>{
			const opt=document.createElement('option');
			opt.value=camera.deviceId;
			opt.innerText=camera.label;
			cameraSelect.appendChild(opt);
		});
	}catch(e){
		
	}
} 

async function getMedia(deviceid){
	let constraint;
	if(!deviceid){
		constraint={
		audio:{noiseSuppression:true},
		video:{
			deviceId:{exact:deviceid}
			}
		}
	}else{
		constraint={
			audio:{noiseSuppression:true},
			video:true
		}};
	try{
		stream= await navigator.mediaDevices.getUserMedia(constraint);
		vObj.srcObject=stream;
		if(!deviceid){
		await getCameras();
		}
	}catch(e){
		console.log(e);
	}
}

function rangeSlide(value) {
    audi.volume=value/1000;
}

function handleMuteClick(){
	if(stream)stream.getAudioTracks().forEach(track=>track.enabled=!track.enabled);
	if(!muted){
		muteBtn.querySelector('img').src="/img/on.png";
		muted=true;
	} else{
		muteBtn.querySelector('img').src="/img/off.png";
		muted=false;
	}
}
function handleCameraClick(){
	stream.getVideoTracks().forEach(track=>track.enabled=!track.enabled);
	
	if(!cameraoff){
		cameraBtn.innerText="카메라 on";
		cameraoff=true;
	} else{
		cameraBtn.innerText="카메라 off";
		cameraoff=false;
	}
}
async function handleCameraChange(){
	await getMedia(cameraSelect.value);
}

muteBtn.addEventListener("click",handleMuteClick);
cameraBtn.addEventListener("click",handleCameraClick);
cameraSelect.addEventListener("input",handleCameraChange);

async function peercon(){
	await getMedia();
	peerConnection=new RTCPeerConnection(  
		 {iceServers: [{
              urls: [
          "stun:stun.l.google.com:19302",
          "stun:stun1.l.google.com:19302",
          "stun:stun2.l.google.com:19302",
          "stun:stun3.l.google.com:19302",
          "stun:stun4.l.google.com:19302",
        			],
      			},
    		],
  		});
    peerConnection.onicecandidate = function(event) {
        if (event.candidate) {
            send({
                event : "candidate",
                data : event.candidate
            });
        }
    };
 	    // creating data channel
    dataChannel = peerConnection.createDataChannel("dataChannel", {
        reliable : true
    });

    dataChannel.onerror = function(error) {
        console.log("Error occured on datachannel:", error);
    };

    dataChannel.onclose = function() {
        console.log("data channel is closed");
        chatbox.innerHTML+='<div class="divider d-flex align-items-center mb-4">'+
              '<p class="text-center mx-3 mb-0" style="color: #a2aab7;">채팅끊겼습니다</p>'+'</div>';
    };
	peerConnection.ondatachannel = function (event) {
        dataChannel = event.channel;
        console.log("datachannel created");
        chatbox.innerHTML+='<div class="divider d-flex align-items-center mb-4">'+
              '<p class="text-center mx-3 mb-0" style="color: #a2aab7;">채팅연결되었습니다</p>'+'</div>';
  	};

    dataChannel.onmessage = function(event) {
        console.log("message:", event.data);
		let cont=JSON.parse(event.data);
		console.log("type:"+cont.type);
		console.log("data:"+cont.data);
		console.log("user:"+cont.user);
		if(cont.type=='canv'){
            canvas_store=cont.data;
			canvas_idx=cont.idx
			draw_all();
		}else if(cont.type=='msg'){
			let date=new Date();
			today=date.getHours()+":"+date.getMinutes();
			if(currMsg!=cont.user){
			chatbox.innerHTML+=
			'<div class="d-flex flex-row justify-content-start mb-4">'+
			'<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"alt="avatar 1" style="width: 45px; height: 100%;">'+
			'<div><p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">'
			+cont.data+'</p><p class="small ms-3 mb-3 rounded-3 text-muted">'+today+'</p></div></div>';
			currMsg=cont.user;
			}else{
			chatbox.querySelector('div:last-child>div>p:last-child').remove();
			chatbox.querySelector('div:last-child>div').innerHTML+='<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">'+cont.data+'</p>'+
			'<p class="small ms-3 mb-3 rounded-3 text-muted">'+today+'</p>';
			}
		}					
		
    };

  	
	peerConnection.addEventListener('track', async (event) => {
		let st=event.streams[0];
		let au2=st.getAudioTracks()[0];
		let vd2=st.getVideoTracks()[0];
		if(vd2.kind=='video' && !vObj2.srcObject){
			let st2=new MediaStream();
			st2.addTrack(vd2);
			vObj2.srcObject=st2;
			vObj2.play();

		}else if(au2.kind=='audio' && !audi.srcObject){
			let st2=new MediaStream();
			st2.addTrack(au2);
			console.log(st2);
			audi.srcObject=st2;
			audi.play();
		}
    });

	if(stream)stream.getTracks().forEach((track) => peerConnection.addTrack(track, stream));

}


function makeCall(){
    peerConnection.createOffer(function(offer) {
		console.log('create Offer');
        send({
            event : "offer",
            data : offer
        });
        peerConnection.setLocalDescription(offer);
    }, function(error) {
        alert("Error creating an offer");
    });

}
async function handleOffer(offer) {

    peerConnection.setRemoteDescription(new RTCSessionDescription(offer));
    await peerConnection.createAnswer(function(answer) {
        peerConnection.setLocalDescription(answer);
        send({
            event : "answer",
            data : answer
        });
    }, function(error) {
        alert("Error creating an answer");
    });

};

function handleCandidate(candidate) {
	if(!peerConnection)return;
	if(candidate.candiate)peerConnection.addIceCandidate(new RTCIceCandidate(candidate));
};

function handleAnswer(answer) {
    peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
    console.log("connection established successfully!!");
    
};

function sendMsg(){
	const div_chat = document.getElementById('chat_msg');
	let date = new Date();
	today = date.getHours() + ":" + date.getMinutes();

	if (myMsg == currMsg) {
		chatbox.querySelector('div:last-child>div>p:last-child').remove();
		chatbox.querySelector('div:last-child>div').innerHTML += '<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">' + div_chat.value
			+ '</p><p class="small ms-3 mb-3 rounded-3 text-muted">' + today + '</p>';
	} else {
		chatbox.innerHTML += '<div class="d-flex flex-row justify-content-end mb-4 pt-1"><div><p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">' + div_chat.value +
			'</p><p class="small ms-3 mb-3 rounded-3 text-muted">' + today + '</p></div><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp"' +
			'alt="avatar 1" style="width: 45px; height: 100%;"></div>';
		currMsg = myMsg;
	}
	sendData("msg", div_chat.value);
	div_chat.value="";
}

function sendData(x,y,z,v) {
	
	if(x=='msg'){
		if(dataChannel&&dataChannel.readyState=='open'){
    	dataChannel.send(
			JSON.stringify({
				type: x,
				data: y,
				user: myMsg
				}));
    }}else if(x=='canv'){
		if(y=='down'){
			list_canv=[];
			list_canv.push([y,z,v,canv_col,canv_size]);
		}else if(y=='up'||y == "out"){
			if(list_canv){
			list_canv.push([y,z,v,canv_col,canv_size]);
				canvas_store.push(list_canv);
				canvas_idx+=1;
				if(dataChannel&&dataChannel.readyState=='open'){
				dataChannel.send(
				JSON.stringify({
					type: x,
					data: canvas_store,
					idx:canvas_idx
				}));
				}
			list_canv="";
			}
		}else if(list_canv){
			list_canv.push([y,z,v,canv_col,canv_size]);
		}
	}
}

function canvas_back(){
	console.log("back")
	console.log("idx:"+canvas_idx);
	if(canvas_idx<=0){
		clearAll();
	}else{
		canvas_store.pop();
		canvas_idx-=1;
		draw_all();
	if(dataChannel&&dataChannel.readyState=='open'){
		dataChannel.send(
    	JSON.stringify({
			type: 'canv',
			data: canvas_store,
			idx: canvas_idx
		}));
	}
	}
}

function draw_all(){
	ctx.fillStyle = "white";
    ctx.clearRect(0,0,canvas.width, canvas.height);
    ctx.fillRect(0,0,canvas.width, canvas.height);
	canvas_store.forEach(i =>{
		i.forEach(e=>{
			findxy(e[0],e[1],e[2],e[3],e[4]);
		});
	});
}

var candiv;

function startCanvas(){
		//if(canvas)return;
	    canvas = document.getElementById('canv');
        ctx = canvas.getContext("2d");
        candiv=canvas.getBoundingClientRect();
        w = canvas.width;
        h = canvas.height;
    	
        canvas.addEventListener("mousemove", function (e) {
            findxy('move', e.clientX,e.clientY,canv_col,canv_size);
 			sendData("canv", 'move',e.clientX,e.clientY);
        }, false);
        canvas.addEventListener("mousedown", function (e) {
            findxy('down', e.clientX,e.clientY,canv_col,canv_size);
			sendData("canv", 'down',e.clientX,e.clientY);
        }, false);
        canvas.addEventListener("mouseup", function (e) {
            findxy('up', e.clientX,e.clientY,canv_col,canv_size);
            sendData("canv", 'up',e.clientX,e.clientY);
        }, false);
        canvas.addEventListener("mouseout", function (e) {
            findxy('out', e.clientX,e.clientY,canv_col,canv_size);
            sendData("canv", 'out',e.clientX,e.clientY);
        }, false);
        
}

function findxy(res, cX,cY,canv_col,canv_size) {
		var rffset=canvas.getBoundingClientRect();
        if (res == 'down') {
			
            prevX = currX;
            prevY = currY;
            currX = cX - rffset.left;
            currY = cY - rffset.top;
    		
            flag = true;
            dot_flag = true;
            if (dot_flag) {
                ctx.beginPath();
                ctx.fillStyle = canv_col;
                ctx.fillRect(currX, currY, 2, 2);
                ctx.closePath();
                dot_flag = false;
            }
        }
        if (res == 'up' || res == "out") {
            flag = false;
        }
        if (res == 'move') {
            if (flag) {
                prevX = currX;
                prevY = currY;
                currX = cX - rffset.left; //canvas.offsetLeft
                currY = cY - rffset.top;
                draw(canv_col,canv_size);
            }
        }
    }


function draw(canv_col,canv_size) {
  ctx.beginPath();
  ctx.moveTo(prevX, prevY);
  ctx.lineTo(currX, currY);
  ctx.strokeStyle = canv_col;
  ctx.lineWidth = canv_size;
  ctx.stroke();
  ctx.closePath();
}

function clearAll() {
	ctx.fillStyle = "white";
    ctx.clearRect(0,0,canvas.width, canvas.height);
    ctx.fillRect(0,0,canvas.width, canvas.height);
	console.log(1);
	canvas_store=[];
	canvas_idx=-1;
    if(dataChannel&&dataChannel.readyState=='open'){
    	dataChannel.send(
    	JSON.stringify({
			type: 'canv',
			data: canvas_store,
			idx: canvas_idx
		}));
	}
}
function change_color(col){
	canv_col=col.style.background;
}
function change_ft(y_value){
	console.log(y_value);
	console.log(typeof(y_value));
	canv_size=y_value.value;
}
