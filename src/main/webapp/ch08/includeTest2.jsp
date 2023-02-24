<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String name = "홍길동";
	String pageName = "includedTest2.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	여기는 includeTest2.jsp 페이지 입니다.
	<br>
	포함되는 패이지에 파라미터 값을 전달합니다.
	<hr>
	<jsp:include page="includedTest2.jsp">
		<jsp:param value="<%=name %>" name="name"/>
		<jsp:param value="<%=pageName %>" name="pageName"/>
	</jsp:include>
	<hr>
	includedTest2.jsp의 나머지 내용입니다.
</body>
</html>