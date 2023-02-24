<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름과 전화번호를 입력하는 폼</title>
</head>
<body>
	<h3>이름과 전화번호를 입력하세요</h3>
	<hr>
	<form method = "post" action = "IfMultiTestPro.jsp">
	이름 : <input type ="text" name = "name"> <br>
	전화번호 : 
	<select name = "local">
		<option value="서울">서울</option>
		<option value="부산">부산</option>
		<option value="경기">경기</option>
	</select>
	<input type = "text" name = "tel1" width="150">-
	<input type = "text" name = "tel2" width="50"><br>
	<input type="submit" value ="입력완료">
	</form>
</body>
</html>