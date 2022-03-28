package com.example.domain;

public class UserVO {
	private String uid;
	private String uname;
	private String upass;
	private int point;
	private int sendcnt;
	private int rececnt;
	
	
	
	
	public int getSendcnt() {
		return sendcnt;
	}
	public void setSendcnt(int sendcnt) {
		this.sendcnt = sendcnt;
	}
	public int getRececnt() {
		return rececnt;
	}
	public void setRececnt(int rececnt) {
		this.rececnt = rececnt;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", uname=" + uname + ", upass=" + upass + ", point=" + point + "]";
	}
	
	
}
