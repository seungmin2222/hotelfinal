package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardFaqDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardFaqDAO {

	public void insertFaq(BoardFaqDTO boardFaqDTO);

	public Integer getMaxNum();

	public List<BoardFaqDTO> getBoardFaqList(PageDTO pageDTO);

	public Integer getBoardFaqCount();

	public BoardFaqDTO getBoardFaq(int faq_idx);

	public void updateBoardFaq(BoardFaqDTO boardFaqDTO);

	public void deleteBoardFaq(int faq_idx);

}
