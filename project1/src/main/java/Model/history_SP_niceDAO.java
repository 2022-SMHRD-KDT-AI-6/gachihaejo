package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class history_SP_niceDAO {

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

	public ArrayList<history_SP_niceDTO> SP_select(String user_id) {
		ArrayList<history_SP_niceDTO> list = new ArrayList<>();
		db_Corn();
		try {

			String sql = "select * from tbl_request_party where user_id = ? and party_end_date > sysdate";
			
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, user_id);

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

	public String title_select(int party_seq) {

		String result = "";
		db_Corn();
		try {

			String sql = "select * from tbl_party where party_seq = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, party_seq);

			rs = psmt.executeQuery();

			while (rs.next()) {

				result = rs.getString("party_title");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return result;

	}

	public int rq_delete(int party_seq, String user_id) { // 신청한 파티 삭제

		int row = 0;

		db_Corn();

		try {

			String sql = "delete from tbl_request_party where party_seq = ? and user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, party_seq);
			psmt.setString(2, user_id);

			row = psmt.executeUpdate();

			if (row > 0) {

				System.out.println("파티삭제 완료");

			} else {

				System.out.println("파티삭제 실패");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;

	}

	public int update_accept(int party_seq, String user_id) { // 내가 만든 파티 요청 수락

		int row = 0;

		db_Corn();

		try {

			String sql = "update tbl_request_party set attendance_YN = 'Y' where party_seq = ? and user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, party_seq);
			psmt.setString(2, user_id);

			row = psmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;

	}
	
	public int update_refuse(int party_seq, String user_id) { // 내가 만든 파티 요청 거절

		int row = 0;

		db_Corn();

		try {

			String sql = "update tbl_request_party set attendance_YN = 'N' where party_seq = ? and user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, party_seq);
			psmt.setString(2, user_id);

			row = psmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;

	}
	
	public ArrayList<history_CP_niceDTO> history_select(String user_id) { // 내 이전 파티기록 조회
		
		// 내가 개설한 파티, 내가 참석한 파티
		
		ArrayList<history_CP_niceDTO>  list = new ArrayList<>();
		db_Corn();
		try {
			
			String sql = "select * from tbl_party where user_id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, user_id);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				history_CP_niceDTO dto = new history_CP_niceDTO();
				
				dto.setParty_seq(rs.getInt("party_seq"));
				dto.setParty_title(rs.getString("party_title"));
				dto.setParty_type(rs.getString("party_type"));
				dto.setParty_content(rs.getString("party_content"));
				dto.setParty_addr(rs.getString("party_addr"));
				dto.setParty_max_cnt(rs.getInt("party_max_cnt"));
				dto.setParty_end_date(rs.getString("party_end_date"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setParty_latitude(rs.getDouble("party_latitude"));
				dto.setParty_longitude(rs.getDouble("party_longitude"));
				list.add(dto);
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
			db_close();
		}
		return list;
		
	}
	
	public ArrayList<SearchPartyDTO> history(String user_id) { // 내가 만든 파티, 내가 참석했던 파티들의 마감날짜 지난 파티 정보
		ArrayList<SearchPartyDTO> list = new ArrayList<>();
		db_Corn();
		try {

			String sql = "select * from tbl_party where (user_id = ? or party_seq in (select party_seq from tbl_request_party where user_id = ?)) and sysdate > party_end_date";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, user_id);
			psmt.setString(2, user_id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				SearchPartyDTO dto = new SearchPartyDTO();

				dto.setParty_seq(rs.getInt("party_seq"));
				dto.setParty_title(rs.getString("party_title"));
				dto.setParty_type(rs.getString("party_type"));
				dto.setParty_content(rs.getString("party_content"));
				dto.setParty_addr(rs.getString("party_addr"));
				dto.setParty_max_cnt(rs.getInt("party_max_cnt"));
				dto.setParty_end_date(rs.getString("party_end_date"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setParty_latitude(rs.getDouble("party_latitude"));
				dto.setParty_longitude(rs.getDouble("party_longitude"));
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
