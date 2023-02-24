<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포워딩하는 페이지 forwardTest.jsp로 절대 표시되지 않습니다.
	<jsp:forward page = "forwardToTest.jsp"></jsp:forward>
	forwardTest.jsp펭지의 나머지 부분도 표시되지 않습니다.
</body>
</html>