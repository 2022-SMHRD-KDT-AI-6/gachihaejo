package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int row = 0;

	// DB연결 메소드
	public void db_conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_user = "cgi_8_0704_1";
			String db_pw = "smhrd1";

			conn = DriverManager.getConnection(url, db_user, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// DB 종료
	public void db_close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원가입 메소드
	public int join(LoginDTO dto) {
		db_conn();
		try {
			String sql = "insert into tbl_user values(?,?,?,?,?,?,?,?,?,?,'D',sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getGender());
			psmt.setString(7, dto.getPhone());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getProfile());
			psmt.setString(10, dto.getPhoto());

			// SQL문 실행
			row = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;
	}

	// 로그인 메소드
	public LoginDTO login(LoginDTO dto) {

		LoginDTO dto2 = new LoginDTO();
		db_conn();

		try {

			String sql = "select * from tbl_user where user_id = ? and user_pw = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());

			rs = psmt.executeQuery();

			// 이렇게 할 경우 로그인서비스에 String의 여러형태를 가지고 올 수 있는가
			// DB선언명과 동일하게 해야되는지
//				while(rs.next()) {
//					String id = rs.getString("id");
//					String pw = rs.getString("pw");
//					String name = rs.getString("name");
//					String nick = rs.getString("nick");
//					String birth = rs.getString("birth");
//					String gender = rs.getString("gender");
//					String phone = rs.getString("phone");
//					String email = rs.getString("email");
//					String profile = rs.getString("profile");
//					String photo = rs.getString("photo");
//					
//				}

			while (rs.next()) {

				dto2.setId(rs.getString("user_id"));
				dto2.setPw(rs.getString("user_pw"));
				dto2.setName(rs.getString("user_name"));
				dto2.setNick(rs.getString("user_nick"));
				dto2.setBirth(rs.getString("user_birthdate"));
				dto2.setGender(rs.getString("user_gender"));
				dto2.setPhone(rs.getString("user_phone"));
				dto2.setEmail(rs.getString("user_email"));
				dto2.setProfile(rs.getString("user_profile"));
				dto2.setPhoto(rs.getString("user_photo"));
				dto2.setType(rs.getString("user_type"));
				dto2.setJoindate(rs.getString("user_joindate"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return dto2;
	}

	public int checkNick(String nick) {
		int nickCheck = 0;
		db_conn();
		
		String sql = "select * from tbl_user where user_nick = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,nick);
			
			rs = psmt.executeQuery();
			
			
	
			if(rs.next() || nick.equals("")) {
				nickCheck = 0; // 이미 존재하는 경우, 생성 불가능
			}else {
				nickCheck = 1; // 존재하지 않는 경우, 생성 가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}return nickCheck;
	}

public int checkId(String id) {
		int idCheck = 0;
		db_conn();
		
		String sql = "select * from tbl_user where user_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,id);
			
			rs = psmt.executeQuery();
			
			
	
			if(rs.next() || id.equals("")) {
				idCheck = 0; // 이미 존재하는 경우, 생성 불가능
			}else {
				idCheck = 1; // 존재하지 않는 경우, 생성 가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}return idCheck;
	}
	
}
