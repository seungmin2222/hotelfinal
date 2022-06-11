package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.FaqBoardDTO;
import com.itwillbs.domain.PageDTO;

public interface FaqBoardDAO {
	public void insertFaqBoard(FaqBoardDTO faqBoardDTO);
	
	public List<FaqBoardDTO> getFaqBoardList(PageDTO pageDTO);
	
	public Integer getFaqBoardCount();
	
	public FaqBoardDTO getFaqBoard(int faq_idx);
	
	public void updateFaqBoard(FaqBoardDTO faqBoardDTO);
	
	public void deleteFaqBoard(int faq_idx);
}
