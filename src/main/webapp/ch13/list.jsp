<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.BoardVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	int count = 0; // 총글수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	List<BoardVO> alist = null;
	BoardDAO bdao = BoardDAO.getInstance();
	count = bdao.getArticleCount();
	
	//---------------------------- 페이지 처리
	int pageSize = 5;
	int number = 0; //현재 페이지의 시작 번호
	String pageNum =null; //현재 페이지 번호 
	 
	pageNum = request.getParameter("pageNum");
	if(pageNum == null){ //처음 접속하면 항상 1페이지
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum); 	//1 			//2
	int startRow = (currentPage-1) * pageSize + 1; 	//(1-1)*10+1=1	//(2-1)*10+1=11
	int endRow = currentPage * pageSize;			//1*10=10 		//2*10=20
	
	number = count - (currentPage -1)* pageSize;	//12-(1-1)*10=12 //12-(2-1)*10=2	
	//----------------------------
	
	if(count > 0){
		alist = bdao.getArticles(startRow, pageSize);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<p>글목록 (전체글 : <%=count %>)</p>
<table>
	<tr>
		<td width="620" align="right">
			<input type="button" value="글쓰기"
				 onclick="window.location='insertForm.jsp'">
		</td>
	</tr>
</table>
<%
	if(count == 0){
%>
		<table>
			<tr>
				<td align = "center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
<%		
	}else{
%>
		<table>
			<tr>
				<th width="50" class="thcolor">번 호</th>
				<th width="250" class="thcolor">제 목</th>
				<th width="100" class="thcolor">작성자</th>
				<th width="150" class="thcolor">작성일</th>
				<th width="50" class="thcolor">조 회</th>
			</tr>
<%
		for(int i=0; i<alist.size();i++){
			BoardVO article = alist.get(i);
%>
		<tr>
			<td align="center" class="tdcolor"><%=number-- %></td>
			<td class="tdcolor" align="left">
			<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage %>">
			<%=article.getSubject() %></a>
			</td>
			<td align="center" class="tdcolor"><%=article.getWriter() %></td>
			<td align="center" class="tdcolor"><%=sdf.format(article.getReg_date()) %></td>
			<td align="center" class="tdcolor"><%=article.getReadcount() %></td>
		</tr>
<%			
		}
%>			
		</table>
<%		
	}
%>
<%
//---------------- 페이지 번호 목록
	if(count > 0){
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		int startPage=1;
		if(currentPage % 10 != 0){
			startPage = (int)(currentPage/10)*10+1;
			
		}else{
			startPage = ((int)(currentPage/10)-1)*10+1;
		}
		
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount){
			endPage = pageCount;
		}
		if(startPage>10){
%>
			<a href = "list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%			
		}
		
		for(int i=startPage; i<=endPage; i++){
%>
			<a href = "list.jsp?pageNum=<%=i %>">[ <%=i %> ]</a>
<%			
		}
	if(endPage < pageCount){
%>
			<a href = "list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
<%			
		}
	}
//----------------
%>
</body>
</html>