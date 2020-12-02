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
	
    //limit에 들어갈 index번호 생성
	int index;//limit에 전달할 index값
    int pager;//현재 나타내고자 하는 페이지값을 저장
    if(request.getParameter("pager")==null){
    	pager=1;
    }else{
    	pager=Integer.parseInt(request.getParameter("pager"));
    }
    
    index=(pager-1)*10;
   	//쿼리생성
	String sql="select * from gesipan order by id desc limit "+index+",10";
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
<style>
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:underline;
	}
</style>
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
	<% while(rs.next()){
			//숫자로된 성별을 문자로 변환하는 제어문
			String sung=null;
			switch(rs.getInt("sung")){
				case 0: sung="여자"; break;
				case 1: sung="남자"; break;
				case 2: sung="선택안함"; break;
			}%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><a href="content1.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title") %></td>
			<td><%=sung%></td>
			<td><%=rs.getString("writeday") %></td>
		</tr>
		<%}%>
		<tr><!-- 사용자가 클릭하여 이동할 수있는 페이지 출력 -->
			<td colspan="4" align="center">
			<% //총 페이지값을 구하기 총레코드수/페이지당레코드수
			sql="select count(*) as cnt from gesipan";
			ResultSet rs2=stmt.executeQuery(sql);
			rs2.next();
			
			//총 페이지 수
			int page_cnt=rs2.getInt("cnt")/10+1; 
			
			if(rs2.getInt("cnt")%10==0)
				page_cnt--;
			//out.print(page_cnt);//총페이지수 보기 
			
			//pstart.txt 참조
			int	pstart;
			pstart=pager/10;
			if(pager%10==0){
				pstart-=1;
			}
			pstart=Integer.parseInt(pstart+"1");
			int pend=pstart+9;
			
			if(page_cnt < pend) //페이지가 최종페이지를 넘어가면 페이지카운트가 마지막페이지가됨
				pend=page_cnt;
			
			%>
			<!-- 이전페이지 -->
			<!-- 현재 페이지 그룹 이전 10페이지 -->
			<%if(pstart!=1){ %>
			<a href="list1.jsp?pager=<%=pstart-1%>">◀◀</a>
			<%}else {%> ◀◀ <%} %>
			<!-- 현재페이지 기준 1페이지 이전 -->
			<%if(pager!=1){%>
			<a href="list1.jsp?pager=<%=pager-1%>">◀</a>
			<%} else{%> ◀ <%}
			for(int i=pstart;i<=pend;i++){
				String str="";
				if(pager == i)
					str="style='color:red;'";
				%>
			<a href="list1.jsp?pager=<%=i%>"<%=str %>><%=i%></a>
			<%}%>
			
			<!-- 다음페이지 -->
			<!-- 현제페이지 기준 1페이지 이후-->
			<%if(pager!=page_cnt){ %>
			<a href="list1.jsp?pager=<%=pager+1%>">▶</a>
			<%}else{ %> ▶ <%} %>
			<!-- 현재 페이지 기준 다음 그룹으로 10페이지 이동-->
			<%if(page_cnt != pend){ %>
			<a href="list1.jsp?pager=<%=pend+1%>">▶▶</a>
			<%} else{%> ▶▶ <%} %>
			</td>
		</tr>
		<tr>
			<td colspan="2"><a href="write1.jsp">글쓰기</a></td>
		</tr>
	</table>
</body>
</html>
<%conn.close();%>