package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.AdminMemberMapper";
	
	@Override
	public List<MemberDTO> getMemberList(PageDTO pageDTO) {
		System.out.println("adminMemberDAO - getMemberList");
		return sqlSession.selectList(namespace+".getMemberList",pageDTO);
	}

	@Override
	public int getMemberCount() {
		
		return sqlSession.selectOne(namespace+".getMemberCount");
	}
	
}
