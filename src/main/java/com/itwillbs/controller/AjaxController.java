package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;


@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> insert(HttpServletRequest request) {
		System.out.println("AjaxController.insert()");
		String result = "";
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
		
		MemberDTO memberDTO=memberService.getMember(member_id);
		if(memberDTO==null) {
			//아이디 없음  아이디 사용가능
			result="idok";
		}else {
			result="iddup"; //아이디 있음  아이디 중복
		}
		
		ResponseEntity<String> entity=new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
	
	
}
