<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String result = "";
	if(age>=20){
		result = "성인입니다.";
	}else{
		result = "미성년자입니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력받은 폼</title>
</head>
<body>
	<b><%= name %></b>님은 <%=result %>
</body>
</html>