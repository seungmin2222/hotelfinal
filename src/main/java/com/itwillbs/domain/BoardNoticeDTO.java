package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardNoticeDTO {
/*
CREATE TABLE notice (
	notice_idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	notice_subject VARCHAR(100) NOT NULL,
	notice_content VARCHAR(1000) NOT NULL,
	notice_date DATETIME NOT NULL,
	notice_readcount INT(25) NOT NULL,
	notice_file VARCHAR(100) NOT NULL
);
*/
	private int notice_idx;
	private String notice_subject;
	private String notice_content;
	private Timestamp notice_date;
	private int notice_readcount;
	private String notice_file;
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	
	
	
}
