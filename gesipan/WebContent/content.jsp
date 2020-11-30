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
	//reauest값 읽어오기
    String id = request.getParameter("id");
    //쿼리생성
	String sql="select * from gesipan where id="+id;
	//심부름꾼생성
	Statement stmt=conn.createStatement();
	//쿼리실행
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();
	
%>
			<%
			String sung=null;
			switch(rs.getInt("sung")){
				case 0: sung="여자"; break;
				case 1: sung="남자"; break;
				case 2: sung="선택안함"; break;
			}
			
			//취미구하기
			String[] hobby=rs.getString("hobby").split(",");
			String hob="";
			for(int i=0; i<hobby.length; i++){
				switch(hobby[i]){
					case "0": hob=hob+" 맛집"; break;
					case "1": hob=hob+" 여행"; break;
					case "2": hob=hob+" 독서"; break;
					case "3": hob=hob+" 넷볼"; break;
					case "4": hob=hob+" 풋살"; break;
					case "5": hob=hob+" 번개"; break;
						
				}
			}
			conn.close();
			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td><%=rs.getString("name") %></td>
			<td>성별</td>
			<td><%=sung %></td>
			<td>취미</td>
			<td><%=hob%></td>
		</tr>
		<tr>
			<td>태어난 해</td>
			<td colspan="2"><%=rs.getString("birth") %></td>
			<td>작성일</td>
			<td colspan="2"><%=rs.getString("writeday") %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="5"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5"><%=rs.getString("content") %></td>
		</tr>
		<tr>
			<td colspan="6" align="center">
				<button>수정</button>
				<a href="delete.jsp">삭제</a>
				<a href="list.jsp">목록</a>
			</td>
		</tr>
	</table>
</body>
</html>