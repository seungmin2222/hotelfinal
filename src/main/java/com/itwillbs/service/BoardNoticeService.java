package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardNoticeDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardNoticeService {

	// 공지사항 게시물 작성
	public void insertNotice(BoardNoticeDTO boardNoticeDTO);
	
	// 공지사항 게시물 리스트 띄우기
	public List<BoardNoticeDTO> getBoardNoticeList(PageDTO pageDTO);
	
	// 공지사항컨텐츠 카운트
	public Integer getBoardNoticeCount();

	// 공지사항 게시물 보기
	public BoardNoticeDTO getBoardNotice(int notice_idx);

	public void updateReadcount(int notice_idx);

	public void updateBoardNotice(BoardNoticeDTO boardNoticeDTO);

	public void deleteBoardNotice(int notice_idx);

}
