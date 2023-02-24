<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	String local = request.getParameter("local");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String local_num = "";
	
	if(local.equals("서울")){
		local_num = "02";
	} else if(local.equals("부산")){
		local_num = "051";
	}else{
		local_num = "031";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력받은 폼</title>
</head>
<body>
	<b><%=name %></b>님의 전화번호는 <%=local_num %>-<%=tel1 %>-<%=tel2 %>입니다.
</body>
</html>