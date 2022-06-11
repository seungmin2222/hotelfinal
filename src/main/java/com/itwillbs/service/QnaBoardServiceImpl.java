package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.QnaBoardDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	@Inject
	private QnaBoardDAO qnaBoardDAO;
	
	@Override
	public void insertQnaBoard(QnaBoardDTO qnaBoardDTO) {
		int num = qnaBoardDAO.getAutoIncrementNum();
		System.out.println(num);
		qnaBoardDTO.setQna_date(new Timestamp(System.currentTimeMillis()));
		qnaBoardDTO.setQna_req(num);
		qnaBoardDTO.setQna_lev(0);
		qnaBoardDTO.setQna_seq(0);
		qnaBoardDAO.insertQnaBoard(qnaBoardDTO);
	}

	@Override
	public List<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO) {
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return qnaBoardDAO.getQnaBoardList(pageDTO);
	}

	@Override
	public int getQnaBoardCount() {
		return qnaBoardDAO.getQnaBoardCount();
	}

	@Override
	public QnaBoardDTO getQnaBoard(int qna_idx) {
		return qnaBoardDAO.getQnaBoard(qna_idx);
	}

	@Override
	public String getQnaPass(int qna_idx) {
		return qnaBoardDAO.getQnaPass(qna_idx);
	}

	@Override
	public void updateQnaBoard(QnaBoardDTO qnaBoardDTO) {
		qnaBoardDAO.updateQnaBoard(qnaBoardDTO);
	}
	
	@Override
	   public void deleteQnaBoard(int qna_idx) {
	      System.out.println("QnaBoardServiceImpl - deleteQnaBoard");
	      qnaBoardDAO.deleteQnaBoard(qna_idx);
	   }

	@Override
	public void insertQnaReply(QnaBoardDTO qnaBoardDTO) {
		qnaBoardDTO.setQna_date(new Timestamp(System.currentTimeMillis()));
		qnaBoardDTO.setQna_req(qnaBoardDTO.getQna_idx());
		qnaBoardDTO.setQna_lev(qnaBoardDTO.getQna_lev()+1);
		qnaBoardDTO.setQna_seq(qnaBoardDTO.getQna_seq()+1);
		qnaBoardDAO.insertQnaReply(qnaBoardDTO);
		
	}
	
	
	
}
