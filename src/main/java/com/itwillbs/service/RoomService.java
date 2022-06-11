package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;

public interface RoomService {
	
	// 룸 게시물 작성
	public void insertRoom(RoomDTO roomDTO);
	
	// 룸컨텐츠 리스트 띄우기
	public List<RoomDTO> getRoomList(PageDTO pageDTO);

	// 룸컨텐츠 카운트
	public Integer getRoomCount();

	// 룸컨텐츠 클릭시 해당 객실정보들고와서 룸게시물보기
	public RoomDTO getRoom(int room_idx);

	// 룸컨텐츠 수정
	public void updateRoom(RoomDTO roomDTO);

	public void deleteRoom(int room_idx);

}
