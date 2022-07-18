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

	public int update(MemberDTO udto) {

		db_conn();

		try {

			String sql = "update tbl_user set user_pw=?, user_nick=?, user_phone=?, user_email=?, user_profile=?, user_photo=? where user_id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, udto.getUser_pw());
			psmt.setString(2, udto.getUser_nick());
			psmt.setString(3, udto.getUser_phone());
			psmt.setString(4, udto.getUser_email());
			psmt.setString(5, udto.getUser_profile());
			psmt.setString(6, udto.getUser_photo());
			psmt.setString(7, udto.getUser_id());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return cnt;
	}

	public MemberDTO select(String user_id) {
		MemberDTO dto = new MemberDTO();
		db_conn();
		
		try {
			
			String sql = "select * from tbl_user where user_id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "안뇽");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				user_id = rs.getString("user_id");
				String user_name = rs.getString("user_name");
				String user_pw = rs.getString("user_pw");
				String user_nick = rs.getString("user_nick");
				String user_birthdate = rs.getString("user_birthdate");
				String user_gender = rs.getString("user_gender");
				String user_phone = rs.getString("user_phone");
				String user_email = rs.getString("user_email");
				String user_profile = rs.getString("user_profile");
				String user_photo = rs.getString("user_photo");
				
				dto = new MemberDTO(user_id, user_pw, user_name, user_nick, user_birthdate, user_gender, user_phone, user_email, user_profile, user_photo);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return dto;
	}
	
	public int checkNick(String user_nick) {
		
		db_conn();
		
		String sql = "select * from tbl_user where user_nick = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, user_nick);
			
			rs = psmt.executeQuery();
			
			
	
			if(rs.next() || user_nick.equals("")) {
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
