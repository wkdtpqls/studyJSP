<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageName = request.getParameter("pageName");
	pageName += ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포함하는 페이지 includeTest.jsp 페이지 입니다.
	<hr>
	<jsp:include page="<%=pageName %>"></jsp:include>
	<hr>
	includeTest.jsp의 나머지 내용입니다.
	
</body>
</html>