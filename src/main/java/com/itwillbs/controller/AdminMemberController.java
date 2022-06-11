package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.service.AdminMemberService;


@Controller
public class AdminMemberController {
	
	@Inject
	private AdminMemberService adminMemberService;
 
	
	@RequestMapping(value = "/admin/adminMember", method = RequestMethod.GET)
	public String adminMemberList(ReservationDTO reservationDTO, HttpSession session, Model model, HttpServletRequest request) {
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(20);
		
		if(request.getParameter("pageNum")==null) {
			
			pageDTO.setPageNum("1");
		}else {
		
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		
		List<MemberDTO> memberList = adminMemberService.getMemberList(pageDTO);
		
		pageDTO.setCount(adminMemberService.getMembercount());
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "admin/adminMember";
	}

	@RequestMapping(value = "/admin/adminMemberProject", method = RequestMethod.GET)
	public String adminMemberProject() {
		
		
		return "admin/adminMemberProject";
	}

	@RequestMapping(value = "/admin/adminMemberOrders", method = RequestMethod.GET)
	public String adminMemberOrders() {
		
		
		return "admin/adminMemberOrders";
	}
	
	@RequestMapping(value = "/admin/adminMemberIncome", method = RequestMethod.GET)
	public String adminMember() {
		
		
		return "admin/adminMemberIncome";
	}
	
	
}
