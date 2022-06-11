package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.resevationCode;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.ReservationService;
import com.itwillbs.service.RoomService;

@Controller 
public class ReservationController {
   
   @Inject
   private ReservationService reservationService;
   @Inject
   private MemberService memberService;
   @Inject
   private RoomService roomService;

   
   @RequestMapping(value = "/sub/reservation", method = RequestMethod.GET)
   public String reservation(ReservationDTO reservationDTO, HttpServletRequest request, Model model) {
      System.out.println("ReservationController - reservation");
        
      int room_idx = Integer.parseInt(request.getParameter("room_idx"));
      
      RoomDTO roomDTO = roomService.getRoom(room_idx);
      
      model.addAttribute("roomDTO", roomDTO);
      
      return "sub/reservation";
   }
   
   @RequestMapping(value = "/sub/reservationPro", method = RequestMethod.POST)
   public String reservationPro(ReservationDTO reservationDTO, HttpServletRequest request, HttpSession session, Model model ) {
//      System.out.println("ReservationController - reservationPro");
//      
//      System.out.println(reservationDTO.getBook_checkin());
//      System.out.println(reservationDTO.getBook_checkout());
//      System.out.println(reservationDTO.getBook_room_name());
//      System.out.println(reservationDTO.getBook_rooms());
//      System.out.println(reservationDTO.getBook_adult());
//      System.out.println(reservationDTO.getBook_children());
//      System.out.println(reservationDTO.getBook_bed());
//      System.out.println(reservationDTO.getBook_breakfast_adult());
//      System.out.println(reservationDTO.getBook_breakfast_children());
//      System.out.println(reservationDTO.getBook_reqmatter());
//      
//      System.out.println("/sub/pay");
//      String member_id = (String) session.getAttribute("member_id");
//      System.out.println(member_id);
//      
//      MemberDTO memberDTO2 = reservationService.getMemberDTO(member_id);
//      System.out.println(memberDTO2.getMember_name());
//
//      model.addAttribute("memberDTO", memberDTO2);
//      
////      reservationService.insertReservation(reservationDTO);
//      
//      return "/sub/pay";
      
      // ======================================== 홍기 컨트롤러 시작 ==================================
      
      // reservation에서 받아온 폼 값 저장 =>> 굳이 안하고 session값에 바로 넣어도 됨
      String book_checkin = request.getParameter("book_checkin");
      String book_checkout = request.getParameter("book_checkout");
      String book_room_name = request.getParameter("book_room_name");
      String book_rooms = request.getParameter("book_rooms");
      String book_adult = request.getParameter("book_adult");
      String book_children = request.getParameter("book_children");
      String book_bed = request.getParameter("book_bed");
      String book_breakfast_adult = request.getParameter("book_breakfast_adult");
      String book_breakfast_children = request.getParameter("book_breakfast_children");
      String book_reqmatter = request.getParameter("book_reqmatter");
//      String book_totalPrice = request.getParameter("room_totalPrice_result");
            
      // 세션값 불러오기 => 아이디
      String member_id = (String)session.getAttribute("member_id");
      System.out.println("session ID : " + member_id);

      // 세션값 설정하기 => reservation_complete.jsp 이동시 사용할 항목
      session.setAttribute("book_checkin", book_checkin);
      session.setAttribute("book_checkout", book_checkout);
      session.setAttribute("book_room_name", book_room_name);
//      session.setAttribute("book_totalPrice", book_totalPrice);
      
      // 세션값인 아이디에 포함된 개인정보 들고오기
      MemberDTO memberDTO2 = reservationService.getMemberDTO(member_id);
      System.out.println(memberDTO2.getMember_name());

      // 세션 값(아이디 정보) JSP(뷰)로 보내기
      model.addAttribute("memberDTO", memberDTO2);
      
      // 리퀘스트 값(예약 정보) JSP(뷰)로 보내기
      model.addAttribute("book_checkin", book_checkin);
      model.addAttribute("book_checkout", book_checkout);
      model.addAttribute("book_room_name", book_room_name);
      model.addAttribute("book_rooms", book_rooms);
      model.addAttribute("book_adult", book_adult);
      model.addAttribute("book_children", book_children);
      model.addAttribute("book_bed", book_bed);
      model.addAttribute("book_breakfast_adult", book_breakfast_adult);
      model.addAttribute("book_breakfast_children", book_breakfast_children);
      model.addAttribute("book_reqmatter", book_reqmatter);
      
      
      return "/sub/pay";
   }
   
   @RequestMapping(value = "/sub/payPro", method = RequestMethod.GET)
   public String payPro() {
      System.out.println("/sub/payPro");
      return "sub/reservation_complete"; // 결제창 정상적으로 되면 sub/payPro 넣을 예정.
      
   }
   
