<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/ksy";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request값 읽어오기
	String id=request.getParameter("id");
	
	//쿼리생성
	String sql="select * from board where id="+id;
	
	//심부름꾼호출
	Statement stmt=conn.createStatement();
	
	//쿼리실행 => resultSet 받기
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#del{
	visibility:hidden;
	position:absolute;

}
</style>
<script>
function view_del(){
	//alert(event.clientX+", "+event.clientY);
	let x=event.clientX; //마우스 가로좌표
	let y=event.clientY; //마우스 새로좌표
	document.getElementById("del").style.visibility="visible"
	document.getElementById("del").style.left=x-30+"px";
	document.getElementById("del").style.top=y+30+"px";
}
</script>
</head>
<body>
	<!-- ResultSet의 내용을 출력 : name,title,content,readnum,writeday -->
	<table width="500" align="center" border="1">
	<tr>
		<td>작성자</td>
		<td><%=rs.getString("name")%></td>
		<td>조회수</td>
		<td><%=rs.getString("readnum")%></td>
		<td>작성일</td>
		<td><%=rs.getString("writeday")%></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="5"><%=rs.getString("title")%></td>
	</tr>
	<tr height="200">
		<td>내용</td>
		<td colspan="5"><%=rs.getString("content")%></td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<a href="update.jsp?id=<%=id%>">수정</a>
		<a href="#" onclick="view_del()" >삭제</a>
		<a href="list.jsp">목록</a>
		</td>
	</tr>
	<%
	if(request.getParameter("chk")!=null){
	%>
	<tr>
		<td colspan=6 align="center">비번이틀렸네요</td>
	</tr>
	<%
	}
	%>
	</table>
	<form method="post" action="delete.jsp" id="del">
		<input type="hidden" name="id" value="<%=id%>">
	비번<input type="password" name="pwd">
	   <input type="submit" value="삭제">
	</form>
</body>
</html>