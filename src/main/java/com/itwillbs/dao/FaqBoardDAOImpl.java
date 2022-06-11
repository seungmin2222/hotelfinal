package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FaqBoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.FaqBoardMapper";

	@Override
	public void insertFaqBoard(FaqBoardDTO faqBoardDTO) {
		sqlSession.insert(namespace+".insertFaqBoard",faqBoardDTO);
	}

	@Override
	public List<FaqBoardDTO> getFaqBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getFaqBoardList",pageDTO);
	}

	@Override
	public Integer getFaqBoardCount() {
		return sqlSession.selectOne(namespace+".getFaqBoardCount");
	}

	@Override
	public FaqBoardDTO getFaqBoard(int faq_idx) {
		return sqlSession.selectOne(namespace+".getFaqBoard", faq_idx);
	}

	@Override
	public void updateFaqBoard(FaqBoardDTO faqBoardDTO) {
		sqlSession.update(namespace+".updateFaqBoard", faqBoardDTO);
	}

	@Override
	public void deleteFaqBoard(int faq_idx) {
		sqlSession.delete(namespace+".deleteFaqBoard", faq_idx);
	}
	
	
	
}
