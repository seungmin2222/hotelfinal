package com.itwillbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public interface NoticeBoardDAO {

	public void insertNotice(NoticeBoardDTO noticeBoardDTO);

	public Integer getMaxNum();

	public List<NoticeBoardDTO> getNoticeList(PageDTO pageDTO);

	public Integer getNoticeCount();

	public NoticeBoardDTO getNotice(int num);

	public void deleteNotice(int num);

	public void updateNotice(NoticeBoardDTO noticeBoardDTO);
	
	public void updateReadcount(int notice_idx);
}
