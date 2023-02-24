<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<p>글쓰기</p>
<form method="post" action="insertPro.jsp" name="insertform" onsubmit="return writeSave()">
		<table>
			<tr>
				<th class="thcolor">이 름</th>
				<td class="tdcolor">
					<input type="text" size="10" maxlength="20" name="writer">
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">제 목</th>
				<td class="tdcolor">
					<input type="text" size="40" maxlength="50" name="subject">
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">Email</th>
				<td class="tdcolor">
					<input type="text" size="40" maxlength="50" name="email">
				</td>
			</tr>
			
			<tr>
				<th class="thcolor">내 용</th>
				<td class="tdcolor">
					<textarea name="content" rows="13" cols="42" ></textarea>
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
					<input type="submit" value="저 장" >
					<input type="reset" value="다시 작성" >
					<input type="button" value="목록보기" onclick="window.location='list.jsp'" >
				</th>
			</tr>
		</table>
</form>
</body>
</html>