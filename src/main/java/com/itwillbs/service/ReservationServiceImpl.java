package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReservationDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	private ReservationDAO reservationDAO;

	@Override
	public void insertReservation(ReservationDTO reservationDTO) {
		System.out.println("ReservationService - insertReservation()");
		
		reservationDAO.insertReservation(reservationDTO);
		
	}
	
	@Override
	public MemberDTO getMemberDTO(String member_id) {
		System.out.println("SubServiceImpl - getMemberDTO");
		return reservationDAO.getMemberDTO(member_id);
	}

	@Override
	public void deleteReservation(ReservationDTO reservationDTO) {
		System.out.println("ReservationServiceImpl - deleteReservation()");
		reservationDAO.deleteReservation(reservationDTO);
	}

	@Override
	public ReservationDTO getReservationInfo(ReservationDTO reservationDTO) {
		System.out.println("ReservationServiceImpl - getReservationInfo()");
		reservationDAO.getReservationInfo(reservationDTO);
		return reservationDAO.getReservationInfo(reservationDTO);
		
	}

	@Override
	public List<ReservationDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ReservationServiceImpl - getBoardList");
		// pageSize pageNum 가지고 감
		// currentPage startRow endRow 구하기
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow()+pageDTO.getPageSize()-1);
		
		// 디비에서 #{startRow}-1
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return reservationDAO.getBoardList(pageDTO);
		
	}

	@Override
	public int getBoardCount() {
		
		return reservationDAO.getBoardCount();
	}

	@Override
	public void updateTotalPrice(MemberDTO memberDTO2) {
		reservationDAO.updateTotalPrice(memberDTO2);
		
	}

	@Override
	public List<ReservationDTO> getReservationList() {
		return reservationDAO.getReservationList();
	}



}

