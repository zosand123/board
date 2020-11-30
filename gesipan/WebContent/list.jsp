<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//쿼리생성
	String sql="select * from gesipan order by id desc";
    //심부름꾼
    Statement stmt=conn.createStatement();
   	//쿼리실행
   	ResultSet rs=stmt.executeQuery(sql);
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 레코드내용 -->
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td>제목</td>
			<td>성별</td>
			<td>작성일</td>
		</tr>
		<%
		while(rs.next()){
			//숫자로된 성별을 문자로 변환하는 제어문
			String sung=null;
			switch(rs.getInt("sung")){
				case 0: sung="여자"; break;
				case 1: sung="남자"; break;
				case 2: sung="선택안함"; break;
			}
		%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><a href="content.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title") %></td>
			<td><%=sung%></td>
			<td><%=rs.getString("writeday") %></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="2"><a href="write.jsp">글쓰기</a></td>
		</tr>
	</table>
</body>
</html>