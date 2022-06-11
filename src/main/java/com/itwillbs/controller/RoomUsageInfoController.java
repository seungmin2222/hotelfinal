package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;

import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.RoomInfoDTO;
import com.itwillbs.domain.StateDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ReservationService;
import com.itwillbs.service.RoomUsageInfoService;

@Controller
public class RoomUsageInfoController {

	@Inject
	private RoomUsageInfoService roomUsageInfoService;
	@Inject
	private MemberService memberService;
	@Inject
	private ReservationService reservationService;


	@RequestMapping(value = "/admin/RoomUsageInfo", method = RequestMethod.GET)
	public String UsageInfo(HttpServletRequest request, Model model) {
		System.out.println("usageInfo");
		String num = request.getParameter("num");
		System.out.println(num);
		RoomInfoDTO roomInfoDTO = new RoomInfoDTO();
		roomInfoDTO.setRoom_number(num);
		
		roomInfoDTO=roomUsageInfoService.getRoomInfo(num);
		
		model.addAttribute("roomInfo", roomInfoDTO);
		
		List<StateDTO> checkinUser0 = roomUsageInfoService.doNotCheckIn();
		model.addAttribute("checkinUser0", checkinUser0);
		

		return "admin/RoomUsageInfo";
	}
	
	@RequestMapping(value = "/admin/RoomUsageInfoPro", method = RequestMethod.GET)
	public String UsageInfoPro(HttpServletRequest request, Model model) {
		System.out.println("usageInfoPro");
		String roomName = request.getParameter("room_name");
		String roomNum = request.getParameter("room_number");
		String bookNumber = request.getParameter("book_number");
		String etc = request.getParameter("etc");
		System.out.println(roomName); System.out.println(roomNum); System.out.println(bookNumber); System.out.println(etc);
		
		// 여기까지 배정 객실 번호, 배정 객실 종류, 배정 고객, 기타사항 값을 받아옴
		// 이 값들을 활용하여 stateDB 최신화, roomInfoDB 최신화 실시
		
// state DB에 배정 객실, 배정 객실 호수, 체크인 상태, 기타사항 업데이트
		// stateDB는 객실을 예약한 고객들중 현재날짜와 checkin 날짜가 같으면 DB에 등록이 됨.
		// 현재 날짜와 checkout 날짜가 같으면 DB에서 삭제 할 예정.
		// 이 주소로 매핑되어 UsageInfoPro메서드가 실행되는 선행조건중 하나는 stateDB에서 객실이 배정되어 있지 않은 고객들이어야 함.
		// 이 메서드는 객실이 배정되어 있지 않은 고객들에게 stateDB의 객실과, 객실 이름을 등록해주고 입실여부를 완료(1)로 바꿔야함.
		// state DB에서 고유한 값을 가지는 것은 book_number(예약번호) 이므로, 이 값을 활용하여 DB 업데이트 진행.
		
		StateDTO stateDTO = new StateDTO(); // stateDTO의 객체를 생성해준다.
		stateDTO.setBook_number(bookNumber);
		stateDTO.setAssigned_room_name(roomName); 
		stateDTO.setAssigned_room(roomNum);
		stateDTO.setCheckin_state(1); // 이 구문은 딱히 안해줘도 됨.
		stateDTO.setEtc(etc); 
		// stateDTO의 객체에 배정 객실 및 객실 번호, 입실여부 판별번호, 기타사항을 저장함.
		// 아래 코드는 업데이트 매퍼로 연결되어 있음. 실행되면 방 배정이 됨.
		roomUsageInfoService.assignedRoomAndupdateStateDB(stateDTO);
		
// roomInfo DB에 고객 이름, 체크아웃, 체크인, 기타 사항 업데이트
		// roomInfoDB는 객실의 현재상태를 나타냄.
		// 객실을 배정해주면 객실 번호에 따라 고객들의 정보가 저장되게 할 것임.
		// 객실 번호를 지정하여 데이터를 저장할 것임.
		// 이 메서드 안에서 고객 이름, 체크아웃, 체크인 값을 바로 가져올 수 없으므로 stateDB의 book_number(예약번호)를 활용하여 값을 가져온다.
		
		// 아래 코드는 book_number(예약번호)가 저장된 stateDTO 객체를 활용하여 예약번호와 일치하는 데이터의 값을 가져와
		// stateDTO의 객체에 덮어씌우는 것임
		stateDTO = roomUsageInfoService.forUpdateRoomInfoToGetStateDB(stateDTO);
		System.out.println(stateDTO.getBook_user_name()); System.out.println(stateDTO.getBook_checkin()); 
		System.out.println(stateDTO.getBook_checkout()); System.out.println(stateDTO.getEtc());
		
		
		RoomInfoDTO roomInfoDTO = new RoomInfoDTO();
		roomInfoDTO.setRoom_number(roomNum);
		roomInfoDTO.setRoom_user(stateDTO.getBook_user_name());
		roomInfoDTO.setRoom_checkin(stateDTO.getBook_checkin());
		roomInfoDTO.setRoom_checkout(stateDTO.getBook_checkout());
		roomInfoDTO.setRoom_etc(stateDTO.getEtc());
		
		roomUsageInfoService.assignedRoomAndupdateRoomInfoDB(roomInfoDTO);
		
// 체크아웃 날짜 도달시 update 사용하여 객실, 객실이름 제외하고 null값 처리
		return "admin/RoomUsageInfo"; // 여기는 다른 방법 구상.
	}
	
