package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.NoticeBoardDAO;
import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Inject
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public void insertNotice(NoticeBoardDTO noticeBoardDTO) {
		noticeBoardDTO.setNotice_readcount(0);
		noticeBoardDTO.setNotice_date(new Timestamp(System.currentTimeMillis()));
		if(noticeBoardDAO.getMaxNum()== null) {
			noticeBoardDTO.setNotice_idx(1);
		}else {
			noticeBoardDTO.setNotice_idx(noticeBoardDAO.getMaxNum()+1);
		}
		
		noticeBoardDAO.insertNotice(noticeBoardDTO);
	}

	@Override
	public List<NoticeBoardDTO> getNoticeList(PageDTO pageDTO) {
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return noticeBoardDAO.getNoticeList(pageDTO);
	}

	@Override
	public Integer getNoticeCount() {
		return noticeBoardDAO.getNoticeCount();
	}

	@Override
	public NoticeBoardDTO getNotice(int num) {
		return noticeBoardDAO.getNotice(num);
	}

	@Override
	public void deleteNotice(int num) {
		noticeBoardDAO.deleteNotice(num);
		
	}

	@Override
	public void updateNotice(NoticeBoardDTO noticeBoardDTO) {
		noticeBoardDAO.updateNotice(noticeBoardDTO);
	}

	@Override
	public void updateReadcount(int notice_idx) {
		noticeBoardDAO.updateReadcount(notice_idx);
	}

	
	

}
