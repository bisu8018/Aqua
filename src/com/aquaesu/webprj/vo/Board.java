package com.aquaesu.webprj.vo;

public class Board {
	private String bpic;
	private String bcontent;
	private String bemail;
	private int x;
	private int y;
	
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public String getBEmail() {
		return bemail;
	}
	public void setBEmail(String bEmail) {
		this.bemail = bEmail;
	}
	public String getBpic() {
		return bpic;
	}
	public void setBpic(String bpic) {
		this.bpic = bpic;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

}
