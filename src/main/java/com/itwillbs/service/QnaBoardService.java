package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;

public interface QnaBoardService {
	public void insertQnaBoard(QnaBoardDTO qnaBoardDTO);
	
	public List<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO);
	
	public int getQnaBoardCount();
	
	public QnaBoardDTO getQnaBoard(int qna_idx);
	
	public String getQnaPass(int qna_idx);
	
	public void updateQnaBoard(QnaBoardDTO qnaBoardDTO);
	
	public void deleteQnaBoard(int qna_idx);
	
	public void insertQnaReply(QnaBoardDTO qnaBoardDTO);
	
}
