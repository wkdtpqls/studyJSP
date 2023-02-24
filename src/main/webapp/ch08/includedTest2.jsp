<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String pageName = request.getParameter("pageName");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	includedTest2.jsp 페이지 내용입니다. <br>
	<%=name %>님 하이~! 포함되는 페이지 <%=pageName %>입니다!
</body>
</html>