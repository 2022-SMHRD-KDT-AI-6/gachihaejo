package Model;

public class LoginDTO {

	private String id;
	private String pw;
	private String name;
	private String nick;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String profile;
	private String photo;
	private String type;
	private String joindate;

	public LoginDTO() {

	}

	

	public LoginDTO(String id, String pw, String name, String nick, String birth, String gender, String email,
			String phone, String profile, String photo, String type, String joindate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.profile = profile;
		this.photo = photo;
		this.type = type;
		this.joindate = joindate;
	}



	public LoginDTO(String id, String pw, String name, String nick, String birth, String gender, String email,
			String phone, String profile, String photo) {
		
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.profile = profile;
		this.photo = photo;
//		this.type = type;
//		this.joindate = joindate;
	}

	public LoginDTO(String id, String pw, String nick, String phone, String email,
			String profile, String photo,String name) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.phone = phone;
		this.email = email;
		this.profile = profile;
		this.photo = photo;
		this.name = name;
	}


	public LoginDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}





	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
}
