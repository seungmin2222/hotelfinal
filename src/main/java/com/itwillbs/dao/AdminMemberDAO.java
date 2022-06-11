package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

public interface AdminMemberDAO {

	List<MemberDTO> getMemberList(PageDTO pageDTO);

	int getMemberCount();

}
