package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardQnaDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardQnaDAO {

	public void insertBoardQna(BoardQnaDTO boardQnaDTO);

	public Integer getMaxNum();

	public int getAutoIncrementNum();

	public List<BoardQnaDTO> getBoardQnaList(PageDTO pageDTO);
	
	public int getBoardQnaCount();

	public BoardQnaDTO getBoardQna(int qna_idx);

	public void updateBoardQna(BoardQnaDTO boardQnaDTO);

	public void deleteBoardQna(int qna_idx);

	public void insertBoardQnaReply(BoardQnaDTO boardQnaDTO);

	public int getBoardQnaReply(int qna_req);

}
