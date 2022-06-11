package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mapper.QnaBoardMapper";
	
	@Override
	public void insertQnaBoard(QnaBoardDTO qnaBoardDTO) {
		sqlSession.insert(namespace+".insertQnaBoard",qnaBoardDTO);
	}
	
	@Override
	public int getAutoIncrementNum() {
		return sqlSession.selectOne(namespace+".getAutoIncrementNum");
	}
	
	@Override
	public List<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getQnaBoardList",pageDTO);
	}

	@Override
	public int getQnaBoardCount() {
		return sqlSession.selectOne(namespace+".getQnaBoardCount");
	}

	@Override
	public QnaBoardDTO getQnaBoard(int qna_idx) {
		return sqlSession.selectOne(namespace+".getQnaBoard", qna_idx);
	}

	@Override
	public String getQnaPass(int qna_idx) {
		return sqlSession.selectOne(namespace+".getQnaPass", qna_idx);
	}

	@Override
	public void updateQnaBoard(QnaBoardDTO qnaBoardDTO) {
		sqlSession.update(namespace+".updateQnaBoard", qnaBoardDTO);
	}
	
	@Override
	   public void deleteQnaBoard(int qna_idx) {
	      sqlSession.delete(namespace+".deleteQnaBoard", qna_idx);
	   }

	@Override
	public void insertQnaReply(QnaBoardDTO qnaBoardDTO) {
		sqlSession.insert(namespace+".insertQnaReply",qnaBoardDTO);
	}

	
	
}
