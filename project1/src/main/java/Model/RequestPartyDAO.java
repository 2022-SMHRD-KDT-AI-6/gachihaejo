package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RequestPartyDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int row = 0;

	public void db_conn() { // DB 접속 메서드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "cgi_8_0704_1";
			String password = "smhrd1";

			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void db_close() { // DB 종료 메서드
		try {
			if (psmt != null) {
				psmt.close();
			}

			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int party_request(RequestPartyDTO dto) {
		
		try {
			
			db_conn();

			String sql = "insert into tbl_request_party(party_seq, user_id, reg_date, attendance_yn) values (?, ?, sysdate ,'L')";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getParty_seq()); // 신청하는 파티 번호
			psmt.setString(2, dto.getUser_id()); // 신청자 id

			
			row = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;
	}
	
	
	public boolean select(RequestPartyDTO dto) {
		boolean result = true;
		db_conn();
		
		try {
			
			String sql = "select * from tbl_request_party where party_seq = ? and user_id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getParty_seq());
			psmt.setString(2, dto.getUser_id());
			
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				result = false;
				
				
			}
					
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
			db_close();
		}
		return result;
		
	}
}
