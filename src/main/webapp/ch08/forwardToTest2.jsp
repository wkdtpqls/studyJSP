<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		포워딩되는 패이지 forwardToTest2.jsp입니다.
		<hr>
		<b><%=id %></b>님의 취미는 <%=hobby %>입니다~!
</body>
</html>