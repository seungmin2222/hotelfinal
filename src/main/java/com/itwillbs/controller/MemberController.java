package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.MemberDAOImpl;
import com.itwillbs.domain.GenerateHashPassword;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;
import com.itwillbs.service.ReservationService;

import javax.swing.JOptionPane;

@Controller
public class MemberController {

   @Inject
   private MemberService memberService;
   @Inject
   private ReservationService reservationService;

   @RequestMapping(value = "/member/insert", method = RequestMethod.GET)
   public String insert() {
      return "member/join";
   }

   @RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
   public String insertPro(MemberDTO memberDTO, HttpServletRequest request) {
      System.out.println("/member/insertPro");
      System.out.println(memberDTO.getMember_id());

      // 해시
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      
      System.out.println(memberDTO.getMember_pass());
      System.out.println(memberDTO.getMember_name());

      memberDTO.setMember_mail(request.getParameter("email1") + "@" + request.getParameter("email2"));
      memberDTO.setMember_birth(
            request.getParameter("year") + " " + request.getParameter("month") + " " + request.getParameter("day"));
      memberDTO.setMember_address(request.getParameter("address1") + ", " + request.getParameter("address2") + ", "
            + request.getParameter("address3"));
      System.out.println(memberDTO.getMember_birth());
      System.out.println(memberDTO.getMember_address());
      System.out.println(memberDTO.getMember_mail());
      System.out.println(memberDTO.getMember_gender());
      System.out.println(memberDTO.getMember_grade());
      System.out.println(memberDTO.getMember_phone());

      

      memberService.insertMember(memberDTO);

      return "member/success3";

   }

   @RequestMapping(value = "/member/login", method = RequestMethod.GET)
   public String login(HttpSession session, MemberDTO memberDTO) {
    
      System.out.println("/member/login");
      return "member/login";

   }
   
   @RequestMapping(value = "/member/login2", method = RequestMethod.GET)
   public String login2(MemberDTO memberDTO) {
      System.out.println("/member/login2");
      return "member/login2";
      
   }
   
   @RequestMapping(value = "/member/login3", method = RequestMethod.GET)
   public String login3(MemberDTO memberDTO) {
      System.out.println("/member/login2");
      return "member/login3";
      
   }
   
  

   @RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
   public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
      System.out.println("/member/loginPro");

