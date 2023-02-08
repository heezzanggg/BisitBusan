package com.green.image.vo;

public class ImageVo {

	private int i_code;
	private int sig_scode;
	private int fes_fcode;
	private String i_address;
	private String i_intro;
	private String i_alt;
	
	//constructor
	public ImageVo() {}
	public ImageVo(int i_code, int sig_scode, int fes_fcode, String i_address, String i_intro, String i_alt) {
		this.i_code = i_code;
		this.sig_scode = sig_scode;
		this.fes_fcode = fes_fcode;
		this.i_address = i_address;
		this.i_intro = i_intro;
		this.i_alt = i_alt;
	}
	
	//getter setter
	public int getI_code() {
		return i_code;
	}
	public void setI_code(int i_code) {
		this.i_code = i_code;
	}
	public int getSig_scode() {
		return sig_scode;
	}
	public void setSig_scode(int sig_scode) {
		this.sig_scode = sig_scode;
	}
	public int getFes_fcode() {
		return fes_fcode;
	}
	public void setFes_fcode(int fes_fcode) {
		this.fes_fcode = fes_fcode;
	}
	public String getI_address() {
		return i_address;
	}
	public void setI_address(String i_address) {
		this.i_address = i_address;
	}
	public String getI_intro() {
		return i_intro;
	}
	public void setI_intro(String i_intro) {
		this.i_intro = i_intro;
	}
	public String getI_alt() {
		return i_alt;
	}
	public void setI_alt(String i_alt) {
		this.i_alt = i_alt;
	}
	
	//toString
	@Override
	public String toString() {
		return "ImageVo [i_code=" + i_code + ", sig_scode=" + sig_scode + ", fes_fcode=" + fes_fcode + ", i_address="
				+ i_address + ", i_intro=" + i_intro + ", i_alt=" + i_alt + "]";
	}
	
	
	
	
	
}
