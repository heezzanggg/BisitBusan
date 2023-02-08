package com.green.allfs.vo;

public class AllfsVo {
	private String a_name;
	private String a_date;
	private String a_address;
	private String a_fee;
	private String a_tel;
	private String a_hp;
	private float a_latitude;
	private float a_longitude;
	private String a_intro;
	private int a_code;
	
	public AllfsVo() {}
	public AllfsVo(String a_name, String a_date, String a_address, String a_fee, String a_tel, String a_hp,
			float a_latitude, float a_longitude, String a_intro, int a_code) {
		
		this.a_name = a_name;
		this.a_date = a_date;
		this.a_address = a_address;
		this.a_fee = a_fee;
		this.a_tel = a_tel;
		this.a_hp = a_hp;
		this.a_latitude = a_latitude;
		this.a_longitude = a_longitude;
		this.a_intro = a_intro;
		this.a_code = a_code;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getA_address() {
		return a_address;
	}
	public void setA_address(String a_address) {
		this.a_address = a_address;
	}
	public String getA_fee() {
		return a_fee;
	}
	public void setA_fee(String a_fee) {
		this.a_fee = a_fee;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	public String getA_hp() {
		return a_hp;
	}
	public void setA_hp(String a_hp) {
		this.a_hp = a_hp;
	}
	public float getA_latitude() {
		return a_latitude;
	}
	public void setA_latitude(float a_latitude) {
		this.a_latitude = a_latitude;
	}
	public float getA_longitude() {
		return a_longitude;
	}
	public void setA_longitude(float a_longitude) {
		this.a_longitude = a_longitude;
	}
	public String getA_intro() {
		return a_intro;
	}
	public void setA_intro(String a_intro) {
		this.a_intro = a_intro;
	}
	public int getA_code() {
		return a_code;
	}
	public void setA_code(int a_code) {
		this.a_code = a_code;
	}
	@Override
	public String toString() {
		return "AllfsVo [a_name=" + a_name + ", a_date=" + a_date + ", a_address=" + a_address + ", a_fee=" + a_fee
				+ ", a_tel=" + a_tel + ", a_hp=" + a_hp + ", a_latitude=" + a_latitude + ", a_longitude=" + a_longitude
				+ ", a_intro=" + a_intro + ", a_code=" + a_code + "]";
	}
	
	
	
	

}
