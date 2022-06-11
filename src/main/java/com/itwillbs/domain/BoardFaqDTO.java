package com.itwillbs.domain;

public class BoardFaqDTO {
/*
CREATE TABLE faq (
	faq_idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	faq_category VARCHAR(30) NOT NULL,
	faq_subject VARCHAR(100) NOT NULL,
	faq_content VARCHAR(1000) NOT NULL
);
 */
	private int faq_idx;
	private String faq_category;
	private String faq_subject;
	private String faq_content;
	
	public int getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
}
