package Model;

public class history_SP_niceDTO {

	private int request_seq;
	private int party_seq;
	private String user_id;
	private String reg_date;
	private String attendance_yn;
	
	public history_SP_niceDTO() {
		
	}
	
	public history_SP_niceDTO(int request_seq, int party_seq, String user_id, String reg_date, String attendance_yn) {
		this.request_seq = request_seq;
		this.party_seq = party_seq;
		this.user_id = user_id;
		this.reg_date = reg_date;
		this.attendance_yn = attendance_yn;
	}
	
	public int getRequest_seq() {
		return request_seq;
	}
	public void setRequest_seq(int request_seq) {
		this.request_seq = request_seq;
	}
	public int getParty_seq() {
		return party_seq;
	}
	public void setParty_seq(int party_seq) {
		this.party_seq = party_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getAttendance_yn() {
		return attendance_yn;
	}
	public void setAttendance_yn(String attendance_yn) {
		this.attendance_yn = attendance_yn;
	}
	
	
}
