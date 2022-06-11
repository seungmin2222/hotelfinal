package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardNoticeDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardNoticeDAOImpl implements BoardNoticeDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.BoardNoticeMapper";

	@Override
	public void insertNotice(BoardNoticeDTO boardNoticeDTO) {
		System.out.println("BoardNoticeDAOImpl - insertNotice()");
		sqlSession.insert(namespace + ".insertNotice", boardNoticeDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("BoardNoticeDAOImpl - getMaxNum()");
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<BoardNoticeDTO> getBoardNoticeList(PageDTO pageDTO) {
		System.out.println("BoardNoticeDAOImpl - getBoardNoticeList()");
		return sqlSession.selectList(namespace + ".getBoardNoticeList", pageDTO);
	}

	@Override
	public Integer getBoardNoticeCount() {
		System.out.println("BoardNoticeDAOImpl - getBoardNoticeCount()");
		return sqlSession.selectOne(namespace + ".getBoardNoticeCount");
	}

	@Override
	public BoardNoticeDTO getBoardNotice(int notice_idx) {
		System.out.println("BoardNoticeDAOImpl - getBoardNotice()");
		return sqlSession.selectOne(namespace + ".getBoardNotice", notice_idx);
	}

	@Override
	public void updateReadcount(int notice_idx) {
		System.out.println("BoardNoticeDAOImpl - updateReadcount()");
		sqlSession.update(namespace + ".updateReadcount", notice_idx);
	}

	@Override
	public void updateBoardNotice(BoardNoticeDTO boardNoticeDTO) {
		System.out.println("BoardNoticeDAOImpl - updateBoardNotice()");
		sqlSession.update(namespace + ".updateBoardNotice", boardNoticeDTO);
	}

	@Override
	public void deleteBoardNotice(int notice_idx) {
		System.out.println("BoardNoticeDAOImpl - deleteBoardNotice()");
		sqlSession.delete(namespace + ".deleteBoardNotice", notice_idx);
	}
	
}
