package com.itwillbs.domain;

public class StateDTO {

//	CREATE TABLE STATE (
//			book_user_name VARCHAR(25),
//			book_user_id VARCHAR(25),
//			book_number VARCHAR(25),
//			book_checkin VARCHAR(25),
//			book_checkout VARCHAR(25),
//			book_room_name VARCHAR(25),
//			checkin_state int(4),
//			assigned_room_name VARCHAR(25),
//			assigned_room VARCHAR(25),
//			etc VARCHAR(1000)
//			);

	private String book_user_name;
	private String book_user_id;
	private String book_number;
	private String book_checkin;
	private String book_checkout;
	private String book_room_name;
	private String book_room;
	private int checkin_state;
	private String assigned_room_name;
	private String assigned_room;
	private String etc;
	

	public String getBook_user_name() {
		return book_user_name;
	}
	public void setBook_user_name(String book_user_name) {
		this.book_user_name = book_user_name;
	}
	public String getBook_user_id() {
		return book_user_id;
	}
	public void setBook_user_id(String book_user_id) {
		this.book_user_id = book_user_id;
	}
	public String getBook_number() {
		return book_number;
	}
	public void setBook_number(String book_number) {
		this.book_number = book_number;
	}
	public String getBook_checkin() {
		return book_checkin;
	}
	public void setBook_checkin(String book_checkin) {
		this.book_checkin = book_checkin;
	}
	public String getBook_checkout() {
		return book_checkout;
	}
	public void setBook_checkout(String book_checkout) {
		this.book_checkout = book_checkout;
	}
	public String getBook_room_name() {
		return book_room_name;
	}
	public void setBook_room_name(String book_room_name) {
		this.book_room_name = book_room_name;
	}
	public String getBook_room() {
		return book_room;
	}
	public void setBook_room(String book_room) {
		this.book_room = book_room;
	}
	public int getCheckin_state() {
		return checkin_state;
	}
	public void setCheckin_state(int checkin_state) {
		this.checkin_state = checkin_state;
	}
	public String getAssigned_room_name() {
		return assigned_room_name;
	}
	public void setAssigned_room_name(String assigned_room_name) {
		this.assigned_room_name = assigned_room_name;
	}
	public String getAssigned_room() {
		return assigned_room;
	}
	public void setAssigned_room(String assigned_room) {
		this.assigned_room = assigned_room;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}
