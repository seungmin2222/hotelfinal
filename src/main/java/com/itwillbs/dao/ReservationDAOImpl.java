package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mapper.ReservationMapper";

	@Override
	public void insertReservation(ReservationDTO reservationDTO) {
		System.out.println("ReservationDAOImpl - insertReservation()");
		sqlSession.insert(namespace + ".insertReservation", reservationDTO);
	}
	@Override
	public MemberDTO getMemberDTO(String member_id) {
		System.out.println("ReservationDAOImpl - getMemberDTO");
		return sqlSession.selectOne(namespace+".getMemberDTO",member_id);
	}
	@Override
	public void deleteReservation(ReservationDTO reservationDTO) {
		System.out.println("ReservationDAOImpl - deleteReservation()");
		sqlSession.delete(namespace + "deleteReservation", reservationDTO);
	}
	@Override
	public ReservationDTO getReservationInfo(ReservationDTO reservationDTO) {
		System.out.println("ReservationDAOImpl - getReservationInfo()");
		return sqlSession.selectOne(namespace + ".getReservationInfo", reservationDTO);
	}
	@Override
	public List<ReservationDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}
	@Override
	public int getBoardCount() {
		
		return sqlSession.selectOne(namespace+".getBoardCount");
	}
	@Override
	public void updateTotalPrice(MemberDTO memberDTO2) {
		sqlSession.update(namespace+".updateTotalPrice", memberDTO2);
		
	}
	@Override
	public List<ReservationDTO> getReservationList() {
		return sqlSession.selectList(namespace+".getReservationList");
	}
	
	
	
}
