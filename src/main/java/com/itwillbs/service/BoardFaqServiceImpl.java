package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardFaqDAO;
import com.itwillbs.domain.BoardFaqDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardFaqServiceImpl implements BoardFaqService {
	@Inject
	private BoardFaqDAO boardFaqDAO;

	@Override
	public void insertFaq(BoardFaqDTO boardFaqDTO) {
		System.out.println("BoardFaqServiceImpl - insertFaq()");
		
		if(boardFaqDAO.getMaxNum() == null) {
			// 글이 없는경우 faq_idx = 1
			boardFaqDTO.setFaq_idx(1);
		}else {
			boardFaqDTO.setFaq_idx(boardFaqDAO.getMaxNum() + 1);
		}
		boardFaqDAO.insertFaq(boardFaqDTO);		
	}

	@Override
	public List<BoardFaqDTO> getBoardFaqList(PageDTO pageDTO) {
		System.out.println("BoardFaqServiceImpl - getBoardFaqList()");
		
		//현재페이지
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return boardFaqDAO.getBoardFaqList(pageDTO);
	}

	@Override
	public Integer getBoardFaqCount() {
		System.out.println("BoardFaqServiceImpl - getBoardFaqCount()");
		return boardFaqDAO.getBoardFaqCount();
	}

	@Override
	public BoardFaqDTO getBoardFaq(int faq_idx) {
		System.out.println("BoardFaqServiceImpl - getBoardFaq()");
		return boardFaqDAO.getBoardFaq(faq_idx);
	}

	@Override
	public void updateBoardFaq(BoardFaqDTO boardFaqDTO) {
		System.out.println("BoardFaqServiceImpl - updateBoardFaq()");
		boardFaqDAO.updateBoardFaq(boardFaqDTO);
	}

	@Override
	public void deleteBoardFaq(int faq_idx) {
		System.out.println("BoardFaqServiceImpl - deleteBoardFaq()");
		boardFaqDAO.deleteBoardFaq(faq_idx);
	}
}
