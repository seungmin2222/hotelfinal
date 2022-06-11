package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.RoomInfoDTO;
import com.itwillbs.domain.StateDTO;

@Repository
public class RoomUsageInfoDAOImpl implements RoomUsageInfoDAO {
	
	// 객체생성
	@Inject SqlSession sqlSession;
	
	// mapper의 namespace 불러오기
	private static final String namespace = "com.itwillbs.mapper.roomUsageInfoMapper";

	@Override
	public List<ReservationDTO> getTodayUser(String day) {
		System.out.println("RoomUsageInfoDAOImpl - getTodayUser()");
		return sqlSession.selectList(namespace + ".getTodayUser", day);
	}

	@Override
	public ReservationDTO getReservation(String code) {
		System.out.println("RoomUsageInfoDAOImpl - getReservation()");
		return sqlSession.selectOne(namespace + ".getReservation", code);
	}

	@Override
	public void setDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoDAOImpl - setDB()");
		sqlSession.insert(namespace + ".setDB", stateDTO);
	}

	@Override
	public List<StateDTO> checkDay(String day) {
		System.out.println("RoomUsageInfoDAOImpl - checkDay()");
		return sqlSession.selectList(namespace + ".checkDay", day);
	}

	@Override
	public List<StateDTO> doCheckIn() {
		System.out.println("RoomUsageInfoDAOImpl - doCheckIn()");
		return sqlSession.selectList(namespace + ".doCheckIn");
	}

	@Override
	public List<StateDTO> doNotCheckIn() {
		System.out.println("RoomUsageInfoDAOImpl - doNotCheckIn()");
		return sqlSession.selectList(namespace + ".doNotCheckIn");
	}

	@Override
	public MemberDTO getName(MemberDTO memberDTO) {
		System.out.println("RoomUsageInfoDAOImpl - getName()");
		return sqlSession.selectOne(namespace + ".getName", memberDTO);
	}

	@Override
	public void addDBname(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoDAOImpl - addDBname()");
		sqlSession.update(namespace + ".addDBname", stateDTO);
	}

	@Override
	public RoomInfoDTO getRoomInfo(String num) {
		System.out.println("RoomUsageInfoDAOImpl - getRoomInfo()");
		return sqlSession.selectOne(namespace + ".getRoomInfo", num);
	}

	@Override
	public void assignedRoomAndupdateStateDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoDAOImpl - assignedRoomAndupdateStateDB()");
		sqlSession.update(namespace + ".assignedRoomAndupdateStateDB", stateDTO);
	}

	@Override
	public StateDTO forUpdateRoomInfoToGetStateDB(StateDTO stateDTO) {
		System.out.println("RoomUsageInfoDAOImpl - forUpdateRoomInfoToGetStateDB()");
		return sqlSession.selectOne(namespace + ".forUpdateRoomInfoToGetStateDB", stateDTO);
	}

	@Override
	public void assignedRoomAndupdateRoomInfoDB(RoomInfoDTO roomInfoDTO) {
		System.out.println("RoomUsageInfoDAOImpl - assignedRoomAndupdateRoomInfoDB()");
		sqlSession.update(namespace + ".assignedRoomAndupdateRoomInfoDB", roomInfoDTO);
		
	}

	@Override
	public void RoomChangeAndUpdateStateDB(String roomNum) {
		System.out.println("RoomUsageInfoDAOImpl - RoomChangeAndUpdateStateDB()");
		sqlSession.update(namespace + ".RoomChangeAndUpdateStateDB", roomNum);
		
	}

	@Override
	public void RoomChangeAndUpdateRoomInfoDB(String roomNum) {
		System.out.println("RoomUsageInfoDAOImpl - RoomChangeAndUpdateRoomInfoDB()");
		sqlSession.update(namespace + ".RoomChangeAndUpdateRoomInfoDB", roomNum);
		
	}

	@Override
	public List<RoomInfoDTO> getRoomInfo() {
		System.out.println("RoomUsageInfoDAOImpl - getRoomInfo()");
		return sqlSession.selectList(namespace + ".getRoomInfoList");
	}

	@Override
	public List<RoomInfoDTO> getAllRoomInfo() {
		System.out.println("RoomUsageInfoDAOImpl - getAllRoomInfo()");
		return sqlSession.selectList(namespace + ".getAllRoomInfo");
	}

	@Override
	public void forUpdateRoomInfoDBTocheckout(String day) {
		System.out.println("RoomUsageInfoDAOImpl - forUpdateRoomInfoDBTocheckout()");
		sqlSession.update(namespace + ".forUpdateRoomInfoDBTocheckout",day);
	}

	@Override
	public void forDeleteStateDBTocheckout(String day) {
		System.out.println("RoomUsageInfoDAOImpl - forDeleteStateDBTocheckout()");
		sqlSession.delete(namespace + ".forDeleteStateDBTocheckout",day);
		
	}


	
}
