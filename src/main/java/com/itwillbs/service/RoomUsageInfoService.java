package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.RoomInfoDTO;
import com.itwillbs.domain.StateDTO;

public interface RoomUsageInfoService {

	public List<ReservationDTO> todayUser(String day);

	public ReservationDTO getReservation(String code);

	public void setDB(StateDTO stateDTO);

	public List<StateDTO> checkDay(String day);

	public List<StateDTO> doCheckIn();

	public List<StateDTO> doNotCheckIn();

	public MemberDTO getName(MemberDTO memberDTO);

	public void addDBname(StateDTO stateDTO);

	public RoomInfoDTO getRoomInfo(String num);

	public void assignedRoomAndupdateStateDB(StateDTO stateDTO);

	public StateDTO forUpdateRoomInfoToGetStateDB(StateDTO stateDTO);

	public void assignedRoomAndupdateRoomInfoDB(RoomInfoDTO roomInfoDTO);

	public void RoomChangeAndUpdateStateDB(String roomNum);

	public void RoomChangeAndUpdateRoomInfoDB(String roomNum);

	public List<RoomInfoDTO> getRoomInfo();

	public List<RoomInfoDTO> getAllRoomInfo();

	public void forUpdateRoomInfoDBTocheckout(String day);

	public void forDeleteStateDBTocheckout(String day);



}
