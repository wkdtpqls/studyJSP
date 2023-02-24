<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h3>members 테이블의 회원 목록</h3>
	<hr>
	<br>
	<table border="1">
		<tr>
			<th width="250">아이디</th>
			<th width="100">패스워드</th>
			<th width="100">이름</th>
			<th width="160">가입일자</th>
		</tr>
<%
	Connection conn  = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //select문 실행 결과를 저장하는 객체
	
	try {
		//db에 연동할 필요할 정보 적기
		/*
		String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
		String dbID = "jspid";
		String dbPW = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver"); // 1.jdbc 드라이버 로딩하기
		conn = DriverManager.getConnection(jdbcURL, dbID, dbPW); // 2.db서버 접속하기
		*/
		
		//
		InitialContext ic = new InitialContext(); //JNDI 서버 객체 생성
		ic.lookup("");
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");
		conn = ds.getConnection(); //connection  객체를 할당 받음

		
		String sql = "select * from members";
		pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
		rs = pstmt.executeQuery(); // 4. sql query 실행됨
		
		while(rs.next()){
			String id = rs.getString("id"); //table의 컬럼명으로 정보 가져오기
			String pw = rs.getString("passwd");
			String name = rs.getString("name");
			String register = rs.getString("reg_date");	
%>
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=register %></td>
		</tr>
<%		
		}
	} catch(Exception e){ //오류날 때 
		e.printStackTrace();
	} finally {
		// 5. 자원 해제
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close(); //연결 해제
	}
%>		
	</table>
	<table>
		<tr>
			<td width="630" align="right">
				<a href="insertForm.jsp">[추가]</a>
				<a href="updateForm.jsp">[수정]</a>
				<a href="deleteForm.jsp">[삭제]</a>
			</td>
		</tr>
	</table>
</body>
</html>