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
	<jsp:useBean id="testBean" class="ch10.TestBean">
		<jsp:setProperty property="name" name="testBean"/>
	</jsp:useBean>
	<h3>자바빈을 사용하는 jsp 페이지</h3>	
	<hr>
	입력된 이름은 <jsp:getProperty property="name" name="testBean"/>
</body>
</html>