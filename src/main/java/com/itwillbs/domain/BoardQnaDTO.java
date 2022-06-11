package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardQnaDTO {
/*
CREATE TABLE qna (
	qna_idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	qna_pass VARCHAR(45) NOT NULL,
	qna_category VARCHAR(30) NOT NULL,
	qna_subject VARCHAR(100) NOT NULL,
	qna_content VARCHAR(1000) NOT NULL,
	qna_date DATETIME NOT NULL,
	qna_req INT,
	qna_lev INT,
	qna_seq INT,
	member_id VARCHAR(45) NOT NULL
);
*/
	int qna_idx;
	String qna_pass;
	String qna_category; // 카테고리
	String qna_subject; // 
	String qna_content;
	Timestamp qna_date;
	int qna_req; // 원본글
	int qna_lev; // 들여쓰기
	int qna_seq; // 순서
	String member_id;
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_req() {
		return qna_req;
	}
	public void setQna_req(int qna_req) {
		this.qna_req = qna_req;
	}
	public int getQna_lev() {
		return qna_lev;
	}
	public void setQna_lev(int qna_lev) {
		this.qna_lev = qna_lev;
	}
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "BoardQnaDTO [qna_idx=" + qna_idx + ", qna_pass=" + qna_pass + ", qna_category=" + qna_category
				+ ", qna_subject=" + qna_subject + ", qna_content=" + qna_content + ", qna_date=" + qna_date
				+ ", qna_req=" + qna_req + ", qna_lev=" + qna_lev + ", qna_seq=" + qna_seq + ", member_id=" + member_id
				+ "]";
	}
	
}
