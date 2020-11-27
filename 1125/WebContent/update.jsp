<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

    // 조건문에 들어갈 id값을 request
    String id=request.getParameter("id");
    // 쿼리 생성
    String sql="select * from member where id="+id;
    // 심부름꾼 만들기
    Statement stmt=conn.createStatement();
    // 쿼리실행
    ResultSet rs=stmt.executeQuery(sql);  // select는 executeQuery()
    // 사용자가 클릭한 레코드의 값을 읽어와서 폼태그의 value에 전달
    rs.next();
%>    
<!DOCTYPE html>
<html>
<head> <!-- write.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function check(my)  // my==document.pkc
   {  // form태그 => form객체 접근,  body에 있는 태그 id(단수),class(복수)
       if(my.name.value.length < 3  || my.name.value.length > 5)
      {
         alert("이름을 똑바로 적으세요");
         return false;
      }
      else if(isNaN(my.age.value)||my.age.value.length==0)
    	   {
    	      alert("나이는 숫자로!!");
    	      return false;
    	   }
           else if(my.juso.value.length < 2)
        	    {
        	       alert("주소는 2자이상");
        	       return false;
        	    }
                else
                   return true;
     
   }
 </script>
</head>
<body>
    <!-- 이름은 3자이상 5자이하, 나이는 숫자인가, 주소는 2자 이상 되면 전송하기 -->
    <form name="pkc" method="post" action="update_ok.jsp" onsubmit="return check(this)">
     <input type="hidden" name="id" value="<%=id%>">
      이름 <input type="text" name="name" value="<%=rs.getString("name")%>"> <p>
      나이 <input type="text" name="age" value="<%=rs.getString("age")%>"> <p>
      주소 <input type="text" name="juso" value="<%=rs.getString("juso")%>"> <p>
      <input type="submit" value="수정">
    </form>
</body>
</html>




