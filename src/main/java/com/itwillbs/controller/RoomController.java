package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.service.RoomService;

@Controller
public class RoomController {
	// 객체생성
	@Inject
	private RoomService roomService;

	// 업로드 경로
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//-------------------------------------관리자-----------------------------------------------
	
	// 메뉴 > 객실관리 (등록된 객실리스트도 보여주기)
	@RequestMapping(value = "/admin/adminRoom", method = RequestMethod.GET)
	public String adminRoom(HttpServletRequest request, Model model) {
		System.out.println("RoomController - adminRoom()");
		// 데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(50);
		if(request.getParameter("pageNum") == null) {
			// 페이지없을경우 pageNum = 1 설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum")); 
		}
		List<RoomDTO> roomList = roomService.getRoomList(pageDTO);
		
		pageDTO.setCount(roomService.getRoomCount());
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/adminRoom";
	}
	
	
	// 객실관리 > 글쓰기
	@RequestMapping(value = "/admin/adminRoomWrite", method = RequestMethod.GET)
	public String adminRoomWrite() {
		System.out.println("RoomController - adminRoomWrite()");
		return "admin/adminRoomWrite";
	}
	
	// 객실관리 > 글쓰기버튼클릭 (객실 게시물 작성)
	@RequestMapping(value = "/admin/adminRoomWritePro", method = RequestMethod.POST)
	public String adminRoomWritePro(HttpServletRequest request, MultipartFile room_file) throws Exception{
		System.out.println("RoomController - adminRoomWritPro()");
		
		// 디비 insert
		// 원본 첨부파일 file.getBytes();
		
		// 첨부파일 > 업로드 폴더 파일이름 랜덤문자_파일이름(file.getOriginalFilename();) 복사
		// 랜덤 파일이름
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + room_file.getOriginalFilename();
		// upload폴더경로 xml에서 가져옴 + 파일이름
		File uploadFile = new File(uploadPath, fileName);
		//파일복사
		FileCopyUtils.copy(room_file.getBytes(), uploadFile);
		
		
		RoomDTO roomDTO = new RoomDTO();
		roomDTO.setRoom_name(request.getParameter("room_name"));
		roomDTO.setRoom_price(request.getParameter("room_price"));
		roomDTO.setRoom_guest(request.getParameter("room_guest"));
		roomDTO.setRoom_size(request.getParameter("room_size"));
		roomDTO.setRoom_bedType(request.getParameter("room_bedType"));
		roomDTO.setRoom_view(request.getParameter("room_view"));
		roomDTO.setRoom_type(request.getParameter("room_type"));
		roomDTO.setRoom_checkinout_time(request.getParameter("room_checkinout_time"));
		roomDTO.setRoom_infotext(request.getParameter("room_infotext"));
		// file
		roomDTO.setRoom_file(fileName);
		

		System.out.println("객실이름 : " + roomDTO.getRoom_name());
		System.out.println("객실가격 : " + roomDTO.getRoom_price());
		System.out.println("투숙가능한인원 : " + roomDTO.getRoom_guest());
		System.out.println("방크기 : " + roomDTO.getRoom_size());
		System.out.println("침대타입 : " + roomDTO.getRoom_bedType());
		System.out.println("객실전망 : " + roomDTO.getRoom_view());
		System.out.println("객실구성 : " + roomDTO.getRoom_type());
		System.out.println("체크인아웃 : " + roomDTO.getRoom_checkinout_time());
		System.out.println("객실소개 : " + roomDTO.getRoom_infotext());
		System.out.println("객실이미지 : " + roomDTO.getRoom_file());
		
		roomService.insertRoom(roomDTO);
		
		return "redirect:/admin/adminRoom";
	}
	
	// 메뉴 > 객실관리 > 객실클릭시 컨텐츠보기
	@RequestMapping(value = "/admin/adminRoomContent", method = RequestMethod.GET)
	public String adminRoomContent(HttpServletRequest request, Model model) {
		System.out.println("RoomController - adminRoomContent()");
		
		int room_idx = Integer.parseInt(request.getParameter("room_idx"));
		
		RoomDTO roomDTO = roomService.getRoom(room_idx);
		
		model.addAttribute("roomDTO", roomDTO);
		
		return "admin/adminRoomContent";
	}
	
