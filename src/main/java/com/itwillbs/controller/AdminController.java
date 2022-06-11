package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.QnaBoardService;
import com.itwillbs.service.ReservationService;

@Controller
public class AdminController {
	
	@Inject
	private ReservationService reservationService;
	
	@RequestMapping(value = "/admin/adminPage", method = RequestMethod.GET)
	public String adminPage() {

		return "admin/adminPage";
	}

//	@RequestMapping(value = "/admin/adminMember", method = RequestMethod.GET)
//	public String adminMember() {
//
//		return "admin/adminMember";
//	}
	
	
	@RequestMapping(value = "/admin/adminBook", method = RequestMethod.GET)
	public String adminBook() {

		return "admin/adminBook";
	}
	
	@RequestMapping(value = "/admin/adminCoupon", method = RequestMethod.GET)
	public String adminCoupon() {

		return "admin/adminCoupon";
	}
	
	@RequestMapping(value = "/admin/adminPageControl", method = RequestMethod.GET)
	   public ResponseEntity<List<ReservationDTO>> list() {
	      
	      List<ReservationDTO> reservationList = reservationService.getReservationList();
	      
	      ResponseEntity<List<ReservationDTO>> entity = new ResponseEntity<List<ReservationDTO>>(reservationList,HttpStatus.OK);
	      return entity;
	      
	   }
	
	@RequestMapping(value = "/admin/adminPageControl2", method = RequestMethod.GET)
	public void list2() {
		
		reservationService.getReservationList();
		
		
	}
	
	
	
	
}
