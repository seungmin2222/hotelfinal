package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.RoomDAO;
import com.itwillbs.dao.RoomUsageInfoDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.RoomInfoDTO;
import com.itwillbs.domain.StateDTO;

@Service
public class RoomUsageInfoServiceImpl implements RoomUsageInfoService {
	
	//객체생성
	@Inject 
	private RoomUsageInfoDAO roomUsageInfoDAO;

	@Override
	public List<ReservationDTO> todayUser(String day) {
		System.out.println("RoomUsageInfoServiceImpl - todayUser");
		return roomUsageInfoDAO.getTodayUser(day);
		
	}

	@Override
	public ReservationDTO getReservation(String code) {
		System.out.println("RoomUsageInfoServiceImpl - getReservation");
		return roomUsageInfoDAO.getReservation(code);
	}

	@Override
	public void setDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoServiceImpl - setDB");
		roomUsageInfoDAO.setDB(stateDTO);
	}

	@Override
	public List<StateDTO> checkDay(String day) {
		System.out.println("RoomUsageInfoServiceImpl - checkDay");
		return roomUsageInfoDAO.checkDay(day);
	}

	@Override
	public List<StateDTO> doCheckIn() {
		System.out.println("RoomUsageInfoServiceImpl - doCheckIn");
		return roomUsageInfoDAO.doCheckIn();
	}

	@Override
	public List<StateDTO> doNotCheckIn() {
		System.out.println("RoomUsageInfoServiceImpl - doNotCheckIn");
		return roomUsageInfoDAO.doNotCheckIn();
	}

	@Override
	public MemberDTO getName(MemberDTO memberDTO) {
		System.out.println("RoomUsageInfoServiceImpl - setName");
		return roomUsageInfoDAO.getName(memberDTO);
	}

	@Override
	public void addDBname(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoServiceImpl - addDBname");
		roomUsageInfoDAO.addDBname(stateDTO);
	}

	@Override
	public RoomInfoDTO getRoomInfo(String num) {
		System.out.println("RoomUsageInfoServiceImpl - getRoomInfo");
		return roomUsageInfoDAO.getRoomInfo(num);
	}

	@Override
	public void assignedRoomAndupdateStateDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoServiceImpl - assignedRoomAndupdateStateDB");
		roomUsageInfoDAO.assignedRoomAndupdateStateDB(stateDTO); 
	}

	@Override
	public StateDTO forUpdateRoomInfoToGetStateDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoServiceImpl - forUpdateRoomInfoToGetStateDB");
		return roomUsageInfoDAO.forUpdateRoomInfoToGetStateDB(stateDTO);
	}

	@Override
	public void assignedRoomAndupdateRoomInfoDB(RoomInfoDTO roomInfoDTO) {
		System.out.println("RoomUsageInfoServiceImpl - assignedRoomAndupdateRoomInfoDB");
		roomUsageInfoDAO.assignedRoomAndupdateRoomInfoDB(roomInfoDTO); 
		
	}

	@Override
	public void RoomChangeAndUpdateStateDB(String roomNum) {
		System.out.println("RoomUsageInfoServiceImpl - RoomChangeAndUpdateStateDB");
		roomUsageInfoDAO.RoomChangeAndUpdateStateDB(roomNum); 
	}

	@Override
	public void RoomChangeAndUpdateRoomInfoDB(String roomNum) {
		System.out.println("RoomUsageInfoServiceImpl - RoomChangeAndUpdateRoomInfoDB");
		roomUsageInfoDAO.RoomChangeAndUpdateRoomInfoDB(roomNum); 
	}

	@Override
	public List<RoomInfoDTO> getRoomInfo() {
		System.out.println("RoomUsageInfoServiceImpl - getRoomInfo");
		return roomUsageInfoDAO.getRoomInfo();
	}

	@Override
	public List<RoomInfoDTO> getAllRoomInfo() {
		System.out.println("RoomUsageInfoServiceImpl - getAllRoomInfo");
		return roomUsageInfoDAO.getAllRoomInfo();
	}

	@Override
	public void forUpdateRoomInfoDBTocheckout(String day) {
		System.out.println("RoomUsageInfoServiceImpl - forUpdateRoomInfoDBTocheckout");
		roomUsageInfoDAO.forUpdateRoomInfoDBTocheckout(day);
	}

	@Override
	public void forDeleteStateDBTocheckout(String day) {
		System.out.println("RoomUsageInfoServiceImpl - forDeleteStateDBTocheckout");
		roomUsageInfoDAO.forDeleteStateDBTocheckout(day);
	}


	
}