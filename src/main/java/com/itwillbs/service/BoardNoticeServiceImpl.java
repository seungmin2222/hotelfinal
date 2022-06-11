package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardNoticeDAO;
import com.itwillbs.domain.BoardNoticeDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardNoticeServiceImpl implements BoardNoticeService {
	@Inject
	private BoardNoticeDAO boardNoticeDAO;

	@Override
	public void insertNotice(BoardNoticeDTO boardNoticeDTO) {
		System.out.println("BoardNoticeServiceImpl - insertNotice()");
		
		boardNoticeDTO.setNotice_readcount(0);
		boardNoticeDTO.setNotice_date(new Timestamp(System.currentTimeMillis()));
		// 게시물의 글이 있는지 여부판단 idx지정해줄거임
		if(boardNoticeDAO.getMaxNum() == null) {
			// 글이 없는경우 notice_idx = 1
			boardNoticeDTO.setNotice_idx(1);
		} else {
			boardNoticeDTO.setNotice_idx(boardNoticeDAO.getMaxNum() + 1);
		}
		
		boardNoticeDAO.insertNotice(boardNoticeDTO);
		
	}

	@Override
	public List<BoardNoticeDTO> getBoardNoticeList(PageDTO pageDTO) {
		System.out.println("BoardNoticeServiceImpl - getBoardNoticeList()");
		
		//현재페이지
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return boardNoticeDAO.getBoardNoticeList(pageDTO);
	}

	@Override
	public Integer getBoardNoticeCount() {
		System.out.println("BoardNoticeServiceImpl - getBoardNoticeCount()");
		return boardNoticeDAO.getBoardNoticeCount();
	}

	@Override
	public BoardNoticeDTO getBoardNotice(int notice_idx) {
		System.out.println("BoardNoticeServiceImpl - getBoardNotice()");
		return boardNoticeDAO.getBoardNotice(notice_idx);
	}

	@Override
	public void updateReadcount(int notice_idx) {
		System.out.println("BoardNoticeServiceImpl - updateReadcount()");
		boardNoticeDAO.updateReadcount(notice_idx);
	}

	@Override
	public void updateBoardNotice(BoardNoticeDTO boardNoticeDTO) {
		System.out.println("BoardNoticeServiceImpl - updateReadcount()");
		boardNoticeDAO.updateBoardNotice(boardNoticeDTO);
	}

	@Override
	public void deleteBoardNotice(int notice_idx) {
		System.out.println("BoardNoticeServiceImpl - deleteBoardNotice()");
		boardNoticeDAO.deleteBoardNotice(notice_idx);
	}
}
