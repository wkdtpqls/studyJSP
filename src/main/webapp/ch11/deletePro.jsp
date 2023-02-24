<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	
	Connection conn  = null; //데이터베이스 연결 객체
	PreparedStatement pstmt = null; // query 실행할 객체
	ResultSet rs = null; //select문 실행 결과를 저장하는 객체
	
	try { //db에 연동할 필요할 정보 적기
		/*
		String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
		String dbID = "jspid";
		String dbPW = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver"); // 1.jdbc 드라이버 로딩하기
		conn = DriverManager.getConnection(jdbcURL, dbID, dbPW); // 2.db서버 접속하기
		*/
		
		//DataSource를 이용한 커넥션 풀
		InitialContext ic = new InitialContext(); //JNDI 서버 객체 생성
		ic.lookup("");
		DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");
		conn = ds.getConnection(); //connection  객체를 할당 받음
		
		String sql = "select id, passwd from members where id =?";
		pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // 4. sql query 실행됨
		
		if(rs.next()){ //id가 맞는것이 있나 없나 판별함
			String rid = rs.getString("id"); //테이블의 컬럼명으로
			String rpasswd = rs.getString("passwd");
			if(id.equals(rid) && passwd.equals(rpasswd)){
				// name 삭제하기
				sql = "delete from members where id = ?";
				pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
				pstmt.setString(1, id);
				pstmt.executeUpdate(); // 4. sql query 실행됨
				
				response.sendRedirect("list.jsp");
			}else{
				out.println("패스워드가 틀렸습니다.");
			}
		}else{
			out.println("아이디가 틀렸습니다.");
		}
			
	} catch (Exception e){ //오류날 때 
		e.printStackTrace();
	} finally {
		// 5. 자원 해제
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close(); //연결 해제
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>