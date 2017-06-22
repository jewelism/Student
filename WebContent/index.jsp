<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승현이꺼</title>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<% request.setCharacterEncoding("UTF-8"); %>
<% if(request.getMethod().equals("POST")) {
		String userId = request.getParameter("userId");
		String passwd = request.getParameter("passwd");
		String s = request.getParameter("sec");
		int sec = Integer.parseInt(s);
		String name = request.getParameter("name");
		String school = request.getParameter("school");
		String depart = request.getParameter("depart");
		String num = request.getParameter("num");
		UserDAO.insert(userId, passwd, sec, name, school, depart, num);
	}
 %>
</head>
<body>
	<div class="container">
	<h1>회원관리</h1>
	<hr/>
	<table style="margin-top: 10px;">
	<form method="post" action="info.jsp" style="display: inline;">
		<tr>
			<td> id : </td><td><input type="text" name="userId"><br/></td>
		
		</tr>
		<tr>
			<td>passwd : </td><td><input type="password" name="passwd"><br/></td>
		</tr>
		<tr>
			<td><button type="submit" class="btn">로그인</button></td></form>
			
			<td>&nbsp<input type="button" value="회원가입" class="btn" onclick="location.href='insert.jsp'"></td>
			
		</tr>
	</table>
	</div>
</body>
</html>