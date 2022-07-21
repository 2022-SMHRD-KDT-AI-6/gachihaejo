package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class history_Detail_DAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	
	public void db_Corn() {
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

	public void db_close() {
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
	
	public ArrayList<history_SP_niceDTO> DT_select(int party_seq) {
		ArrayList<history_SP_niceDTO> list = new ArrayList<>();
		db_Corn();
		try {
			
			String sql = "select * from tbl_request_party where party_seq = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, party_seq);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				history_SP_niceDTO dto = new history_SP_niceDTO();
				
				dto.setRequest_seq(rs.getInt("request_seq"));
				dto.setParty_seq(rs.getInt("party_seq"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setAttendance_yn(rs.getString("attendance_yn"));
				
				list.add(dto);
			}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
			db_close();
		}
		return list;
		
	}
	
}
	

