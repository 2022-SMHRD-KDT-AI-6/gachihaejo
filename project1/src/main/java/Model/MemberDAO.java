package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	// 프로젝트

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	int nickCheck = 0;

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

	// DB종료 메소드
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

	public int update(LoginDTO udto) {

		db_conn();

		try {

			String sql = "update tbl_user set user_pw=?, user_nick=?, user_phone=?, user_email=?, user_profile=?, user_photo=? where user_id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, udto.getPw());
			psmt.setString(2, udto.getNick());
			psmt.setString(3, udto.getPhoto());
			psmt.setString(4, udto.getEmail());
			psmt.setString(5, udto.getProfile());
			psmt.setString(6, udto.getPhoto());
			psmt.setString(7, udto.getId());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	public LoginDTO select(String id) {
		LoginDTO dto = new LoginDTO();
		db_conn();
		
		try {
			
			String sql = "select * from tbl_user where user_id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "안뇽");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				id = rs.getString("id");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String nick = rs.getString("nick");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String profile = rs.getString("profile");
				String photo = rs.getString("photo");
				
				dto = new LoginDTO(id, pw, name, nick, birth, gender, phone, email, profile, photo);
		
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return dto;
	}
	
	public int checkNick(String nick) {
		
		db_conn();
		
		String sql = "select * from tbl_user where user_nick = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, nick);
			
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
	
}
