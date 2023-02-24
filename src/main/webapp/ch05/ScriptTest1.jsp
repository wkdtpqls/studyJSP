<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전역변수, 지역변수</title>
<%!
	String str1 = "전역변수1 입니다.";
	String getStr(){
		return str1;
	}
	String str3 = "전역변수2 입니다.";
%>
</head>
<body>
	<h3>전역변수와 지역변수</h3>
	<hr>
	<%
		String str2 = "지역변수입니다.";	
	%>
	스크립트릿에서 선언한 str2는 <%=str2 %> <br>
	선언문에서 선언한 변수 str1는 <%=getStr() %> <br>
	선언문에서 선언한 변수 str3는 <%=str3 %>
	
</body>
</html>