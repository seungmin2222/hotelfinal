package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;

public interface ReservationDAO {
	
	public void insertReservation(ReservationDTO reservationDTO);
	
	public MemberDTO getMemberDTO(String member_id);

	public void deleteReservation(ReservationDTO reservationDTO);

	public ReservationDTO getReservationInfo(ReservationDTO reservationDTO);

	public List<ReservationDTO> getBoardList(PageDTO pageDTO);

	public int getBoardCount();

	public void updateTotalPrice(MemberDTO memberDTO2);

	public List<ReservationDTO> getReservationList();





}
