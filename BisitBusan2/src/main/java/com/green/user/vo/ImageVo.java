package com.green.user.vo;

public class ImageVo {
	private String s_name;
	private String s_date;
	private String s_intro;
	private String s_address;
	private String s_fee;
	private String s_tel;
	private String s_hp;
	private String i_address;
	private int    s_good;
	
	
	
	public ImageVo() {}
	public ImageVo(String s_name, String s_date, String s_intro, String s_address, String s_fee, String s_tel,
			String s_hp, String i_address, int s_good) {
		
		this.s_name = s_name;
		this.s_date = s_date;
		this.s_intro = s_intro;
		this.s_address = s_address;
		this.s_fee = s_fee;
		this.s_tel = s_tel;
		this.s_hp = s_hp;
		this.i_address = i_address;
		this.s_good = s_good;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getS_intro() {
		return s_intro;
	}
	public void setS_intro(String s_intro) {
		this.s_intro = s_intro;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_fee() {
		return s_fee;
	}
	public void setS_fee(String s_fee) {
		this.s_fee = s_fee;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_hp() {
		return s_hp;
	}
	public void setS_hp(String s_hp) {
		this.s_hp = s_hp;
	}
	public String getI_address() {
		return i_address;
	}
	public void setI_address(String i_address) {
		this.i_address = i_address;
	}
	public int getS_good() {
		return s_good;
	}
	public void setS_good(int s_good) {
		this.s_good = s_good;
	}
	@Override
	public String toString() {
		return "ImageVo [s_name=" + s_name + ", s_date=" + s_date + ", s_intro=" + s_intro + ", s_address=" + s_address
				+ ", s_fee=" + s_fee + ", s_tel=" + s_tel + ", s_hp=" + s_hp + ", i_address=" + i_address + ", s_good="
				+ s_good + "]";
	}
	
	
	
	
	
	
	
	
}
