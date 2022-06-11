package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	// 추상메서드
	public void insertMember(MemberDTO memberDTO);

	public MemberDTO userCheck(MemberDTO memberDTO);
	
	public MemberDTO updateCheck(MemberDTO memberDTO);

	public MemberDTO getMember(String member_id);
	
	public MemberDTO findId(MemberDTO memberDTO);

	public MemberDTO findPass(MemberDTO memberDTO);
	
	public void updatePass(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);

	public void updateMember(MemberDTO memberDTO);

	public void updateGrade(MemberDTO memberDTO);
}
