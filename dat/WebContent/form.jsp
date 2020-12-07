<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function update()  // 폼태그의 성격을 수정으로 바꾼다
   {
	   // 폼태그의 action값을  => dat_update_ok.jsp로 변경
	   document.getElementById("pkc").action="dat_update_ok.jsp";
	   // 댓글달기 버튼의 텍스트를 '댓글수정'
	   document.getElementById("submit").value="댓글수정";
   }
   function del()     // 폼태그의 성격을 삭제로 바꾼다.
   {
	   document.getElementById("pkc").action="dat_delete.jsp";
	   document.getElementById("submit").value="댓글삭제";
   }
 </script>
</head>
<body>
  <form id="pkc" name="dat" method="post" action="dat_write_ok2.jsp">
      <input type="hidden" name="id"> <!-- dat테이블의 id -->
      <input type="text" name="name" size="5" placeholder="작성자">
      <input type="text" name="content" size="50" placeholder="댓글 내용">
      <input type="text" name="pwd" size="5" placeholder="비밀번호">
      <input type="submit" value="댓글달기" id="submit">
  </form>
 <table width="600"> 
  <tr>
    <td width="60"> <a href="javascript:update()"> 이름 </a> </td>
    <td> 내용 </td>
    <td width="100"> <a href="javascript:del()"> 작성일 </a> </td>
  </tr>
 </table>
</body>
</html>


