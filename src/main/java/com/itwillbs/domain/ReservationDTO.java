package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReservationDTO {
//	CREATE TABLE reservation (
//			 book_user VARCHAR(25),
//	         book_number VARCHAR(25),
//	         book_checkin VARCHAR(25),
//	         book_checkout VARCHAR(25),
//	         book_room_name VARCHAR(25),
//	         book_rooms VARCHAR(25),
//	         book_adult VARCHAR(25),
//	         book_children VARCHAR(25),
//	         book_bed VARCHAR(25),
//	         book_breakfast_adult VARCHAR(25),
//	         book_breakfast_children VARCHAR(25),
//	         book_reqmatter VARCHAR(10000),
//	         book_totalPrice VARCHAR(10)

	//멤버변수
	private String book_user;
	private String book_number;             //예약번호
	private String book_checkin;            // 체크인
	private String book_checkout;           // 체크아웃
	private String book_room_name;          // 객실명
	private String book_rooms;              // 객실수
	private String book_adult;              // 성인수
	private String book_children;           // 아동수
	private String book_bed;                // 베드추가갯수
	private String book_breakfast_adult;    // 성인조식인원
	private String book_breakfast_children; // 아동조식인원
	private String book_reqmatter;          // 문의사항
	private String book_totalPrice;         // 총가격
	
	
	public String getBook_user() {
		return book_user;
	}
	public void setBook_user(String book_user) {
		this.book_user = book_user;
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
	public String getBook_rooms() {
		return book_rooms;
	}
	public void setBook_rooms(String book_rooms) {
		this.book_rooms = book_rooms;
	}
	public String getBook_adult() {
		return book_adult;
	}
	public void setBook_adult(String book_adult) {
		this.book_adult = book_adult;
	}
	public String getBook_children() {
		return book_children;
	}
	public void setBook_children(String book_children) {
		this.book_children = book_children;
	}
	public String getBook_bed() {
		return book_bed;
	}
	public void setBook_bed(String book_bed) {
		this.book_bed = book_bed;
	}
	public String getBook_breakfast_adult() {
		return book_breakfast_adult;
	}
	public void setBook_breakfast_adult(String book_breakfast_adult) {
		this.book_breakfast_adult = book_breakfast_adult;
	}
	public String getBook_breakfast_children() {
		return book_breakfast_children;
	}
	public void setBook_breakfast_children(String book_breakfast_children) {
		this.book_breakfast_children = book_breakfast_children;
	}
	public String getBook_reqmatter() {
		return book_reqmatter;
	}
	public void setBook_reqmatter(String book_reqmatter) {
		this.book_reqmatter = book_reqmatter;
	}
	public String getBook_totalPrice() {
		return book_totalPrice;
	}
	public void setBook_totalPrice(String book_totalPrice) {
		this.book_totalPrice = book_totalPrice;
	}
	
	
	
	
	
	
	
}
