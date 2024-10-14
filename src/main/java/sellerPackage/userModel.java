package sellerPackage;

public class userModel {
	private int userId;
	private String userName;
	private String gmail;
	private String password;
	public userModel(int userId, String userName, String gmail, String password) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.gmail = gmail;
		this.password = password;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