   @RequestMapping(value = "/sub/payFail", method = RequestMethod.GET)
   public String payFail() {
      System.out.println("/sub/payFail");
      return "sub/payFail";
      
   }

   
   @RequestMapping(value = "/sub/reservation_completePro", method = RequestMethod.GET)
   public String pay(HttpSession session, HttpServletRequest request,ReservationDTO reservationDTO, Model model, MemberDTO memberDTO) {
      // 난수 생성
      resevationCode rc = new resevationCode();
      // 생성된 난수를 code 라는 Sting 변수에 저장
      String code = rc.makeCode();
      
      // 콘솔창에 제대로 나오는지 확인함
//      System.out.println(code);
//      System.out.println(request.getParameter("book_room_name"));   
//      System.out.println(request.getParameter("book_rooms"));   
//      System.out.println(request.getParameter("book_adult"));   
//      System.out.println(request.getParameter("book_children"));   
//      System.out.println(request.getParameter("book_bed"));   
//      System.out.println(request.getParameter("book_breakfast_adult"));   
//      System.out.println(request.getParameter("book_breakfast_children"));
//      System.out.println(request.getParameter("totalPrice"));   
//      
      
      // 세션 지정해놨던 값들은 불러와, model 객체에 저장
      model.addAttribute("book_checkin", session.getAttribute("book_checkin"));
      model.addAttribute("book_checkout", session.getAttribute("book_checkout"));
      model.addAttribute("book_room_name", session.getAttribute("book_room_name"));

      // member_id도 세션값 불러온 것임, 위와 코드가 다른 이유는 다른 메서드에서 알아보기 쉽게 작성한 코드를 가져온 것임.
      // 위의 3개의 세션도 이런 식으로 변수를 지정해주어 model값 또는 다른 객체의 파라미터로 활용시 간단하게 적을 수 있음. 
      String member_id = (String)session.getAttribute("member_id");

      // 세션으로 지정 해줌, => reservation_complete 페이지에서 보여줘야 하는 값들임.
      session.setAttribute("code", code);
      session.setAttribute("totalPrice",request.getParameter("totalPrice"));
      
      // 모델 객체에 추가하여 JSP페이지에서 사용가능하게 함. => ${sessionscope."code"} 이런식으로 JSP 페이지에 입력하면 웹에서 session.getAttribute("code") 값이 뜸.
      model.addAttribute("code", session.getAttribute("code"));
      model.addAttribute("totalPrice", session.getAttribute("totalPrice"));
      MemberDTO memberDTO2 = reservationService.getMemberDTO(member_id);
      ReservationDTO reservationDTO2 = new ReservationDTO();
      // reservaionDTO에 값을 넣어줌, 여기까지만 하면 의미 없고, DB화 시켜야함.
      reservationDTO2.setBook_user(member_id);
      reservationDTO2.setBook_number(code);
      reservationDTO2.setBook_checkin((String)session.getAttribute("book_checkin"));
      reservationDTO2.setBook_checkout((String)session.getAttribute("book_checkout"));
      reservationDTO2.setBook_room_name(request.getParameter("book_room_name"));
      reservationDTO2.setBook_rooms(request.getParameter("book_rooms"));
      reservationDTO2.setBook_adult(request.getParameter("book_adult"));
      reservationDTO2.setBook_children(request.getParameter("book_children"));
      reservationDTO2.setBook_bed(request.getParameter("book_bed"));
      reservationDTO2.setBook_breakfast_adult(request.getParameter("book_breakfast_adult"));
      reservationDTO2.setBook_breakfast_children(request.getParameter("book_breakfast_children"));
      reservationDTO2.setBook_reqmatter(request.getParameter("book_reqmatter"));
      reservationDTO2.setBook_totalPrice(request.getParameter("totalPrice"));
      int p = Integer.parseInt(reservationDTO2.getBook_totalPrice().trim());
      int p2 = Integer.parseInt(memberDTO2.getMember_totalPrice().trim());
      String p3 = String.valueOf(p+p2);
      memberDTO2.setMember_totalPrice(p3);
      // 위에 setBook~~(setter)에 지정해준 값들을  Service(Impl) -> DAO(Impl) -> mapper 순차적으로 이동하면서 mapper의 SQL 구문에 따라 DB 저장시켜줌 
      reservationService.insertReservation(reservationDTO2);
      reservationService.updateTotalPrice(memberDTO2);
      // 리퀘스트 값을 없애기 위해 redirect 사용함. (내가 생각하는 실질적인 효과는 주소줄의 request 데이터 사라짐)
      return "redirect:/sub/reservation_complete"; 
   }
   
