package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.RoomDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;

@Service
public class RoomServiceImpl implements RoomService {
	
	//객체생성
	@Inject
	private RoomDAO roomDAO;
	
	// 객실 게시물 작성
	@Override
	public void insertRoom(RoomDTO roomDTO) {
		System.out.println("RoomServiceImpl - insertRoom()");

//		======================글 작성시 들고가야하는 값======================
//		room_name, room_price, room_guest, room_size, room_bedType
//		room_view, room_type, room_checkinout_time, room_infotext, room_file
//		=====================================================================
		
		//게시물의 글이 있는지 여부판단 idx지정해줄거임
		if(roomDAO.getMaxNum() == null) { // 글이 없는경우 inx = 1
			roomDTO.setRoom_idx(1);
		} else { // 글이 있는경우 MAX(idx) + 1
			roomDTO.setRoom_idx(roomDAO.getMaxNum() + 1);
		}
		roomDAO.insertRoom(roomDTO);
		
	}

	@Override
	public List<RoomDTO> getRoomList(PageDTO pageDTO) {
		System.out.println("RoomServiceImpl - getRoomList()");
		
		pageDTO.setCurrentPage(Integer.parseInt(pageDTO.getPageNum()));
		pageDTO.setStartRow((pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1);
		pageDTO.setEndRow(pageDTO.getStartRow() + pageDTO.getPageSize()-1);
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return roomDAO.getRoomList(pageDTO);
	}

	@Override
	public Integer getRoomCount() {
		System.out.println("RoomServiceImpl - getRoomCount()");
		return  roomDAO.getRoomCount();
	}

	@Override
	public RoomDTO getRoom(int room_idx) {
		System.out.println("RoomServiceImpl - getRoom()");
		return roomDAO.getRoom(room_idx);
	}

	@Override
	public void updateRoom(RoomDTO roomDTO) {
		System.out.println("RoomServiceImpl - updateRoom()");
		roomDAO.updateRoom(roomDTO);
	}

	@Override
	public void deleteRoom(int room_idx) {
		System.out.println("RoomServiceImpl - deleteRoom()");
		roomDAO.deleteRoom(room_idx);
	}
}
