<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//request값받기
 	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String sung = request.getParameter("sung");
    String hobby = String.join(",",request.getParameterValues("hobby"));
    String birth = request.getParameter("birth");
    
    String sql="select pwd from gesipan where id="+id;
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    if(pwd.equals(rs.getString("pwd"))){
	    //쿼리생성
		sql="update gesipan set title=?,name=?,content=?,sung=?,hobby=?,birth=? where id=?";
		//심부름꾼생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//쿼리실행
		pstmt.setString(1,title);
		pstmt.setString(2,name);
		pstmt.setString(3,content);
		pstmt.setString(4,sung);
		pstmt.setString(5,hobby);
		pstmt.setString(6,birth);
		pstmt.setString(7,id);
		pstmt.executeUpdate();
		//다음페이지
		response.sendRedirect("content1.jsp?id="+id);
    }else{
    	response.sendRedirect("update1.jsp?id="+id);
    }
    conn.close();
%>
