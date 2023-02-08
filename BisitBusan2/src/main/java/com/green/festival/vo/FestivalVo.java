package com.green.festival.vo;

public class FestivalVo {
	
		private int f_code;
		private String f_name;
		private String f_date;
		private String f_address;
		private String f_fee;
		private String f_tel;
		private String f_hp;
		private double f_latitude;
		private double f_logitude;
		private String f_theme;
		private int f_good;
		private String f_intro;
		
		public FestivalVo() {}
		public FestivalVo(int f_code, String f_name, String f_date, String f_address, String f_fee, String f_tel,
				String f_hp, double f_latitude, double f_logitude, String f_theme, int f_good, String f_intro) {
			this.f_code = f_code;
			this.f_name = f_name;
			this.f_date = f_date;		
			this.f_address = f_address;
			this.f_fee = f_fee;
			this.f_tel = f_tel;
			this.f_hp = f_hp;
			this.f_latitude = f_latitude;
			this.f_logitude = f_logitude;
			this.f_theme = f_theme;
			this.f_good = f_good;
			this.f_intro = f_intro;
		}
		
		public int getF_code() {
			return f_code;
		}
		public void setF_code(int f_code) {
			this.f_code = f_code;
		}
		public String getF_name() {
			return f_name;
		}
		public void setF_name(String f_name) {
			this.f_name = f_name;
		}
		public String getF_date() {
			return f_date;
		}
		public void setF_date(String f_date) {
			this.f_date = f_date;
		}
		public String getF_address() {
			return f_address;
		}
		public void setF_address(String f_address) {
			this.f_address = f_address;
		}
		public String getF_fee() {
			return f_fee;
		}
		public void setF_fee(String f_fee) {
			this.f_fee = f_fee;
		}
		public String getF_tel() {
			return f_tel;
		}
		public void setF_tel(String f_tel) {
			this.f_tel = f_tel;
		}
		public String getF_hp() {
			return f_hp;
		}
		public void setF_hp(String f_hp) {
			this.f_hp = f_hp;
		}
		public double getF_latitude() {
			return f_latitude;
		}
		public void setF_latitude(double f_latitude) {
			this.f_latitude = f_latitude;
		}
		public double getF_logitude() {
			return f_logitude;
		}
		public void setF_logitude(double f_logitude) {
			this.f_logitude = f_logitude;
		}
		public String getF_theme() {
			return f_theme;
		}
		public void setF_theme(String f_theme) {
			this.f_theme = f_theme;
		}
		public int getF_good() {
			return f_good;
		}
		public void setF_good(int f_good) {
			this.f_good = f_good;
		}
		public String getF_intro() {
			return f_intro;
		}
		public void setF_intro(String f_intro) {
			this.f_intro = f_intro;
		}
		
		@Override
		public String toString() {
			return "FestivalVo [f_code=" + f_code + ", f_name=" + f_name + ", f_date=" + f_date + ", f_address="
					+ f_address + ", f_fee=" + f_fee + ", f_tel=" + f_tel + ", f_hp=" + f_hp + ", f_latitude="
					+ f_latitude + ", f_logitude=" + f_logitude + ", f_theme=" + f_theme + ", f_good=" + f_good
					+ ", f_intro=" + f_intro + "]";
		}

		
}
