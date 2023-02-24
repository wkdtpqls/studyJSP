<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf8"); %>    
<%
	String id = "홍길동";
  	String hobby = "만화보기";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포워딩하는 페이지 forwardTest2.jsp입니다.
	포워딩되는 패이지에 파라미터 값을 전달합니다.
	<hr>
	<jsp:forward page="forwardToTest2.jsp">
		<jsp:param value="<%=id %>" name="id"/>
		<jsp:param value="<%= hobby %>" name="hobby"/>
	</jsp:forward>
</body>
</html>