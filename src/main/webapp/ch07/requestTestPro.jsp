<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String sub = request.getParameter("subject");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력받은 폼</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>과목</td>
		</tr>
		
		<tr>
			<td><%=num %></td>
			<td><%=name %></td>
			<td><%=grade %></td>
			<td><%=sub %></td>
		</tr>
	</table>
</body>
</html>