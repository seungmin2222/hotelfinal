package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardFaqDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardFaqDAOImpl implements BoardFaqDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.BoardFaqMapper";

	@Override
	public void insertFaq(BoardFaqDTO boardFaqDTO) {
		System.out.println("BoardFaqDAOImpl - insertFaq()");
		sqlSession.insert(namespace + ".insertFaq", boardFaqDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("BoardFaqDAOImpl - getMaxNum()");
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<BoardFaqDTO> getBoardFaqList(PageDTO pageDTO) {
		System.out.println("BoardFaqDAOImpl - getBoardFaqList()");
		return sqlSession.selectList(namespace + ".getBoardFaqList", pageDTO);
	}

	@Override
	public Integer getBoardFaqCount() {
		System.out.println("BoardFaqDAOImpl - getBoardFaqCount()");
		return sqlSession.selectOne(namespace + ".getBoardFaqCount");
	}

	@Override
	public BoardFaqDTO getBoardFaq(int faq_idx) {
		System.out.println("BoardFaqDAOImpl - getBoardFaq()");
		return sqlSession.selectOne(namespace + ".getBoardFaq", faq_idx);
	}

	@Override
	public void updateBoardFaq(BoardFaqDTO boardFaqDTO) {
		System.out.println("BoardFaqDAOImpl - updateBoardFaq()");
		sqlSession.delete(namespace + ".updateBoardFaq", boardFaqDTO);
	}

	@Override
	public void deleteBoardFaq(int faq_idx) {
		System.out.println("BoardFaqDAOImpl - deleteBoardFaq()");
		sqlSession.delete(namespace + ".deleteBoardFaq", faq_idx);
	}
}
