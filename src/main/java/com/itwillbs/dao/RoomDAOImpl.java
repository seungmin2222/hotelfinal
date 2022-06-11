package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;

@Repository
public class RoomDAOImpl implements RoomDAO {
	
	// 객체생성
	@Inject SqlSession sqlSession;
	
	// mapper의 namespace 불러오기
	private static final String namespace = "com.itwillbs.mapper.RoomMapper";

	// 객실 게시물 작성
	@Override
	public void insertRoom(RoomDTO roomDTO) {
		System.out.println("RoomDAOImpl - insertRoom()");
		
		sqlSession.insert(namespace + ".insertRoom", roomDTO);
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("RoomDAOImpl - getMaxNum()");
		
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<RoomDTO> getRoomList(PageDTO pageDTO) {
		System.out.println("RoomDAOImpl - getRoomList()");
		return sqlSession.selectList(namespace + ".getRoomList", pageDTO);
	}

	@Override
	public Integer getRoomCount() {
		System.out.println("RoomDAOImpl - getRoomCount()");
		return sqlSession.selectOne(namespace + ".getRoomCount");
	}

	@Override
	public RoomDTO getRoom(int room_idx) {
		System.out.println("RoomDAOImpl - getRoom()");
		return sqlSession.selectOne(namespace + ".getRoom", room_idx);
	}

	@Override
	public void updateRoom(RoomDTO roomDTO) {
		System.out.println("RoomDAOImpl - updateRoom()");
		sqlSession.update(namespace + ".updateRoom", roomDTO);
	}

	@Override
	public void deleteRoom(int room_idx) {
		System.out.println("RoomDAOImpl - deleteRoom()");
		sqlSession.delete(namespace + ".deleteRoom", room_idx);
	}
	
	
	
}
