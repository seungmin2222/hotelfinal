package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.NoticeBoardMapper";

	@Override
	public void insertNotice(NoticeBoardDTO noticeBoardDTO) {
		sqlSession.insert(namespace+".insertNotice", noticeBoardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<NoticeBoardDTO> getNoticeList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getNoticeList", pageDTO);
	}

	@Override
	public Integer getNoticeCount() {
		return sqlSession.selectOne(namespace+".getNoticeCount");
	}

	@Override
	public NoticeBoardDTO getNotice(int num) {
		return sqlSession.selectOne(namespace+".getNotice", num);
	}

	@Override
	public void deleteNotice(int num) {
		sqlSession.delete(namespace+".deleteNotice", num);
	}

	@Override
	public void updateNotice(NoticeBoardDTO noticeBoardDTO) {
		sqlSession.update(namespace+".updateNotice", noticeBoardDTO);
	}

	@Override
	public void updateReadcount(int notice_idx) {
		sqlSession.update(namespace+".updateReadcount", notice_idx);
	}

	
	
}
