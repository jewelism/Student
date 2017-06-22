<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>승혀니</title>
</head>
<div class="container">

<% request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String s = request.getParameter("sec");
	int sec = Integer.parseInt(s);
	ArrayList<User> list = UserDAO.selectAll();
	User u = new User();
	for(User user : list){
		if(user.getUserId().equals(userId)){
			u.setUserId(user.getUserId());
			u.setPasswd(user.getPasswd());
			u.setDepart(user.getDepart());
			u.setName(user.getName());
			u.setNum(user.getNum());
			u.setSchool(user.getSchool());
			u.setSec(user.getSec());
		}
	}
%>
    <h1>사용자 정보 수정</h1>
    <hr />
    <form method="post" action="process.jsp" style="display: inline;">
	<table>
	<tr>
		<td>로그인ID</td><td><input name="userId" value="<%=u.getUserId()%>" readonly/></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input name="passwd" value="<%=u.getPasswd()%>"/></td>
	</tr>
	<tr>
		<td>사용자 유형&nbsp</td>
		<td>
		<select name="sec"> 
            <option label="관리자" value="0" />
            <option label="일반 사용자" value="1" />
        </select><br/>
        </td>
	</tr>
	<tr>
		<td>이름</td><td><input name="name" value="<%=u.getName()%>"/></td>
	</tr>
	<tr>
		<td>학교</td><td><input name="school" value="<%=u.getSchool()%>"/></td>
	</tr>
	<tr>
		<td>학과</td><td><input name="depart" value="<%=u.getDepart()%>"/></td>
	</tr>
	<tr>
		<td>학번</td><td><input name="num" value="<%=u.getNum()%>"/></td>
	</tr>
	<tr>
		<td><input type="submit" class="btn" value="저장" /></td></form>
		<td><input type="button" value="초기화면으로" class="btn" onclick="location.href='index.jsp'"></td>
		<td>
			<% if(sec==0){%>
    		<form method="get" action="process.jsp" style="display: inline;">
    			<input type="hidden" name ="userId" value="<%=u.getUserId()%>">
    			<input type="submit" class="btn btn-small" value="회원삭제" />
    		</form>
    		<%} %>
    	</td>
    	
	</tr>
    
    
    
    </table>
</div>
</body>
</html>
