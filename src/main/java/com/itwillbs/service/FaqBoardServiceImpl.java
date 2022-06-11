package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.FaqBoardDAO;
import com.itwillbs.domain.FaqBoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class FaqBoardServiceImpl implements FaqBoardService{
	@Inject
	private FaqBoardDAO faqBoardDAO;

	@Override
	public void insertFaqBoard(FaqBoardDTO faqBoardDTO) {
		faqBoardDAO.insertFaqBoard(faqBoardDTO);
	}

	@Override
	public List<FaqBoardDTO> getFaqBoardList(PageDTO pageDTO) {
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return faqBoardDAO.getFaqBoardList(pageDTO);
	}

	@Override
	public Integer getFaqBoardCount() {
		return faqBoardDAO.getFaqBoardCount();
	}

	@Override
	public FaqBoardDTO getFaqBoard(int faq_idx) {
		return faqBoardDAO.getFaqBoard(faq_idx);
	}

	@Override
	public void updateFaqBoard(FaqBoardDTO faqBoardDTO) {
		faqBoardDAO.updateFaqBoard(faqBoardDTO);
	}

	@Override
	public void deleteFaqBoard(int faq_idx) {
		faqBoardDAO.deleteFaqBoard(faq_idx);
	}
	
	
	
}