      // 해시 로그인
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      MemberDTO memberDTO2 = new MemberDTO();
      
      
      memberDTO2 = memberService.userCheck(memberDTO);


      
      if (memberDTO2 != null) {

         session.setAttribute("member_id", memberDTO.getMember_id());
         String member_id = (String) session.getAttribute("member_id");
        memberDTO = memberService.getMember(member_id);
        String mg = memberDTO.getMember_grade();
        int mp = Integer.parseInt(memberDTO.getMember_totalPrice());
        int g1 = 1000000;
        int g2 = 3000000;
        int g3 = 5000000;
        int g4 = 8000000;
        
      if (mp < g1) {
         if (mg.equals("5th_bronze")) {
            return "redirect:/main";
         } else if (!(mg.equals("5th_bronze"))) {
            memberDTO.setMember_grade("5th_bronze");
            memberService.updateGrade(memberDTO);
            return "member/gradeSuccess";
         }
      } else if (mp >= g1 && mp < g2) {
         if (mg.equals("4th_silver")) {
            return "redirect:/main";
         } else if (!(mg.equals("4th_silver"))) {
            memberDTO.setMember_grade("4th_silver");
            memberService.updateGrade(memberDTO);
            return "member/gradeSuccess";
         }
      } else if (mp >= g2 && mp < g3) {
         if (mg.equals("3rd_gold")) {
            return "redirect:/main";
         } else if (!(mg.equals("3rd_gold"))) {
            memberDTO.setMember_grade("3rd_gold");
            memberService.updateGrade(memberDTO);
            return "member/gradeSuccess";
         }
      } else if (mp >= g3 && mp < g4) {
         if (mg.equals("2nd_platinum")) {
            return "redirect:/main";
         } else if (!(mg.equals("2nd_platinum"))) {
            memberDTO.setMember_grade("2nd_platinum");
            memberService.updateGrade(memberDTO);
            return "member/gradeSuccess";
         }
      } else if (mp >= g4) {
         if (mg.equals("1st_dia")) {
            return "redirect:/main";
         } else if (!(mg.equals("1st_dia"))) {
            memberDTO.setMember_grade("1st_dia");
            memberService.updateGrade(memberDTO);
            return "member/gradeSuccess";
         }
      }
       
      return "redirect:/main";

      } else {
         System.out.println(memberDTO.getMember_id());
         System.out.println(memberDTO.getMember_pass());

         return "member/login_fail";
      }

   }
   
   @RequestMapping(value = "/member/gradeSuccess", method = RequestMethod.GET)
   public String gradeSuccess(MemberDTO memberDTO) {
      System.out.println("/member/gradeSuccess");
      return "member/gradeSuccess";
      
   }
   @RequestMapping(value = "/member/loginPro2", method = RequestMethod.POST)
   public String loginPro2(MemberDTO memberDTO, HttpSession session, HttpServletRequest request, Model model) {
      System.out.println("/member/loginPro");
      
      // 해시 로그인
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      MemberDTO memberDTO2 = new MemberDTO();
      
      
      memberDTO2 = memberService.userCheck(memberDTO);
      
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
      
      
      if (memberDTO2 != null) {

          session.setAttribute("member_id", memberDTO.getMember_id());
          String member_id = (String) session.getAttribute("member_id");
         memberDTO = memberService.getMember(member_id);
         String mg = memberDTO.getMember_grade();
         int mp = Integer.parseInt(memberDTO.getMember_totalPrice());
         int g1 = 1000000;
         int g2 = 3000000;
         int g3 = 5000000;
         int g4 = 8000000;
         
       if (mp < g1) {
          if (mg.equals("5th_bronze")) {
             return "redirect:/member/myReservation";
          } else if (!(mg.equals("5th_bronze"))) {
             memberDTO.setMember_grade("5th_bronze");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess2";
          }
       } else if (mp >= g1 && mp < g2) {
          if (mg.equals("4th_silver")) {
             return "redirect:/member/myReservation";
          } else if (!(mg.equals("4th_silver"))) {
             memberDTO.setMember_grade("4th_silver");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess2";
          }
       } else if (mp >= g2 && mp < g3) {
          if (mg.equals("3rd_gold")) {
             return "redirect:/member/myReservation";
          } else if (!(mg.equals("3rd_gold"))) {
             memberDTO.setMember_grade("3rd_gold");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess2";
          }
       } else if (mp >= g3 && mp < g4) {
          if (mg.equals("2nd_platinum")) {
             return "redirect:/member/myReservation";
          } else if (!(mg.equals("2nd_platinum"))) {
             memberDTO.setMember_grade("2nd_platinum");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess2";
          }
       } else if (mp >= g4) {
          if (mg.equals("1st_dia")) {
             return "redirect:/member/myReservation";
          } else if (!(mg.equals("1st_dia"))) {
             memberDTO.setMember_grade("1st_dia");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess2";
          }
       }
        
       return "redirect:/main";

       }  else {
         System.out.println(memberDTO.getMember_id());
         System.out.println(memberDTO.getMember_pass());
         
         return "member/login_fail";
      }
      
   }
   
   @RequestMapping(value = "/member/loginPro3", method = RequestMethod.POST)
   public String loginPro3(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
      System.out.println("/member/loginPro");
      
      // 해시 로그인
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      MemberDTO memberDTO2 = new MemberDTO();
      
      
      memberDTO2 = memberService.userCheck(memberDTO);
      
      
      
      if (memberDTO2 != null) {

          session.setAttribute("member_id", memberDTO.getMember_id());
          String member_id = (String) session.getAttribute("member_id");
         memberDTO = memberService.getMember(member_id);
         String mg = memberDTO.getMember_grade();
         int mp = Integer.parseInt(memberDTO.getMember_totalPrice());
         int g1 = 1000000;
         int g2 = 3000000;
         int g3 = 5000000;
         int g4 = 8000000;
         
       if (mp < g1) {
          if (mg.equals("5th_bronze")) {
             return "/sub/reservation2";
          } else if (!(mg.equals("5th_bronze"))) {
             memberDTO.setMember_grade("5th_bronze");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess3";
          }
       } else if (mp >= g1 && mp < g2) {
          if (mg.equals("4th_silver")) {
             return "/sub/reservation2";
          } else if (!(mg.equals("4th_silver"))) {
             memberDTO.setMember_grade("4th_silver");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess3";
          }
       } else if (mp >= g2 && mp < g3) {
          if (mg.equals("3rd_gold")) {
             return "/sub/reservation2";
          } else if (!(mg.equals("3rd_gold"))) {
             memberDTO.setMember_grade("3th_gold");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess3";
          }
       } else if (mp >= g3 && mp < g4) {
          if (mg.equals("2nd_platinum")) {
             return "/sub/reservation2";
          } else if (!(mg.equals("2nd_platinum"))) {
             memberDTO.setMember_grade("2nd_platinum");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess3";
          }
       } else if (mp >= g4) {
          if (mg.equals("1st_dia")) {
             return "/sub/reservation2";
          } else if (!(mg.equals("1st_dia"))) {
             memberDTO.setMember_grade("1st_dia");
             memberService.updateGrade(memberDTO);
             return "member/gradeSuccess3";
          }
       }
        
       return "redirect:/main";
       
       } else {
         System.out.println(memberDTO.getMember_id());
         System.out.println(memberDTO.getMember_pass());
         
         return "member/login_fail";
      }
      
   }
   
   @RequestMapping(value = "/sub/reservation2", method = RequestMethod.GET)
   public String reservation2(HttpSession session) {
      System.out.println("/member/gradeSuccess");
      return "/sub/reservation2";
      
   }
   @RequestMapping(value = "/member/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
      System.out.println("/member/logout");
      session.invalidate();

      return "redirect:/main";
   }
   

   @RequestMapping(value = "/member/findId", method = RequestMethod.GET)
   public String find_Id() {
      System.out.println("/member/findId");

      return "member/find_id";
   }

   @RequestMapping(value = "/member/find_idPro", method = RequestMethod.GET)
   public String find_IdPro(MemberDTO memberDTO, HttpServletRequest request, Model model) {
      System.out.println("/member/findIdPro");
      MemberDTO memberDTO2 = new MemberDTO();
      memberDTO2 = memberService.findId(memberDTO);
      if (memberDTO2 != null) {
         model.addAttribute("check", 0);
         model.addAttribute("member_id", memberDTO2.getMember_id());

      } else {
         model.addAttribute("check", 1);
      }
      return "member/find_idAlert";
   }

   @RequestMapping(value = "/member/findPass", method = RequestMethod.GET)
   public String find_pass() {
      System.out.println("/member/findPass");

      return "member/find_pass";
   }

   @RequestMapping(value = "/member/findPassPro", method = RequestMethod.POST)
   public String find_passPro(MemberDTO memberDTO, HttpServletRequest request, Model model) {
      System.out.println("/member/findPassPro");
      
      MemberDTO memberDTO2 = new MemberDTO();
      memberDTO2 = memberService.findPass(memberDTO);
      if (memberDTO2 != null) {
         model.addAttribute("check", 0);
//         model.addAttribute("member_pass", memberDTO2.getMember_pass());
         return "member/find_pass_reset";

      } else {
         model.addAttribute("check", 1);
         return "member/find_passAlert";
      }
   }

   // 비밀번호 재설정
   @RequestMapping(value = "/member/findPassResetPro", method = RequestMethod.POST)
   public String findPassResetPro(MemberDTO memberDTO, HttpServletRequest request) {
      System.out.println("MemberController - findPassResetPro()");
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      memberService.updatePass(memberDTO);
      
      return "member/pass_success";
   }
   
   
   // 회원탈퇴
   @RequestMapping(value = "/member/delete", method = RequestMethod.GET)
   public String delete(MemberDTO memberDTO, HttpSession session, Model model) {
      // /WEB-INF/views/member/delete.jsp
    
     //고객등급 보이기위한 처리
     String member_id = (String) session.getAttribute("member_id");
     memberDTO = memberService.getMember(member_id);
     model.addAttribute("memberDTO", memberDTO);
     
      return "member/delete";
   }
   
   // 회원탈퇴 클릭시
   @RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
   public String deletePro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
      System.out.println("MemberController - deletePro()");
      
      GenerateHashPassword hash = new GenerateHashPassword();
      memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));
      
      MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
      if (memberDTO2 != null) { // 아이디, 비밀번호 일치할경우
         memberService.deleteMember(memberDTO);
         session.invalidate();
         // /WEB-INF/views/index.jsp
         return "member/success2";
      } else { // 아이디, 비밀번호 불일치
         // 아이디, 비밀번호 불일치 > 뒤로이동
         return "member/msg";
      }

   }
   
   @RequestMapping(value = "/member/myInfo", method = RequestMethod.GET)
   public String myInfo(HttpSession session, Model model) {
      // 세션값 가져오기
      String member_id = (String) session.getAttribute("member_id");
      System.out.println(member_id);
      // 디비에 세션값에 대한 정보 조회 가져오기
      MemberDTO memberDTO = memberService.getMember(member_id);
      System.out.println(memberDTO);
      // 조회해서 가져온 정보 저장해서 info.jsp로 들고감
      model.addAttribute("memberDTO", memberDTO);
      // /WEB-INF/views/member/updateForm.jsp
      return "member/myInfo";
   }
   
   @RequestMapping(value = "/member/update", method = RequestMethod.GET)
   public String update(HttpSession session, Model model) {
      // 세션값 가져오기
      String member_id = (String) session.getAttribute("member_id");
      System.out.println(member_id);
      // 디비에 세션값에 대한 정보 조회 가져오기
      MemberDTO memberDTO = memberService.getMember(member_id);
      System.out.println(memberDTO);
      // 조회해서 가져온 정보 저장해서 info.jsp로 들고감
      model.addAttribute("memberDTO", memberDTO);
      // /WEB-INF/views/member/updateForm.jsp
      return "member/update";
   }
   
   // http://localhost:8080/myweb/member/updatePro
      @RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
      public String updatePro(MemberDTO memberDTO, HttpServletRequest request) {
         // 수정처리
         System.out.println("/member/updatePro");
         System.out.println(memberDTO);
         // 리턴할형 MemberDTO userCheck(memberDTO) 메서드 호출
         GenerateHashPassword hash = new GenerateHashPassword();
         memberDTO.setMember_pass(hash.getHashPassword_sha256(request.getParameter("member_pass")));

         MemberDTO memberDTO2 = memberService.userCheck(memberDTO);

         
         System.out.println(memberDTO2);
//         MemberDTO memberDTO2 = memberService.updateCheck(memberDTO);
         if (memberDTO2 != null) {
            // 아이디 비밀번호 일치
            // 수정작업 메서드 호출   
            memberDTO.setMember_mail(request.getParameter("email1") + "@" + request.getParameter("email2"));
            memberDTO.setMember_address(request.getParameter("address1") + ", " + request.getParameter("address2") + ", "
                  + request.getParameter("address3"));
            memberService.updateMember(memberDTO);
            // response.sendRedirect() /member/main
            return "member/success";


         } else {
            // 입력하신 정보 틀림
            // null이면 아이디 비밀번호 틀림 뒤로이동
            return "member/msg";
         }
            
      }
   


}