	// 클릭한 객실정보 들고와서 수정하기
	@RequestMapping(value = "/admin/adminRoomUpdate", method = RequestMethod.GET)
	public String adminRoomUpdate(HttpServletRequest request, Model model) {
		System.out.println("RoomController - adminRoomUpdate()");
		
		int room_idx = Integer.parseInt(request.getParameter("room_idx"));
		
		RoomDTO roomDTO = roomService.getRoom(room_idx);
		
		model.addAttribute("roomDTO", roomDTO);
		
		return "admin/adminRoomUpdate";
	}
	
	
	// 객실정보 수정후 adminRoom 으로 이동
	@RequestMapping(value = "/admin/adminRoomUpdatePro", method = RequestMethod.POST)
	public String adminRoomUpdatePro(HttpServletRequest request, MultipartFile room_file) throws Exception {
		System.out.println("RoomController - adminRoomUpdatePro()");
		
		// 첨부파일 > 업로드 폴더 파일이름 랜덤문자_파일이름(file.getOriginalFilename();) 복사
		// 랜덤 파일이름
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + room_file.getOriginalFilename();
		// upload폴더경로 xml에서 가져옴 + 파일이름
		File uploadFile = new File(uploadPath, fileName);
		//파일복사
		FileCopyUtils.copy(room_file.getBytes(), uploadFile);
		

		RoomDTO roomDTO = new RoomDTO();
		roomDTO.setRoom_idx(Integer.parseInt(request.getParameter("room_idx")));
		roomDTO.setRoom_name(request.getParameter("room_name"));
		roomDTO.setRoom_price(request.getParameter("room_price"));
		roomDTO.setRoom_guest(request.getParameter("room_guest"));
		roomDTO.setRoom_size(request.getParameter("room_size"));
		roomDTO.setRoom_bedType(request.getParameter("room_bedType"));
		roomDTO.setRoom_view(request.getParameter("room_view"));
		roomDTO.setRoom_type(request.getParameter("room_type"));
		roomDTO.setRoom_checkinout_time(request.getParameter("room_checkinout_time"));
		roomDTO.setRoom_infotext(request.getParameter("room_infotext"));
		// file
		roomDTO.setRoom_file(fileName);
		

		System.out.println("idx : " + roomDTO.getRoom_idx());
		System.out.println("객실이름 : " + roomDTO.getRoom_name());
		System.out.println("객실가격 : " + roomDTO.getRoom_price());
		System.out.println("투숙가능한인원 : " + roomDTO.getRoom_guest());
		System.out.println("방크기 : " + roomDTO.getRoom_size());
		System.out.println("침대타입 : " + roomDTO.getRoom_bedType());
		System.out.println("객실전망 : " + roomDTO.getRoom_view());
		System.out.println("객실구성 : " + roomDTO.getRoom_type());
		System.out.println("체크인아웃 : " + roomDTO.getRoom_checkinout_time());
		System.out.println("객실소개 : " + roomDTO.getRoom_infotext());
		System.out.println("객실이미지 : " + roomDTO.getRoom_file());
		
		//DB작업 > UPDATE
		roomService.updateRoom(roomDTO);
		
		return "redirect:/admin/adminRoom";
	}
	
	
	// 객실 게시물 삭제
	@RequestMapping(value = "/admin/adminRoomDeletePro", method = RequestMethod.GET)
	public String adminRoomDeletePro(HttpServletRequest request, Model model) {
		System.out.println("RoomController - adminRoomDeletePro()");
		
		int room_idx = Integer.parseInt(request.getParameter("room_idx"));
		
		roomService.deleteRoom(room_idx);
		
		
		return "redirect:/admin/adminRoom";
	}
	
	//-------------------------------------고객-----------------------------------------------
	@RequestMapping(value = "/sub/rooms", method = RequestMethod.GET)
	public String rooms(HttpServletRequest request, Model model) {
		System.out.println("RoomController - rooms()");
		
		//데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(50);
		if(request.getParameter("pageNum") == null) {
			// 페이지 없을경우 pageNum = 1 설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<RoomDTO> roomList = roomService.getRoomList(pageDTO);
		
		pageDTO.setCount(roomService.getRoomCount());
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "sub/rooms";
	}
	
	// 고객페이지 > 객실상세
	@RequestMapping(value = "/sub/roomDetail", method = RequestMethod.GET)
	public String roomDetail(HttpServletRequest request, Model model) {
		System.out.println("RoomController - roomDetail()");
		
		int room_idx = Integer.parseInt(request.getParameter("room_idx"));
		
		RoomDTO roomDTO = roomService.getRoom(room_idx);
		
		model.addAttribute("roomDTO", roomDTO);
		
		return "sub/room_detail";
	}
	
		
		
}
