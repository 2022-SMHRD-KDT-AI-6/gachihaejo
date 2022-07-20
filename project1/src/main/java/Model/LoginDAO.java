package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

// 이미지 불러오기용 
public ArrayList<LoginDTO> show_all() {
	ArrayList<LoginDTO> list = new ArrayList<>();
	
	db_conn();
	
	try {
		
		String sql = "select * from tbl_user";
		
		psmt = conn.prepareStatement(sql);
	
		
		rs = psmt.executeQuery();
		
	
		
		while (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String nick = rs.getString(4);
			String birthdate = rs.getString(5);
			String gender = rs.getString(6);
			String phone = rs.getString(7);
			String email = rs.getString(8);
			String profile = rs.getString(9);
			String photo = rs.getString(10);
			String type = rs.getString(11);
			String joindate = rs.getString(12);
			
			LoginDTO ldto = new LoginDTO(id, pw, name, nick, birthdate, gender, email, phone, profile, photo, type, joindate);
			
			list.add(ldto);
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
		db_close();
	}
	return list;
	
}


	
}
