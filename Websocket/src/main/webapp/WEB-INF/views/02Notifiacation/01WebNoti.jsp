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
<div class="container">

	<h2>WebNotification</h2>
	
	<button onclick="calculate();">버튼을 누르면 1초후에 WebNotification 이 뜹니다.</button>
	<script type="text/javascript">
	
		window.onload = function(){
			//현재 웹브라우저가 웹노티를 지원하는지 확인한다.
			if(window.Notification) {
				//알림에 관한 권한요청을 
				Notification.requestPermission();
			}
			else{
				alert("웹노티를 지원하지 않습니다.");
			}
		}
		//버튼 클릭시 1초후 notify()메서드를 호출한다.
		function calculate(){
			setTimeout(function(){
				notify();
			},1000);
		}
		
		//실행시 권한을 확인하여 허용되지 않았따면 경고창 띄움
		function notify(){
			if(Notification.permission != 'granted') {
				alert("웹노티를 지원하지 않습니다.");
			}
			else {
				//Notification객체를 통해 제목, 내용, 아이콘을 설정한 후 표시한다.
				var notification = new Notification (
						'Title 입니다.',
						{
							icon: 'http://cfile201.uf.daum.net/image/235BFD3F5937AC17164572',
							  body: '여긴내용입니다. 클릭하면 KOSMO로 이동합니다.',

						});
		
			//알림창을 클릭했을때 이동할 url을 이벤트핸들러에 등록한다.
			notification.onclick = function(){
				window.open('http://www.ikosmo.co.kr');
			};
		}
		}
	</script>
	<ul>
	   	 <li>웹노티 Browser compatibility -> https://developer.mozilla.org/ko/docs/Web/API/notification</li>
	   	 <li>Chrome, Firefox지원됨. IE지원안됨</li>
	</ul>
	
</div>
</body>
</html>