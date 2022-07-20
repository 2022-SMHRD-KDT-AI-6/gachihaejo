package Model;

public class CreatePartyDTO {

	private String title; // 제목
	private String type; // 취향카테고리
	private String content; // 내용
	private String addr; // 주소
	private int max_cnt; // 최대참여인원
	private String end_Date; // 모집마감날짜
	private String user_id; // 유저ID(FK)
	private double party_latitude; // 위도
	private double party_longitude; // 경도
	

	public CreatePartyDTO() {

	}

	public CreatePartyDTO(String title, String type, String content, String addr,
			int max_cnt, String end_Date, String user_id, double party_latitude, double party_longitude) {

		this.title = title;
		this.type = type;
		this.content = content;
		this.addr = addr;
		this.max_cnt = max_cnt;
		this.end_Date = end_Date;
		this.user_id = user_id;
		this.party_latitude = party_latitude;
		this.party_longitude = party_longitude;
		
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getMax_cnt() {
		return max_cnt;
	}

	public void setMax_cnt(int max_cnt) {
		this.max_cnt = max_cnt;
	}

	public String getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(String end_Date) {
		this.end_Date = end_Date;
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
