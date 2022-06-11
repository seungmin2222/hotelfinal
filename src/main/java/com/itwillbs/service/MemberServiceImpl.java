package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.MemberDAOImpl;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl - insertMember()");
		// insertMember() 메서드 호출
		memberDAO.insertMember(memberDTO);
		
		}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl - userCheck()");
		return memberDAO.userCheck(memberDTO);
	}
	
	@Override
	public MemberDTO updateCheck(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl - updateCheck()");
		return memberDAO.updateCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String member_id) {
		System.out.println("MemberServiceImpl.getMember()");
		System.out.println(member_id);
		return memberDAO.getMember(member_id);
	}
	
	@Override
	public MemberDTO findId(MemberDTO memberDTO) {
		System.out.println("MemberServieImpl - findId()");
		return memberDAO.findId(memberDTO);
	}

	@Override
	public MemberDTO findPass(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl - findPass()");
		return memberDAO.findPass(memberDTO);
	}
	
	@Override
	public void updatePass(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl - updatePass()");
		memberDAO.updatePass(memberDTO);
	}
	
	@Override
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberService - deletePro()");
		memberDAO.deleteMember(memberDTO);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl.updateMember()");
		System.out.println(memberDTO);
		memberDAO.updateMember(memberDTO);
	}

	@Override
	public void updateGrade(MemberDTO memberDTO) {
		memberDAO.updateGrade(memberDTO);
		
	}

}

