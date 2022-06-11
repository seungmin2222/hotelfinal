package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminMemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Inject
	private AdminMemberDAO adminMemberDAO;
	
	
	@Override
	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		System.out.println("adminMemberService - getMemberList");
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return adminMemberDAO.getMemberList(pageDTO);
	}


	@Override
	public int getMembercount() {
		// TODO Auto-generated method stub
		return adminMemberDAO.getMemberCount();
	}

}
