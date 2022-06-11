package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public interface NoticeBoardService {

	public void insertNotice(NoticeBoardDTO noticeBoardDTO);

	public List<NoticeBoardDTO> getNoticeList(PageDTO pageDTO);

	public Integer getNoticeCount();

	public NoticeBoardDTO getNotice(int num);

	public void deleteNotice(int num);

	public void updateNotice(NoticeBoardDTO noticeBoardDTO);
	
	public void updateReadcount(int notice_idx);
}
