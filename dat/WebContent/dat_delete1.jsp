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
    String pwd = request.getParameter("pwd");
    
  	String sql="select pwd,gid from dat where id="+id;
  	Statement stmt= conn.createStatement();
  	ResultSet rs=stmt.executeQuery(sql);
  	rs.next();
    if(pwd.equals(rs.getString("pwd"))){
		sql="delete from dat where id="+id;
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
    }
    	response.sendRedirect("content1.jsp?id="+rs.getString("gid"));
    
	conn.close();
%>