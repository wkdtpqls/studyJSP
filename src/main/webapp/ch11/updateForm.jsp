<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<h3>members 테이블의 회원 정보 수정</h3>
	<hr>
	<br>
	<form method = "post" action="updatePro.jsp">
		아이디 : <input type="text" name = "id" maxlength="50"><br>
		패스워드 : <input type="password" name = "password" maxlength="20"><br>
		변경할 이름 : <input type="text" name = "name" maxlength="30"><br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>