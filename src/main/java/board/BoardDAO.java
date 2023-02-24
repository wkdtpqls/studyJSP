package board;

import  java.sql.*;
import  javax.sql.*;
import  javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() { }
	
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
	
	public void insertBoard(BoardVO article) { //게시글 하나를 insert 한다.
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		
		try { 
			conn = getConnection();
			// num,조회수는 자동이므로 컬럼명 지정해줌
			//insert into board(writer, email, subject, passwd, reg_date, content) values ('홍길동', 'aaa@aaa.com', '제목1', '123','now()','내용1');
			String sql = "insert into board(writer, email, subject, passwd, reg_date, content)";
			sql += "values(?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setString(5, article.getContent());
			pstmt.executeUpdate(); // 4. sql query 실행됨
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("테이블 삽입에 문제가 발생했습니다.");
		} finally {
			// 5. 자원 해제
			if(pstmt != null) try{pstmt.close();} catch(Exception se) {}
			if(conn != null) try{conn.close();} catch(Exception se) {} //연결 해제
		}
	}
	
	public int getArticleCount() {
			Connection conn  = null; //데이터베이스 연결 객체
			PreparedStatement pstmt = null; // query 실행할 객체
			ResultSet rs = null; //select문 실행 결과를 저장하는 객체
			
			int result = 0;
			
			try {
				conn = getConnection();
				
				String sql = "select count(*) from board;";
				pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
				rs = pstmt.executeQuery(); // 4. sql query 실행됨
				
				if(rs.next()){ //id가 맞는것이 있나 없나 판별함
					result = rs.getInt(1);
				}
				
			} catch (Exception e){ //오류날 때 
				e.printStackTrace();
				System.out.println("board 테이블의 자료 수 검색을 실패했습니다.");
			} finally {
				// 5. 자원 해제
				if(rs != null) try{rs.close();} catch(SQLException se) {}
				if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
				if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
			}
			
			return result;
		}	
	
	public List<BoardVO> getArticles(int start, int end){
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체
		List<BoardVO> alist = null;
		
		int result = 0;
		
		try {
			conn = getConnection();
			
			String sql = "select * from board order by num desc limit ?, ?;";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				alist = new ArrayList<BoardVO>(end);
				do {
					BoardVO article = new BoardVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					
					alist.add(article);
					
					} while(rs.next());
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("board 테이블의 자료 검색을 실패했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return alist;
	}
	// 상세 글보기
	public BoardVO getArticle(int num){ //글번혼
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체
		BoardVO article = null;
		
		int result = 0;
		
		try {
			conn = getConnection();
			//조회수
			String sql = "update board set readcount=readcount+1 where num=?"; 
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); // 4. sql query 실행됨
			
			sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("board 테이블 상세 보기 레코드 검색을 실패했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return article;
	}
	
	//수정을 위한 상세글
	public BoardVO getArticleUpdate(int num){ //글번혼
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체
		BoardVO article = null;
		
		int result = 0;
		
		try {
			conn = getConnection();
			
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("board 테이블 상세 보기 레코드 검색을 실패했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return article;
	}
	
	public int updateBoard(BoardVO article) {
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체		
		int result = 0;
		
		try {
			conn = getConnection();
			
			String sql = "select passwd from board where num =?";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			//System.out.println("----select 실행" + article.getNum());
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				String rpasswd = rs.getString("passwd");
				//System.out.println("----passwd:"+ rpasswd);
				if(rpasswd.equals(article.getPasswd())){ //사용자가 입력한 비번과 데이터베이스에 저장된 비번 확인
					result = 1; // 인증 성공
					sql = "update board set writer=?, email=?, content=?, subject=? where num=?"; 
					pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
					pstmt.setString(1,article.getWriter());
					pstmt.setString(2,article.getEmail());
					pstmt.setString(3,article.getContent());
					pstmt.setString(4,article.getSubject());
					pstmt.setInt(5, article.getNum());					
					pstmt.executeUpdate(); // 4. sql query 실행됨
				}else{
					result = 0; // 패스워드 틀림
				}
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("board 테이블의 글 수정에 문제가 발생했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return result;
	}	
	
	public int deleteBoard(int num, String passwd) {
		Connection conn  = null; //데이터베이스 연결 객체
		PreparedStatement pstmt = null; // query 실행할 객체
		ResultSet rs = null; //select문 실행 결과를 저장하는 객체		
		int result = 0;
		
		try {
			conn = getConnection();
			
			String sql = "select passwd from board where num =?";
			pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // 4. sql query 실행됨
			
			//System.out.println("----select 실행" + article.getNum());
			
			if(rs.next()){ //id가 맞는것이 있나 없나 판별함
				String rpasswd = rs.getString("passwd");
				//System.out.println("----passwd:"+ rpasswd);
				if(rpasswd.equals(passwd)){ //사용자가 입력한 비번과 데이터베이스에 저장된 비번 확인
					result = 1; // 인증 성공
					
					sql = "delete from board where num=?"; 
					pstmt = conn.prepareStatement(sql); // 3. sql을 실행할기 위한 객체 생성하기
					pstmt.setInt(1, num);					
					pstmt.executeUpdate(); // 4. sql query 실행됨
				}else{
					result = 0; // 패스워드 틀림
				}
			}
			
		} catch (Exception e){ //오류날 때 
			e.printStackTrace();
			System.out.println("board 테이블의 글 삭제에 문제가 발생했습니다.");
		} finally {
			// 5. 자원 해제
			if(rs != null) try{rs.close();} catch(SQLException se) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException se) {}
			if(conn != null) try{conn.close();} catch(SQLException se) {} //연결해제
		}
		
		return result;
	}
}
	

