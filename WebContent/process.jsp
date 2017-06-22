<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>승혀니</title>
<style>
    label { margin-top: 20px; }
</style>
</head>
<body>
<div class="container">

<% request.setCharacterEncoding("UTF-8");
if(request.getMethod().equals("POST")) {//수정
	String userId = request.getParameter("userId");
	String passwd = request.getParameter("passwd");
	String s = request.getParameter("sec");
	int sec = Integer.parseInt(s);
	String name = request.getParameter("name");
	String school = request.getParameter("school");
	String depart = request.getParameter("depart");
	String num = request.getParameter("num");
	UserDAO.update(userId, passwd, sec, name, school, depart, num);
	out.print("<h2>회원정보수정 성공</h2>");
} else { //삭제
	String userId = request.getParameter("userId");
	UserDAO.delete(userId);
	out.print("<h2>회원정보삭제 성공</h2>");
}
%>
<hr/>
<input type="button" value="초기화면으로" class="btn"
           onclick="location.href='index.jsp'">
</div>
</body>
</html>
