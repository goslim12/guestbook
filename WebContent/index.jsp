<%@page import="java.util.List"%>
<%@page import="com.cafe24.guestbook.dao.GuestBookDao"%>
<%@page import="com.cafe24.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	GuestBookDao dao = new GuestBookDao();
	List<GuestBookVo> list = dao.getList();
	int count =1;
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook/add.jsp" method="post">
		<table border="1" width="500">
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<% for(GuestBookVo vo :list) {%>
	<br>
	<table width="510" border="1">
		<tr>
			<td>[<%=vo.getNo() %>]</td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getRegDate() %></td>
			<td><a href="deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">
			<%=vo.getContent().replace("\n", "<br/>") %><br>
			</td>
		</tr>
	</table>
		<% } %>
</body>
</html>