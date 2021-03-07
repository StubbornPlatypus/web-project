package model;

public class User {
	private final String DEF_ROLE="regular";
	public final static String MGR_ROLE="manager";
	public final static String REG_ROLE="regular";
	
	String nickName, password, role;
	int id;	//model id of the user, retrieved from DB
	
	public String getRole() {
		return this.role;
	}
	public void setRole(String role) {
		if (role == null || role.equals(""))
			this.role = DEF_ROLE;
		else
			this.role = role;
	}
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
