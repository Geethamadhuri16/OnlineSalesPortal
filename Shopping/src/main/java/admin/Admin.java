package admin;

public class Admin {
private String userId;
private String adminName;
private String email;
private String AdminPassword;
private String AdminId;

public String getAdminId() {
	return AdminId;
}
public void setAdminId(String adminId) {
	AdminId = adminId;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getAdminName() {
	return adminName;
}
public void setAdminName(String adminName) {
	this.adminName = adminName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAdminPassword() {
	return AdminPassword;
}
public void setAdminPassword(String adminPassword) {
	AdminPassword = adminPassword;
}

}
