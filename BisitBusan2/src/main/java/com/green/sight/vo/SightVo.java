package com.green.sight.vo;

public class SightVo {

		private int    s_code;
		private String s_name;
		private String s_date;
		private String s_intro;
		private String s_address;
		private String s_fee;
		private String s_tel;
		private String s_hp;
		private int    s_good;
		private float  s_latitude;
		private float  s_longitude;
		
		
		public SightVo() {}
		public SightVo(int s_code, String s_name, String s_date, String s_intro, String s_address, String s_fee,
				String s_tel, String s_hp, int s_good, float s_latitude, float s_longitude) {
			
			this.s_code = s_code;
			this.s_name = s_name;
			this.s_date = s_date;
			this.s_intro = s_intro;
			this.s_address = s_address;
			this.s_fee = s_fee;
			this.s_tel = s_tel;
			this.s_hp = s_hp;
			this.s_good = s_good;
			this.s_latitude = s_latitude;
			this.s_longitude = s_longitude;
		}
		
		public int getS_code() {
			return s_code;
		}
		public void setS_code(int s_code) {
			this.s_code = s_code;
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
		public int getS_good() {
			return s_good;
		}
		public void setS_good(int s_good) {
			this.s_good = s_good;
		}
		public float getS_latitude() {
			return s_latitude;
		}
		public void setS_latitude(float s_latitude) {
			this.s_latitude = s_latitude;
		}
		public float getS_longitude() {
			return s_longitude;
		}
		public void setS_longitude(float s_longitude) {
			this.s_longitude = s_longitude;
		}
		
		@Override
		public String toString() {
			return "SightVo [s_code=" + s_code + ", s_name=" + s_name + ", s_date=" + s_date + ", s_intro=" + s_intro
					+ ", s_address=" + s_address + ", s_fee=" + s_fee + ", s_tel=" + s_tel + ", s_hp=" + s_hp
					+ ", s_good=" + s_good + ", s_latitude=" + s_latitude + ", s_longitude=" + s_longitude + "]";
		}
		

		
}
