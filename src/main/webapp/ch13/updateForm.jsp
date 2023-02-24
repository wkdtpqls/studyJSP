<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.BoardVO" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.getArticleUpdate(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="script.js"></script>
<style>
	th { width:80pt;}
	td { width:300pt;}
</style>
</head>
<body>
<p>글수정</p>
<form method="post" action="updatePro.jsp" name="insertform" onsubmit="return writeSave()">
		<table>
			<tr>
				<th class="thcolor">이 름</th>
				<td class="tdcolor">
					<input type="text" size="10" maxlength="20" name="writer" value="<%= article.getWriter() %>">
					<input type="hidden" name="num" value="<%= article.getNum() %>"> 
					<input type="hidden" name="pageNum" value="<%= pageNum %>"> 
					<!-- 글 내용보기에는 num의 정보가 없기 때문에 hidden으로 num 정보를 넘겨주어야 한다. -->
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">제 목</th>
				<td class="tdcolor">
					<input type="text" size="40" maxlength="50" name="subject" value="<%= article.getSubject() %>">
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">Email</th>
				<td class="tdcolor">
					<input type="text" size="40" maxlength="50" name="email" value="<%= article.getEmail() %>">
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">내 용</th>
				<td class="tdcolor">
					<textarea name="content" rows="13" cols="42" ><%= article.getContent() %></textarea>
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">비밀번호</th>
				<td class="tdcolor">
					<input type="password" size="8" maxlength="15" name="passwd">
				</td>
			</tr>
			<tr>
				<th colspan=2 class="thcolor">
					<input type="submit" value="수정하기" >
					<input type="reset" value="다시 작성" >
					<input type="button" value="목록보기" onclick="window.location='list.jsp?pageNum=<%=pageNum %>'" >
				</th>
			</tr>
		</table>
</form>
</body>
</html>