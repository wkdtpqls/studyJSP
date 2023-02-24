<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.BoardVO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.getArticle(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
	th { width:110pt;}
	td { width:110pt;}
</style>
</head>
<body>
<p>글 내용 보기</p>
		<table>
			<tr>
				<th class="thcolor">글번호</th>
				<td align="center" class="tdcolor"> <%=article.getNum() %></td>
			
				<th class="thcolor">조회수</th>
				<td align="center" class="tdcolor"> <%=article.getReadcount()%> </td>
			</tr>
			
			<tr>
				<th class="thcolor">작성자</th>
				<td align="center" class="tdcolor"> <%=article.getWriter() %></td>
			
				<th class="thcolor">작성일</th>
				<td align="center" class="tdcolor"><%=sdf.format(article.getReg_date()) %></td>
			</tr>
			
			<tr>
				<th class="thcolor">글제목</th>
				<td  colspan="3" class="tdcolor"> <%=article.getSubject() %></td>
			</tr>
			
			<tr>
				<th class="thcolor">글내용</th>
				<td  colspan="3" class="tdcolor"> <%=article.getContent() %></td>
			</tr>
			<tr>
				<th colspan="4" class="thcolor">
					<input type="button" value="글수정" onclick="window.location='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum %>'" >
					<input type="button" value="글삭제" onclick="window.location='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum %>'">
					<input type="button" value="글목록" onclick="window.location='list.jsp?pageNum=<%=pageNum %>'" >
				</th>
			</tr>
		</table>
</body>
</html>