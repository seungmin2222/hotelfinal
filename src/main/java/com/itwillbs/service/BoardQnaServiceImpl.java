package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardQnaDAO;
import com.itwillbs.domain.BoardQnaDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;

@Service
public class BoardQnaServiceImpl implements BoardQnaService {
	@Inject
	private BoardQnaDAO boardQnaDAO;

	@Override
	public void insertBoardQna(BoardQnaDTO boardQnaDTO) {
		System.out.println("BoardQnaServiceImpl.insertBoardQna()");
		
		// 게시물의 글이 있는지 여부판단 idx 지정해줄거임
		if(boardQnaDAO.getMaxNum() == null) {
			//글이 없는경우 qna_idx = 1 로 지정
			boardQnaDTO.setQna_idx(1);
		} else {
			boardQnaDTO.setQna_idx(boardQnaDAO.getMaxNum() + 1);
		}
		
//		int num = boardQnaDAO.getAutoIncrementNum();
		boardQnaDTO.setQna_date(new Timestamp(System.currentTimeMillis()));
		boardQnaDTO.setQna_req(boardQnaDTO.getQna_idx());
		boardQnaDTO.setQna_lev(0);
		boardQnaDTO.setQna_seq(0);
		boardQnaDAO.insertBoardQna(boardQnaDTO);
	}

	@Override
	public List<BoardQnaDTO> getBoardQnaList(PageDTO pageDTO) {
		// pageSize pageNum 가지고 감
		// currentPage startRow endRow 구하기
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		// int startRow=(currentPage-1)*pageSize+1;
		pageDTO.setStartRow((pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1);
		// int endRow=startRow+pageSize-1;
		pageDTO.setEndRow(pageDTO.getStartRow() + pageDTO.getPageSize() - 1);

		// 디비에서 #{startRow}-1
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return boardQnaDAO.getBoardQnaList(pageDTO);
	}

	@Override
	public int getBoardQnaCount() {
		System.out.println("BoardQnaServiceImpl.getBoardQnaCount()");
		return boardQnaDAO.getBoardQnaCount();
	}

	@Override
	public BoardQnaDTO getBoardQna(int qna_idx) {
		System.out.println("BoardQnaServiceImpl.getBoardQna()");
		return boardQnaDAO.getBoardQna(qna_idx);
	}

	@Override
	public void updateBoardQna(BoardQnaDTO boardQnaDTO) {
		System.out.println("BoardQnaServiceImpl.updateBoardQna()");
		boardQnaDAO.updateBoardQna(boardQnaDTO);
		
	}

	@Override
	public void deleteBoardQna(int qna_idx) {
		System.out.println("BoardQnaServiceImpl.deleteBoardQna()");
		boardQnaDAO.deleteBoardQna(qna_idx);
		
	}

	@Override
	public void insertBoardQnaReply(BoardQnaDTO boardQnaDTO) {
		System.out.println("BoardQnaServiceImpl.insertBoardQnaReply()");
		boardQnaDTO.setQna_date(new Timestamp(System.currentTimeMillis()));
		
		boardQnaDAO.insertBoardQnaReply(boardQnaDTO);
	}

	@Override
	public int getBoardQnaReply(int qna_req) {
		
		System.out.println("BoardQnaServiceImpl.getBoardQnaReply()");
		return boardQnaDAO.getBoardQnaReply(qna_req);
	}


	
}
