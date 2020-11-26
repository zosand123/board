<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 </title>
</head>
<body>
<form method="post" action="write_ok.jsp">
<table width="600" align="center">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="40" rows="5" name="content"></textarea></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td>비밀번호확인</td> 
		<td><input type="password" name="pwd2" onkeyup="pwd_check(this.form)">
			<span id="msg"></span> <!--this.form 이해안감!!!!! -->
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><button>저장하기</button></td>
	</tr>
</table>
</form>
<script>
function pwd_check(my){
	if(my.pwd.value!=my.pwd2.value){
		document.getElementById("msg").innerText="비번이 틀립니다"
		document.getElementById("msg").style.color="red";
	}else{
		document.getElementById("msg").innerText="비번이 일치합니다"
		document.getElementById("msg").style.color="blue";
	}
}
</script>
</body>
</html>