	@RequestMapping(value = "/admin/roomChange", method = RequestMethod.GET)
	public String roomChange(HttpServletRequest request) {
		System.out.println("roomChange");
		String roomNum = request.getParameter("room_number");
		
		roomUsageInfoService.RoomChangeAndUpdateStateDB(roomNum);
		roomUsageInfoService.RoomChangeAndUpdateRoomInfoDB(roomNum); 
		
		return"admin/RoomUsageInfo";
	}
	

	@RequestMapping(value = "/admin/adminCheckTheState", method = RequestMethod.GET)
	public String dbSetting(Model model) {
		System.out.println("adminCheckTheState");
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String day = simpleDateFormat.format(now); // 오늘 날짜를 데이터 변수에 저장
		StateDTO stateDTO = new StateDTO();

		List<ReservationDTO> todayCheckInUser = roomUsageInfoService.todayUser(day); // reservation DB에서 금일 입실예정인 DB 리스트를 가져옴
		List<StateDTO> checkinUser = roomUsageInfoService.checkDay(day); // state DB에서 금일 입실예정인 DB 리스트를 가져옴
		roomUsageInfoService.forUpdateRoomInfoDBTocheckout(day);
		roomUsageInfoService.forDeleteStateDBTocheckout(day);
		System.out.println(day);
		
		
		List<RoomInfoDTO> roominfoDTOList = roomUsageInfoService.getAllRoomInfo();
		model.addAttribute("roominfoDTOList", roominfoDTOList);
		
		MemberDTO memberDTO = new MemberDTO();
		System.out.println(checkinUser.toString());
		if (checkinUser.toString().equals("[]")) { // checkinUser 값이 null이라면
			for (int i = 0; i < todayCheckInUser.size(); i++) {

				System.out.println(todayCheckInUser.get(i).getBook_user());

				stateDTO.setBook_checkin(todayCheckInUser.get(i).getBook_checkin());
				stateDTO.setBook_checkout(todayCheckInUser.get(i).getBook_checkout());
				stateDTO.setBook_room_name(todayCheckInUser.get(i).getBook_room_name());
				stateDTO.setBook_number(todayCheckInUser.get(i).getBook_number());
				stateDTO.setBook_user_id(todayCheckInUser.get(i).getBook_user());
				System.out.println(stateDTO.getBook_user_id());
				roomUsageInfoService.setDB(stateDTO);
				// 금일 입실 예정 회원의 체크인, 체크아웃, 객실이름, 예약번호, ID 정보를 stateDTO에 저장함. 
				// 금일 입실 예정 회원의 이름은 어떻게 가져올 것인가? => state DB와 member DB의 id값은 고유한 id이므로, id값을 비교하고 member DB에서 name 값을 가져온다. 
				// 즉, stateDTO 객체에 저장된 id값을 memberDTO 객체에도 같은 id값으로 저장 후, 
				// memberDTO 객체의 바로 윗줄의 과정에서 저장한 id(member_id)를 활용하여 member DB에 있는 member_name을 가져올 것이다. 
				
				memberDTO.setMember_id(stateDTO.getBook_user_id()); // stateDTO 객체에 저장된 book_user(id값)을 memberDTO 객체의 Member_id(id)값으로 저장한다. 
				memberDTO = roomUsageInfoService.getName(memberDTO); // getName(memberDTO)는 괄호속에 있는 memberDTO 객체에 저장된 고객의 id값에 대응되는
																	 // member DB의 데이터를 가져올 수 있는 메서드이다.
				System.out.println(memberDTO.getMember_name());
				stateDTO.setBook_user_name(memberDTO.getMember_name());
				// stateDTO 객체에 금일 입실 예정 회원의 이름을 저장함.
				// for문 내의 todayCheckInUser.get(i).getBook_XXX() 코드에서 변수 i가 증가 함에따라 stateDTO 객체에 저장되는 값이 달라진다.
				// memberDTO.setMember_id(stateDTO.getBook_user_id());에서는 stateDTO 객체를 직접 사용하여 변수 i의 직접적인 영향없이
				// for문 동작 중에도 값이 바뀌어지고 같은 원리로 stateDTO.setBook_user_name(memberDTO.getMember_name()); 값도 바뀌게 된다.
				roomUsageInfoService.addDBname(stateDTO);
				
				
				
				
			}
		} else {
			for (int h = 0; h < checkinUser.size(); h++) {
				if (checkinUser.get(h).toString().equals(day)) {
					int checking = 0;
					checking = +1;
					System.out.println(checking);
					if (checking == 0) {
						for (int i = 0; i < todayCheckInUser.size(); i++) {
							System.out.println(todayCheckInUser.get(i).getBook_user());

							stateDTO.setBook_checkin(todayCheckInUser.get(i).getBook_checkin());
							stateDTO.setBook_checkout(todayCheckInUser.get(i).getBook_checkout());
							stateDTO.setBook_room_name(todayCheckInUser.get(i).getBook_room_name());
							stateDTO.setBook_number(todayCheckInUser.get(i).getBook_number());
							stateDTO.setBook_user_id(todayCheckInUser.get(i).getBook_user());
							System.out.println(stateDTO.getBook_user_id());

							roomUsageInfoService.setDB(stateDTO);
							
							memberDTO.setMember_id(stateDTO.getBook_user_id()); 
							memberDTO = roomUsageInfoService.getName(memberDTO); 
																				 
							System.out.println(memberDTO.getMember_name());
							stateDTO.setBook_user_name(memberDTO.getMember_name());
							roomUsageInfoService.addDBname(stateDTO);
							


						}
					}
				}
			}
		}


	
		List<StateDTO> checkinUser0 = roomUsageInfoService.doNotCheckIn();
		List<StateDTO> checkinUser1 = roomUsageInfoService.doCheckIn();

		model.addAttribute("todayCheckInUser", todayCheckInUser); // 이건 최초에 기획할때 만든건데 굳이 안넣어도 되는 코드. 일단 놔둠.
		model.addAttribute("AllCheckinUser", checkinUser); // 금일 입실 예정 인원
		model.addAttribute("checkinUser0", checkinUser0); // 금일 방 배정 미완료 인원 
		model.addAttribute("checkinUser1", checkinUser1); // 금일 방 배정 완료 인원 + 방 배정되어있고 이전에 배정된 인원. 

		return "admin/adminCheckTheState";
	}

