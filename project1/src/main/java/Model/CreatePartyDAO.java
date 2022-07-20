package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CreatePartyDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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

	public int insert(CreatePartyDTO dto) {
		int row = 0;
		try {
			db_conn();

			String sql = "insert into tbl_party values(tbl_party_SEQ.nextval, ?, ?, ?, ?, ?, to_date(?, 'yyyy-mm-dd HH24:MI:SS'), sysdate, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getTitle()); //제목(title)
			psmt.setString(2, dto.getType()); //취향타입(type)
			psmt.setString(3, dto.getContent()); //내용(content)
			psmt.setString(4, dto.getAddr()); //주소(addr)
			psmt.setInt(5, dto.getMax_cnt()); //최대참석인원제한(max_cnt)
			psmt.setString(6, dto.getEnd_Date()); //모집마감날짜(end_date)
			psmt.setString(7, dto.getUser_id()); //유저아이디(user_id) 
			psmt.setDouble(8, dto.getParty_latitude()); //위도(latitude)
			psmt.setDouble(9, dto.getParty_longitude()); //경도(longitude)

			row = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return row;
	}
	

}
