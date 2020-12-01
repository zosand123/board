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
	//request값 가져오기
	String id = request.getParameter("id");
	//쿼리생성
	String sql="select * from gesipan where id="+id;
	//심부름꾼생성
	Statement stmt=conn.createStatement();
	//쿼리실행=> ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	//하나의 레코드를 읽어와서 폼태그에 전달
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//성별,취미,태어난해 적용해서 처음선택했던 값으로 표현되게하기
	function init(){
		//성별
		document.ksy.sung[<%=rs.getInt("sung")%>].checked=true
		//취미
		let hob="<%=rs.getString("hobby")%>";
		let hobby=hob.split(",");
		for(i=0;i<hobby.length;i++){
			document.ksy.hobby[hobby[i]].checked=true;
		}
		//태어난해
		document.ksy.birth.value=<%=rs.getString("birth")%>;
	}
	//변수앞에붙는 var은 함수밖에서는 있으나 없으나 동일하지만 
	//함수내에서 붙으면 지역변수, 없으면 전역변수가 된다. 귀찮으면 그냥 다 안붙이면됨 
</script>
</head>
<body onload="init()">
<form name="ksy" method="post" action="update_ok1.jsp">
<input type="hidden" name="id" value="<%=id%>"> <!-- 수정할때 꼭가져가야하는것-->
  	<table width="600" align="center">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="<%=rs.getString("title")%>"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" value=""></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="40" rows="5" name="content"><%=rs.getString("content")%></textarea></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" name="sung" value="0">여자
			<input type="radio" name="sung" value="1">남자
			<input type="radio" name="sung" value="2">선택안함
		</td>
	</tr>
	<tr>
		<td>취미</td>
		<td>
			<input type="checkbox" name="hobby" value="0">맛집
			<input type="checkbox" name="hobby" value="1">여행
			<input type="checkbox" name="hobby" value="2">독서
			<input type="checkbox" name="hobby" value="3">넷볼
			<input type="checkbox" name="hobby" value="4">풋살
			<input type="checkbox" name="hobby" value="5">번개
		</td>
	</tr>
	<tr>
		<td>태어난 해</td>
		<td>
			<select name="birth">
			<%for(int i=2020;i>=1900;i--){ %>
				<option value="<%=i%>"><%=i %></option>
			<% }%>
			</select>
		</td>
	</tr>
	<tr>
    <td colspan="2" align="center">
      <input type="submit" value="수정하기"> 
    </td>
   </tr>
	</table>
</form>
</body>
</html>
<%conn.close();%>