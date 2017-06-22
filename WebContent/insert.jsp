<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">

<% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<hr/>
	<%
		ArrayList<User> list = UserDAO.selectAll();
	%>
	<table>
	<form method="post" action="index.jsp" style="display:inline">
	<tr>
		<td>userId : </td><td><input type="text" name="userId"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td><td><input type="text" name="passwd"></td>
	</tr>
	<tr>
		<td>사용자유형 : </td>
		<td>
			<select name="sec">
				<option value="0">관리자</option>
				<option value="1">일반사용자</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>이름 : </td><td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>학교 : </td><td><input type="text" name="school"></td>
	</tr>
	<tr>
		<td>학과 : </td><td><input type="text" name="depart"></td>
	</tr>
	<tr>
		<td>학번 : </td><td><input type="text" name="num"></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="초기화면으로" class="btn" onclick="location.href='index.jsp'" style="float: right;">
        </td>
        <td>&nbsp<button type="submit" class="btn">회원가입</button></td>
	</tr>
	</form>
    </table>
</div>
</body>
</html>