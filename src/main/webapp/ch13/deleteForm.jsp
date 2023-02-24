<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="script.js"></script>
<style>
	th { width:200pt;}
	td { width:200pt;}
</style>
</head>
<body>
<p>글삭제</p>
<form method="post" action="deletePro.jsp" name="insertform" onsubmit="return writeSave()">
		<table>
			<tr>
				<th class="thcolor">비밀번호를 입력해주세요.</th>
			</tr>
			<tr>
				<td class="tdcolor"> 비밀번호 : 
					<input type="password" size="10" maxlength="15" name="passwd">
					<input type="hidden" name="num" value="<%=num %>"> 
					<input type="hidden" name="pageNum" value="<%=pageNum %>">
					<!-- 글 내용보기에는 num의 정보가 없기 때문에 hidden으로 num 정보를 넘겨주어야 한다. -->
				</td>
			</tr>
			<tr>
				<th class="thcolor">
					<input type="submit" value="삭제하기" >
					<input type="button" value="목록보기" onclick="window.location='list.jsp?pageNum=<%=pageNum %>'" >
				</th>
			</tr>			
		</table>
</form>	
</body>
</html>