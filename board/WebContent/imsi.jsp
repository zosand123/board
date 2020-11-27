<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{list-style-type:none;}
</style>
<script>
function view(){
	document.getElementById("aa").style.display="block";
}
function view2(){
	document.getElementById("bb").style.visibility="visible";
}
</script>
</head>
<body>
	<a href="javascript:view()">보이기</a> <p>
	<ul>
		<li>1</li>
		<li style="display:none;" id="aa">2</li>
		<li>3</li>
		<li>4</li>
	</ul>
	<hr>
	<a href="javascript:view2()">보이기</a> <p>
	<ul>
		<li>1</li>
		<li style="visibility:hidden;" id="bb">2</li>
		<li>3</li>
		<li>4</li>
	</ul>
</body>
</html>