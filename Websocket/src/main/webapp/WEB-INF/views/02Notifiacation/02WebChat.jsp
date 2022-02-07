<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/springlegacy/static/bootstrap5.1.3/css/bootstrap.css" />
<script src="/springlegacy/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<script>
var messageWindow;
var inputMessage;
var chat_id;
var webSocket;
var logWindow;

window.onload = function(){
	messageWindow = document.getElementById("messageWindow");
	messageWindow.scrollTop = messageWindow.scrollHeight;
	inputMessage= document.getElementById('inputMessage');
	chat_id = document.getElementById("chat_id").value;
	logWindow = document.getElementById('logWindow');
	
	webSocket = 
		new WebSocket('ws://localhost:8081/realexam02/EchoServer.do');
	webSocket.onopen=function(event){
		wsOpen(event);
	};
	webSocket.onmessage = function(event){
		wsMessage(event);
	};
	webSocket.onclose = function(event){
		wsClose(event);
	};
	webSocket.onerror = function(event){
		wsError(event);
	};
}
//접속했을때 호출됨.
function wsOpen(event){
	writeResponse('연결성공');
}
function wsMessage(event){
	/*
	메세지를 파이프 기호로 분리하여 앞부분은 보낸사람, 뒷부분은 메세지로 각각 변수에 저장한다.
	*/
	var message = event.data.split("|");
	var sender = message[0];
	var content = message[1];
	var msg;
	
	writeResponse(event.data);//로그창에 출력 
	
	if(content ==""){
		//전송된 내용이 없다면 아무것도 하지않음
	}
	else{
		//대화내용에 /가 포함되어 있다면 명령어로 판단한다.
		if(content.match("/")){
			if(content.match(("/" + chat_id))){
				var temp = content.replace(("/"+chat_id), "[귓속말]");
				msg = makeBalloon(sender, temp);
				messageWindow.innerHTML += msg;
				messageWindow.scrollTop = messgeWindow.scrollHeight;
			}
		}
		else {
			//대화내용에 /가ㅣ 없다면 일반적인 메세지로 판단한다.
			msg = makeBallon(sender, content);
			messageWindow.innerHTML += msg;
			messageWindow.scrollTop = messgeWindow.scrollHeight;
		}
	}
}

function wsClose(event){
	writeResponse("대화종료");
}
function wsError(event){
	writeResponse("에러발생");
	writeResponse(event.data);
	
}
function makeBalloon(id, cont){
	var msg = "";
	msg += '<div>'+id+':'+cont+"</div>";
	return msg;
}

function sendMessage(){
	webSocket.send(chat_id+'|'+inputMessage.value);
	
	var msg ="";
	msg += '<div style="text-align:right;">' +inputMessge.value+'</div>';
	
	messageWindow.innerHTML += msg;
	inputMessage.value ="";
	messageWindow.scrollTop = messageWindow.scrollHeight;
}
function enterkey(){
	if(window.event.keyCode == 13){
		sendMessage();
	}
}
function writeResponse(text){
	logWindow.innerHTML += "<br/>"+text;
	
}
</script>
<div class="container">
	<input type="hid den" id="chat_id" value="${param.chat_id }" />
    <input type="hid den" id="chat_room" value="${param.chat_room }" />
    <table class="table table-bordered">
   	 <tr>
   		 <td>방명:</td>
   		 <td>${param.chat_room }</td>
   	 </tr>
   	 <tr>
   		 <td>닉네임:</td>
   		 <td>${param.chat_id }</td>
   	 </tr>
   	 <tr>
   		 <td>메시지:</td>
   		 <td>
   			 <input type="text" id="inputMessage" class="form-control float-left mr-1" style="width:75%"
   			 onkeyup="enterkey();" />
   			 <input type="button" id="sendBtn" onclick="sendMessage();" value="전송" class="btn btn-info float-left" />
   		 </td>
   	 </tr>
    </table>
    <div id="messageWindow" class="border border-primary" style="height:300px; overflow:auto;">
   	 <div style="text-align:right;">내가쓴거</div>
   	 <div>상대가보낸거</div>
    </div>   
	<div id="logWindow" class="border border-danger" style="height:130px; overflow:auto;"></div>   

	

</div>
</body>
</html>