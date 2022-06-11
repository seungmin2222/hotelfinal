package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardQnaDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardQnaDAOImpl implements BoardQnaDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.BoardQnaMapper";

	@Override
	public void insertBoardQna(BoardQnaDTO boardQnaDTO) {
		sqlSession.insert(namespace+".insertBoardQna",boardQnaDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("BoardQnaDAOImpl - getMaxNum()");
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public int getAutoIncrementNum() {
		return sqlSession.selectOne(namespace+".getAutoIncrementNum");
	}

	@Override
	public List<BoardQnaDTO> getBoardQnaList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardQnaList",pageDTO);
	}

	@Override
	public int getBoardQnaCount() {
		return sqlSession.selectOne(namespace+".getBoardQnaCount");
	}

	@Override
	public BoardQnaDTO getBoardQna(int qna_idx) {
		return sqlSession.selectOne(namespace+".getBoardQna", qna_idx);
	}

	@Override
	public void updateBoardQna(BoardQnaDTO boardQnaDTO) {
		sqlSession.update(namespace+".updateBoardQna", boardQnaDTO);
	}

	@Override
	public void deleteBoardQna(int qna_idx) {
		sqlSession.delete(namespace+".deleteBoardQna", qna_idx);
	}

	@Override
	public void insertBoardQnaReply(BoardQnaDTO boardQnaDTO) {
		sqlSession.insert(namespace+".insertBoardQnaReply",boardQnaDTO);
	}

	@Override
	public int getBoardQnaReply(int qna_req) {
		return sqlSession.selectOne(namespace+".getBoardQnaReply", qna_req);
	}

}