	@RequestMapping(value = "/admin/userInfo", method = RequestMethod.GET)
	public String userInfo(HttpServletRequest request, Model model) {
		System.out.println("userInfo");
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("code"));

		String user_id = request.getParameter("member_id");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.getMember(user_id);

		String code = request.getParameter("code");
		ReservationDTO reservationDTO = new ReservationDTO();
		reservationDTO = roomUsageInfoService.getReservation(code);

		// 넘겨 받은 code와 member_id를 String으로 변수 선언해줌.
		// reservation 객체를 만들고 code값을 getReservation 파라미터로 넘김
		// getReservation(code) 구문은 reservation DB에서 code가 일치하는 행을 reservationDTO에 저장.
		
		List<RoomInfoDTO> selectRoom = roomUsageInfoService.getRoomInfo();
		System.out.println(selectRoom.get(0).getRoom_number());
		System.out.println(selectRoom);
		// RoomInfoDTO의 객체를 생성, roominfo의 정보를 가져옴.
		
		
		model.addAttribute("selectRoom", selectRoom);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("reservationDTO", reservationDTO);

		return "admin/userInfo";
	}
	
	@RequestMapping(value = "/admin/userInfoPro", method = RequestMethod.GET)
	public String userInfoPro(HttpServletRequest request, Model model) {
		System.out.println("userInfoPro");
		String roomNumber = request.getParameter("assigned_room_number");
		String roomName = request.getParameter("assigned_room_name");
		String bookNumber = request.getParameter("book_number");
		String etc = request.getParameter("etc");
		System.out.println(roomNumber);
		System.out.println(roomName);
		System.out.println(bookNumber); 
		System.out.println(etc); 
		
		StateDTO stateDTO = new StateDTO(); // stateDTO의 객체를 생성해준다.
		stateDTO.setBook_number(bookNumber);
		stateDTO.setAssigned_room_name(roomName); 
		stateDTO.setAssigned_room(roomNumber);
		stateDTO.setCheckin_state(1); // 이 구문은 딱히 안해줘도 됨.
		stateDTO.setEtc(etc); 
		// stateDTO의 객체에 배정 객실 및 객실 번호, 입실여부 판별번호, 기타사항을 저장함.
		// 아래 코드는 업데이트 매퍼로 연결되어 있음. 실행되면 방 배정이 됨.
		roomUsageInfoService.assignedRoomAndupdateStateDB(stateDTO);
		
		// roomInfo DB에 고객 이름, 체크아웃, 체크인, 기타 사항 업데이트
		// roomInfoDB는 객실의 현재상태를 나타냄.
		// 객실을 배정해주면 객실 번호에 따라 고객들의 정보가 저장되게 할 것임.
		// 객실 번호를 지정하여 데이터를 저장할 것임.
		// 이 메서드 안에서 고객 이름, 체크아웃, 체크인 값을 바로 가져올 수 없으므로 stateDB의 book_number(예약번호)를 활용하여 값을 가져온다.
		
		// 아래 코드는 book_number(예약번호)가 저장된 stateDTO 객체를 활용하여 예약번호와 일치하는 데이터의 값을 가져와
		// stateDTO의 객체에 덮어씌우는 것임
		stateDTO = roomUsageInfoService.forUpdateRoomInfoToGetStateDB(stateDTO);
		System.out.println(stateDTO.getBook_user_name()); System.out.println(stateDTO.getBook_checkin()); 
		System.out.println(stateDTO.getBook_checkout()); System.out.println(stateDTO.getEtc());
		
		
		RoomInfoDTO roomInfoDTO = new RoomInfoDTO();
		roomInfoDTO.setRoom_number(roomNumber);
		roomInfoDTO.setRoom_user(stateDTO.getBook_user_name());
		roomInfoDTO.setRoom_checkin(stateDTO.getBook_checkin());
		roomInfoDTO.setRoom_checkout(stateDTO.getBook_checkout());
		roomInfoDTO.setRoom_etc(stateDTO.getEtc());
		
		roomUsageInfoService.assignedRoomAndupdateRoomInfoDB(roomInfoDTO);
		
		
		return "admin/userInfo";
	}
	
	@RequestMapping(value = "/admin/userInfo_checkin", method = RequestMethod.GET)
	public String userInfo_checkin(HttpServletRequest request, Model model) {
		System.out.println("userInfo");
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("code"));

		String user_id = request.getParameter("member_id");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = memberService.getMember(user_id);

		String code = request.getParameter("code");
		ReservationDTO reservationDTO = new ReservationDTO();
		reservationDTO = roomUsageInfoService.getReservation(code);
		
		StateDTO stateDTO = new StateDTO();
		stateDTO.setBook_number(code);
		stateDTO = roomUsageInfoService.forUpdateRoomInfoToGetStateDB(stateDTO);
		
		List<RoomInfoDTO> selectRoom = roomUsageInfoService.getRoomInfo();
		System.out.println(selectRoom.get(0).getRoom_number());
		System.out.println(selectRoom);
		
		
		model.addAttribute("stateDTO", stateDTO);
		model.addAttribute("selectRoom", selectRoom);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("reservationDTO", reservationDTO);

		return "admin/userInfo_checkin";
	}

	@RequestMapping(value = "/admin/userInfo_checkinPro", method = RequestMethod.GET)
	public String userInfo_checkinPro(HttpServletRequest request, Model model) {
		System.out.println("userInfoPro");
		String roomNumber = request.getParameter("reAssigned_room_number");
		String roomName = request.getParameter("reAssigned_room_name");
		String bookNumber = request.getParameter("book_number");
		String etc = request.getParameter("etc");
		
		System.out.println(roomNumber);
		System.out.println(roomName);
		System.out.println(bookNumber); 
		System.out.println(etc); 
		
		StateDTO stateDTO = new StateDTO(); // stateDTO의 객체를 생성해준다.
		stateDTO.setBook_number(bookNumber);
		stateDTO.setAssigned_room_name(roomName); 
		stateDTO.setAssigned_room(roomNumber);
		stateDTO.setCheckin_state(1); // 이 구문은 딱히 안해줘도 됨.
		stateDTO.setEtc(etc); 
		
		roomUsageInfoService.assignedRoomAndupdateStateDB(stateDTO); // state 상에 바로 덮어쓰면 됨.
		
		// roomInfo DB에 고객 이름, 체크아웃, 체크인, 기타 사항 업데이트
		// roomInfoDB는 객실의 현재상태를 나타냄.
		// 객실을 배정해주면 객실 번호에 따라 고객들의 정보가 저장되게 할 것임.
		// 객실 번호를 지정하여 데이터를 저장할 것임.
		// 이 메서드 안에서 고객 이름, 체크아웃, 체크인 값을 바로 가져올 수 없으므로 stateDB의 book_number(예약번호)를 활용하여 값을 가져온다.
		
		// 아래 코드는 book_number(예약번호)가 저장된 stateDTO 객체를 활용하여 예약번호와 일치하는 데이터의 값을 가져와
		// stateDTO의 객체에 덮어씌우는 것임
		stateDTO = roomUsageInfoService.forUpdateRoomInfoToGetStateDB(stateDTO);
		System.out.println(stateDTO.getBook_user_name()); System.out.println(stateDTO.getBook_checkin()); 
		System.out.println(stateDTO.getBook_checkout()); System.out.println(stateDTO.getEtc());
		


		String originRoomNumber = request.getParameter("originRoomNumber");
		System.out.println(originRoomNumber); 
		
		RoomInfoDTO roomInfoDTO = new RoomInfoDTO();
		roomInfoDTO.setRoom_number(roomNumber);
		roomInfoDTO.setRoom_user(stateDTO.getBook_user_name());
		roomInfoDTO.setRoom_checkin(stateDTO.getBook_checkin());
		roomInfoDTO.setRoom_checkout(stateDTO.getBook_checkout());
		roomInfoDTO.setRoom_etc(stateDTO.getEtc());

		
		roomUsageInfoService.RoomChangeAndUpdateStateDB(originRoomNumber);
		roomUsageInfoService.RoomChangeAndUpdateRoomInfoDB(originRoomNumber);  // 기존 객실의 정보를 가져와서 null로 만들면됨
		roomUsageInfoService.assignedRoomAndupdateRoomInfoDB(roomInfoDTO); // 다른 객실에 정보를 넣으면 되고
		
		
		return "admin/userInfo";
	}
	
	
}
