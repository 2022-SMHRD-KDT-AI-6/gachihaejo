package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchPartyDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;

	private void getCorn() {
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
	public ArrayList<SearchPartyDTO> select(String Do, String GunGu, String hobby) {
		ArrayList<SearchPartyDTO> list = new ArrayList<>();
		getCorn();
		
		try {
			
			String sql = "select * from tbl_party where party_addr like ? and party_addr like ? and (party_title like ? or party_content like ?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+Do+"%");
			psmt.setString(2, "%" + GunGu + "%");
			psmt.setString(3, "%" + hobby + "%");
			psmt.setString(4, "%" + hobby + "%");
			
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
			close();
		}
		return list;
		
	}

	public int cnt_people(int party_seq) {
			
		getCorn();
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
	
	public String photo(String user_id) {
		String photo = "";
		
		getCorn();
		
		int cnt = 0;
		try {
			
				
			String sql = "select user_photo from tbl_user where user_id = ?";
			
			
			psmt = conn.prepareStatement(sql);
					
			psmt.setString(1, user_id);
					
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				photo = rs.getString("user_photo");
			}
				
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return photo;
	}
		
		
}

