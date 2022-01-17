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
	<h2>@RequestMapping어노테이션</h2>
	<h3>Get방식으로 전송하기</h3>
	
	<script>
	function searchCheck(f){
		if(!f.searchWord.value){
			alert("검색어를 입력하세요");
			f.searchWord.focus();
			return false;
		}
	}
	</script>
	<form action="../requestMapping/getSearch.do" 
		method="get" name="searchFrm" 
		onsubmit="return searchCheck(this);">
	
	<select name="searchColumn" id="">
		<option value="title">제목</option>
		<option value="name">작성자</option>
		<option value="content">내용</option>

	</select>	
	
	<input type="text" name="searchWord" />
	<input type="submit"  value="검색하기"/>
		
	</form>

</div>
</body>
</html>