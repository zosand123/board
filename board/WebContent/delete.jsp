<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/ksy";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	//request값 가져오기
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd"); //사용자가 입력한 비밀번호
	
	//db에 있는 비밀번호 가져오기
		//쿼리생성
	String sql="select pwd from board where id="+id;
		//심부름꾼
	Statement stmt=conn.createStatement();
		//실행후 ResultSet
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();
	
	if(pwd.equals(rs.getString("pwd"))){
		sql="delete from board where id="+id;
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	rs.close();
	stmt.close();
	conn.close();
%>
