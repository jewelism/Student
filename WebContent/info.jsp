<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, student.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승현이꺼</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<style>
tbody tr:hover { background-color: #ffa; cursor: pointer; }
thead { background-color: #eee; }
</style>
<script>
    $(function() {
        $("tbody tr").click(function() {
            location.href = $(this).attr("data-url");
        });
    });
</script>
<% request.setCharacterEncoding("UTF-8");%>
</head>
<body>
	<%	
	boolean flag = false;
	int sec = 1;
	if(request.getMethod().equals("POST")) {
		ArrayList<User> list2 = UserDAO.selectAll();
		String userId = request.getParameter("userId");
		String passwd = request.getParameter("passwd");
		
		for(User user : list2){
			if(user.getUserId().equals(userId)){
				if(user.getPasswd().equals(passwd)){
					flag = true;
					if(user.getSec()==0)
						sec=0;
				}
			}
		}
	}
		
	%>
	<div class="container">
	<% if(flag){%>
	
	<h1>회원목록</h1>
	<hr/>
	<table class="table table-bordered">
		<thead>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>사용자유형</td>
			<td>이름</td>
			<td>학교</td>
			<td>학과</td>
			<td>학번</td>
		</tr>
		</thead>
	<%} %>
		<%
			if(flag){
				ArrayList<User> list = UserDAO.selectAll();
				for (User user : list) {
		%>
		<tbody>
		<tr data-url="update.jsp?userId=<%=user.getUserId()%>&sec=<%=sec%>">
			<td><%=user.getUserId()%></td>
			<td><%=user.getPasswd()%></td>
			<td><% if(user.getSec()==0){
						out.print("관리자");
					} else {
						out.print("일반 사용자");
					}
			%></td>
			<td><%=user.getName()%></td>
			<td><%=user.getSchool()%></td>
			<td><%=user.getDepart()%></td>
			<td><%=user.getNum()%></td>
		</tr>
		</tbody>
		<%
				}
			} else {
				out.print("<h2>해당사용자는 없습니다.</h2>");
				//response.sendRedirect("index.jsp");
			}
		%>
	</table>
	<hr/>
	<input type="button" value="초기화면으로" class="btn"
           onclick="location.href='index.jsp'">
           </div>
</body>
</html>