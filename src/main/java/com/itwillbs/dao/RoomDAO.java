package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;

public interface RoomDAO {

	public void insertRoom(RoomDTO roomDTO);

	public Integer getMaxNum();

	public List<RoomDTO> getRoomList(PageDTO pageDTO);

	public Integer getRoomCount();

	public RoomDTO getRoom(int room_idx);

	public void updateRoom(RoomDTO roomDTO);

	public void deleteRoom(int room_idx);

}
