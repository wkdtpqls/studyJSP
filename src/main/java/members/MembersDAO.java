package members;

import  java.sql.*;
import  javax.sql.*;
import javax.naming.*;

public class MembersDAO {
	private static MembersDAO instance = new MembersDAO();
	
	public static MembersDAO getInstance() {
		return instance;
	}
	private MembersDAO() { }
	
	private Connection getConnection() {
		try {
			InitialContext ic = new InitialContext(); //JNDI 서버 객체 생성
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");
			Connection conn = ds.getConnection(); //connection  객체를 할당 받음
			return conn;
		} catch(Exception e) {
			System.out.println("데이터베이스 연결에 문제가 발생했습니다.");
			return null;
		}
	}
	
	public int userCheck(String id, String passwd) {
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체
		
		int result = -1;
		
		try {
			conn = getConnection();
			
			String sql = "select id, passwd from members where id =?";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				String rid = rs.getString("id"); //테이블의 컬럼명으로
				String rpasswd = rs.getString("passwd");
				if(id.equals(rid) && passwd.equals(rpasswd)){
					result = 1; // 인증 성공
				}else{
					result = 0; // 패스워드 틀림
				}
			}else{
				result = -1; // 해당 아이디 없음
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("아이디, 패스워드 확인에 문제가 발생했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return result;
	}
}
