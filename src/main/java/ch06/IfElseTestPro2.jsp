<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 결과</h3>
	<hr>
	<%
		if(id.equals("aaa") && password.equals("aaa")){
	%>
		로그인에 성공하였습니다!		
	<% 
		}
		else{
	%>	
		로그인에 실패하였습니다!	
	<% 	}
	%>
</body>
</html>