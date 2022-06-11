package com.itwillbs.domain;

public class RoomInfoDTO {


//	CREATE TABLE roominfo (
//	room_number VARCHAR(25),
//	room_name VARCHAR(25),
//	room_user VARCHAR(25),
//	room_checkin VARCHAR(25),
//	room_checkout VARCHAR(25),
//	room_etc VARCHAR(1000)
//	);
	
	private String room_number;
	private String room_name;
	private String room_user;
	private String room_checkin;
	private String room_checkout;
	private String room_etc;
	
	public String getRoom_number() {
		return room_number;
	}
	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_user() {
		return room_user;
	}
	public void setRoom_user(String room_user) {
		this.room_user = room_user;
	}
	public String getRoom_checkin() {
		return room_checkin;
	}
	public void setRoom_checkin(String room_checkin) {
		this.room_checkin = room_checkin;
	}
	public String getRoom_checkout() {
		return room_checkout;
	}
	public void setRoom_checkout(String room_checkout) {
		this.room_checkout = room_checkout;
	}
	public String getRoom_etc() {
		return room_etc;
	}
	public void setRoom_etc(String room_etc) {
		this.room_etc = room_etc;
	}

	
}

