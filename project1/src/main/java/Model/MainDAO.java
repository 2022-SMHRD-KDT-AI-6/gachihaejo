package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MainDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
		
	private void getConn() {
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
	
	private void close() {
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
	
	
	// 만들어져있는 파티 조회
	public ArrayList<MainDTO> select(String city) {
			ArrayList<MainDTO> list = new ArrayList<>();
			
			getConn();
			
			try {
				
				String sql = "select * from tbl_party where party_addr like ?";
				
				psmt = conn.prepareStatement(sql);
			
				psmt.setString(1, city+"%");
				
				rs = psmt.executeQuery();
				
				
				
				while (rs.next()) {
					MainDTO dto = new MainDTO();
					
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
				close();
			}
			return list;
			
		}
	
		public ArrayList<MainDTO> selectAll() {
			ArrayList<MainDTO> list = new ArrayList<>();
			
			getConn();
			
			try {
				
				String sql = "select * from tbl_party";
				
				psmt = conn.prepareStatement(sql);
			
				
				rs = psmt.executeQuery();
				
				
				
				while (rs.next()) {
					MainDTO dto = new MainDTO();
					
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
				close();
			}
			return list;
			
		}
	
	public int cnt_people(int party_seq) {
		
		getConn();
		int cnt = 0;
		try {
			
				
			String sql = "select * from tbl_request_party where party_seq = ? and attendance_yn = 'Y' ";
			
			
			psmt = conn.prepareStatement(sql);
					
			psmt.setInt(1, party_seq);
					
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				cnt++;
			}
				
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
}
