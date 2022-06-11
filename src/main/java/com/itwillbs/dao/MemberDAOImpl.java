package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
// 디비 작업하는 역할
@Repository
public class MemberDAOImpl implements MemberDAO{
	
		@Inject
		private SqlSession sqlSession;
		
		//sql구문 들어있는 파일 이름 변수 정의
		private static final String namespace="com.itwillbs.mapper.MemberMapper";

		@Override
		public void insertMember(MemberDTO memberDTO) {
			System.out.println("MemberDAOImpl - insertMember()");
			sqlSession.insert(namespace+".insertMember", memberDTO);
		}

		@Override
		public MemberDTO userCheck(MemberDTO memberDTO) {
			System.out.println("MemberDAOImpl - userCheck()");
			return sqlSession.selectOne(namespace+".userCheck", memberDTO);
		}
		
		@Override
		public MemberDTO updateCheck(MemberDTO memberDTO) {
			System.out.println("MemberDAOImpl - updateCheck()");
			return sqlSession.selectOne(namespace+".updateCheck", memberDTO);
		}

		@Override
		public MemberDTO getMember(String member_id) {
			System.out.println("MemberDAOImpl getMember()");
			System.out.println(member_id);
			return sqlSession.selectOne(namespace+".getMember", member_id);
		}
		
		@Override
		public MemberDTO findId(MemberDTO memberDTO) {
			System.out.println("MemberDAOImpl - findId()");
			return sqlSession.selectOne(namespace+".findId", memberDTO);
		}

		@Override
		public MemberDTO findPass(MemberDTO memberDTO) {
			System.out.println("MemerDAOImpl - findPass()");
			return sqlSession.selectOne(namespace+".findPass", memberDTO);
		}
		
		@Override
		public void updatePass(MemberDTO memberDTO) {
			System.out.println("MemerDAOImpl - updatePass()");
			sqlSession.update(namespace + ".updatePass", memberDTO);
		}
		
		@Override
		public void deleteMember(MemberDTO memberDTO) {
			System.out.println("MemberDAOImpl - deleteMember()");
			sqlSession.delete(namespace + ".deleteMember", memberDTO);
		}

		@Override
		public void updateMember(MemberDTO memberDTO) {
			sqlSession.update(namespace+".updateMember", memberDTO);
		}

		@Override
		public void updateGrade(MemberDTO memberDTO) {
			sqlSession.update(namespace+".updateGrade", memberDTO);
			
		}

}