   @RequestMapping(value = "/sub/reservation_complete", method = RequestMethod.GET)
   public String reservation_complete(ReservationDTO reservationDTO, MemberDTO memberDTO, HttpSession session) {
      System.out.println("ReservationCotroller - reservation_complete()");
      return "sub/reservation_complete";
   }
   
   
   // 마이페이지 > 나의예약현황 영역
   @RequestMapping(value = "/member/myReservation", method = RequestMethod.GET)
   public String myReservation(ReservationDTO reservationDTO, HttpSession session, Model model, HttpServletRequest request) {
      
     //고객등급 보이기위한 처리
     String member_id = (String) session.getAttribute("member_id");
     MemberDTO memberDTO = memberService.getMember(member_id);
     model.addAttribute("memberDTO", memberDTO);
     
      PageDTO pageDTO = new PageDTO();
      // 한 페이지에 보여줄 글 개수
      pageDTO.setPageSize(100);
      
      if(request.getParameter("pageNum")==null) {
         //pageNum=1
         pageDTO.setPageNum("1");
      }else {
         //pageNum=2
         pageDTO.setPageNum(request.getParameter("pageNum"));
      }
//      List<BoardDTO> boardList = boardDAO.getBoardList(startRow,pageSize);
      List<ReservationDTO> myReservationList = reservationService.getBoardList(pageDTO);
      
      // int count=boardDAO.getBoardCount(); => page관련 값 계산
      pageDTO.setCount(reservationService.getBoardCount());
      
      model.addAttribute("myReservationList", myReservationList);
      model.addAttribute("pageDTO", pageDTO);
      
      //=============================================================
      
//      System.out.println("ReservationCotroller - myReservation()");
//      ReservationDTO reservationDTO2 = new ReservationDTO();
//      reservationDTO2.setBook_user((String)session.getAttribute("member_id"));
//      
//      reservationDTO2 = reservationService.getReservationInfo(reservationDTO2);
//      
//      String code = reservationDTO2.getBook_number();
//      String checkin = reservationDTO2.getBook_checkin();
//      String checkout = reservationDTO2.getBook_checkout();
//      String roomName = reservationDTO2.getBook_room_name();
//      String rooms = reservationDTO2.getBook_rooms();
//      String price = reservationDTO2.getBook_totalPrice();
//      
//      model.addAttribute("code", code);
//      model.addAttribute("checkin", checkin);
//      model.addAttribute("checkout", checkout);
//      model.addAttribute("roomName", roomName);
//      model.addAttribute("rooms", rooms);
//      model.addAttribute("price", price);
      
      
      return "member/myReservation";      
   }
   
   // 마이페이지 > 나의예약 > 상세
   @RequestMapping(value = "/member/myReservationDetail", method = RequestMethod.GET)
   public String myReservationDetail(HttpSession session, Model model, HttpServletRequest request ) {
      System.out.println("ReservationCotroller - myReservationDetail()");
      ReservationDTO reservationDTO2 = new ReservationDTO();

      
      // 클릭했을 경우 예약 번호를 가져온다
      System.out.println(request.getParameter("code"));
      // => 이 구문만 작성 해놓으면 밑에꺼는 다 가능, 이미 우리가 구현해놓은거!
      reservationDTO2.setBook_number(request.getParameter("code"));
      
      // 예약 번호와 세션 일치하는 reservationㅇDTO 을 가져온다!
      reservationDTO2 = reservationService.getReservationInfo(reservationDTO2);
      
      // reservationDTO에 있는 값들을 전부 가져오면 됨
      String code = reservationDTO2.getBook_number();
      String checkin = reservationDTO2.getBook_checkin();
      String checkout = reservationDTO2.getBook_checkout();
      String roomName = reservationDTO2.getBook_room_name();
      String rooms = reservationDTO2.getBook_rooms();
      String adult = reservationDTO2.getBook_adult();
      String children = reservationDTO2.getBook_children();
      String bed = reservationDTO2.getBook_bed();
      String breakfastAdult = reservationDTO2.getBook_breakfast_adult();
      String breakfastChildren = reservationDTO2.getBook_breakfast_children();
      String price = reservationDTO2.getBook_totalPrice();
      
      String member_id = (String) session.getAttribute("member_id");
      MemberDTO memberDTO = memberService.getMember(member_id);
      
      model.addAttribute("code", code);
      model.addAttribute("checkin", checkin);
      model.addAttribute("checkout", checkout);
      model.addAttribute("roomName", roomName);
      model.addAttribute("rooms", rooms);
      model.addAttribute("adult", adult);
      model.addAttribute("children", children);
      model.addAttribute("bed", bed);
      model.addAttribute("breakfastAdult", breakfastAdult);
      model.addAttribute("breakfastChildren", breakfastChildren);
      model.addAttribute("price", price);
      
      model.addAttribute("memberDTO", memberDTO);

      
      
      return "member/myReservationDetail";
   }
   
   // 마이페이지 > 나의예약 > 예약취소
   @RequestMapping(value = "/member/myReservationCancle", method = RequestMethod.GET)
   public String myReservationCancle(ReservationDTO reservationDTO, MemberDTO memberDTO, HttpSession session) {
      System.out.println("ReservationCotroller - myReservationCancle()");
      
      reservationService.deleteReservation(reservationDTO);

      return "redirect:/member/myReservation";
   }
   
   
}