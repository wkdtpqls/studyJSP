<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 내장 객체</title>
</head>
<body>
	<h3>out 내장 객체 - out.prinln() 사용</h3>
	<hr>
	<%
		String name = "홍길동";
		out.println(name+"의 이름 입니다.");
	%>
	
	<br><br>
	
	<h3>위와 같은 표현식</h3>
	<hr>
	<%= name %>의 이름입니다.
</body>
</html>