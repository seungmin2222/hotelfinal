package com.itwillbs.domain;


public class MemberDTO {
//	
//	CREATE TABLE member (
//   member_id VARCHAR(25),
//	 member_pass VARCHAR(100),
//	 member_name VARCHAR(25),
//	 member_birth VARCHAR(25),
//	 member_address VARCHAR(100),
//	 member_phone VARCHAR(25),
//	 member_mail VARCHAR(25),
//	 member_gender VARCHAR(25),
//	 member_grade VARCHAR(25)
//			);
//	
	
	//멤버변수
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_birth;
	private String member_address;
	private String member_phone;
	private String member_mail;
	private String member_gender;
	private String member_grade;
	private String member_totalPrice;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String member_mail) {
		this.member_mail = member_mail;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_totalPrice() {
		return member_totalPrice;
	}
	public void setMember_totalPrice(String member_totalPrice) {
		this.member_totalPrice = member_totalPrice;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pass=" + member_pass + ", member_name=" + member_name
				+ ", member_birth=" + member_birth + ", member_address=" + member_address + ", member_phone="
				+ member_phone + ", member_mail=" + member_mail + ", member_gender=" + member_gender + ", member_grade="
				+ member_grade + ", member_totalPrice=" + member_totalPrice + "]";
	}
	
	
	
	
}
