package Model;

public class MemberDTO {

	// 프로젝트	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String user_birthdate;
	private String user_gender;
	private String user_phone;
	private String user_email;
	private String user_profile;
	private String user_photo;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String user_id, String user_pw, String user_name, String user_nick, String user_birthdate,
			String user_gender, String user_phone, String user_email, String user_profile, String user_photo) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_profile = user_profile;
		this.user_photo = user_photo;
	}
	
	
	
	public MemberDTO(String user_id, String user_pw, String user_nick, String user_phone, String user_email,
			String user_profile, String user_photo) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nick = user_nick;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_profile = user_profile;
		this.user_photo = user_photo;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_birthdate() {
		return user_birthdate;
	}
	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	
	
	
	
}
