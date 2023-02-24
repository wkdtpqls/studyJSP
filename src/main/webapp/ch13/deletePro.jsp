<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	BoardDAO bdao = BoardDAO.getInstance();
	int check = bdao.deleteBoard(num, passwd);
	
	if(check == 1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else{
%>

		<script type = "text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%		
	}
	
%>
</body>
</html>