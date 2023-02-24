<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
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
			<th width="100">글번호</th>
			<th width="100">글내용</th>
			<th width="100">글자</th>
		</tr>
		<% for(int i=1;i<=num;i++){ %>
		<tr>
			<td><%=i %></td>
			<td>글내용<%=i %></td>
			<td>글자<%=i %></td>
		</tr>
		<% } %>
	</table>
	
	<table border="1">
		<tr>
			<th width="100">글번호</th>
			<th width="100">글내용</th>
			<th width="100">글자</th>
		</tr>
		<% for(int i=num;i>=1;i--){ %>
		<tr>
			<td><%=i %></td>
			<td>글내용<%=i %></td>
			<td>글자<%=i %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>