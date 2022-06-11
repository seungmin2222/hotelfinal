package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;


public interface QnaBoardDAO {
	public void insertQnaBoard(QnaBoardDTO qnaBoardDTO);
	
	public List<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO);
	
	public int getQnaBoardCount();
	
	public QnaBoardDTO getQnaBoard(int qna_idx);
	
	public String getQnaPass(int qna_idx);
	
	public void updateQnaBoard(QnaBoardDTO qnaBoardDTO);
	
	public void deleteQnaBoard(int qna_idx);
	
	public int getAutoIncrementNum();
	
	public void insertQnaReply(QnaBoardDTO qnaBoardDTO);
}
