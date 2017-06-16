package com.nss.manager.loginvo;

public class LoginVO {

	private String managerID;
	private String managerPW;

	private String loginManagerID;
	private String loginManagerPW;

	public String getLoginManagerID() {
		return loginManagerID;
	}

	public void setLoginManagerID(String loginManagerID) {
		this.loginManagerID = loginManagerID;
	}

	public String getLoginManagerPW() {
		return loginManagerPW;
	}

	public void setLoginManagerPW(String loginManagerPW) {
		this.loginManagerPW = loginManagerPW;
	}

	public String getManagerID() {
		return managerID;
	}

	public void setManagerID(String managerID) {
		this.managerID = managerID;
	}

	public String getManagerPW() {
		return managerPW;
	}

	public void setManagerPW(String managerPW) {
		this.managerPW = managerPW;
	}

}
