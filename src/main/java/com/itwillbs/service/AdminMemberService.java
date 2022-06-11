package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

public interface AdminMemberService {

	public List<MemberDTO> getMemberList(PageDTO pageDTO);

	public int getMembercount();

	
	
}
