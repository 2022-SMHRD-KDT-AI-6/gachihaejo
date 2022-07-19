package Model;

public class MainDTO {

	private int party_seq;
	private String party_title;
	private String party_type;
	private String party_content;
	private String party_addr;
	private int party_max_cnt;
	private String party_end_date;
	private String reg_date;
	private String user_id;
	private double party_latitude;
	private double party_longitude;
	public MainDTO() {
		
	}
	public MainDTO(int party_seq, String party_title, String party_type, String party_content, String party_addr,
			int party_max_cnt, String party_end_date, String reg_date, String user_id, double party_latitude,
			double party_longitude) {
		
		this.party_seq = party_seq;
		this.party_title = party_title;
		this.party_type = party_type;
		this.party_content = party_content;
		this.party_addr = party_addr;
		this.party_max_cnt = party_max_cnt;
		this.party_end_date = party_end_date;
		this.reg_date = reg_date;
		this.user_id = user_id;
		this.party_latitude = party_latitude;
		this.party_longitude = party_longitude;
	}
	
	public int getParty_seq() {
		return party_seq;
	}
	public void setParty_seq(int party_seq) {
		this.party_seq = party_seq;
	}
	public String getParty_title() {
		return party_title;
	}
	public void setParty_title(String party_title) {
		this.party_title = party_title;
	}
	public String getParty_type() {
		return party_type;
	}
	public void setParty_type(String party_type) {
		this.party_type = party_type;
	}
	public String getParty_content() {
		return party_content;
	}
	public void setParty_content(String party_content) {
		this.party_content = party_content;
	}
	public String getParty_addr() {
		return party_addr;
	}
	public void setParty_addr(String party_addr) {
		this.party_addr = party_addr;
	}
	public int getParty_max_cnt() {
		return party_max_cnt;
	}
	public void setParty_max_cnt(int party_max_cnt) {
		this.party_max_cnt = party_max_cnt;
	}
	public String getParty_end_date() {
		return party_end_date;
	}
	public void setParty_end_date(String party_end_date) {
		this.party_end_date = party_end_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public double getParty_latitude() {
		return party_latitude;
	}
	public void setParty_latitude(double party_latitude) {
		this.party_latitude = party_latitude;
	}
	public double getParty_longitude() {
		return party_longitude;
	}
	public void setParty_longitude(double party_longitude) {
		this.party_longitude = party_longitude;
	}
	
	
	
}
