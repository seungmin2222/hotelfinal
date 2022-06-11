package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardFaqDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardFaqService;

@Controller
public class BoardFaqController {
	@Inject
	private BoardFaqService boardFaqService;
	
	//====================================== 고객 영역 ======================================
	
	// 고객용 - 자주묻는질문(FAQ)
	@RequestMapping(value = "/board/faq", method = RequestMethod.GET)
	public String faq(HttpServletRequest request, Model model) {
		System.out.println("BoardFaqController - 고객/faq()");
		
		// 데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(50);
		if(request.getParameter("pageNum") == null) {
			// 페이지 없을경우 pageNum = 1 설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<BoardFaqDTO> boardFaqList = boardFaqService.getBoardFaqList(pageDTO);
		
		pageDTO.setCount(boardFaqService.getBoardFaqCount());
		
		model.addAttribute("boardFaqList", boardFaqList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "board/faq";
	}
	
	//====================================== 관리자 영역 ======================================
	
	// 관리자 - 자주묻는질문(FAQ)
	@RequestMapping(value = "/admin/adminBoardFaq", method = RequestMethod.GET)
	public String adminBoardFaq(HttpServletRequest request, Model model) {
		System.out.println("BoardFaqController - adminBoardFaq()");
		
		// 데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(15);
		if(request.getParameter("pageNum") == null) {
			// 페이지가 없을경우 pageNum = 1 설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<BoardFaqDTO> boardFaqList = boardFaqService.getBoardFaqList(pageDTO);
		
		pageDTO.setCount(boardFaqService.getBoardFaqCount());
		
		model.addAttribute("boardFaqList", boardFaqList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/adminBoardFaq";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글쓰기
	@RequestMapping(value = "/admin/adminFaqWrite", method = RequestMethod.GET)
	public String adminFaqWrite() {
		System.out.println("BoardFaqController - adminFaqWrite()");
		return "admin/adminBoardFaqWrite";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글 작성후 > 글쓰기버튼클릭(게시물 등록)
	@RequestMapping(value = "/admin/adminFaqWritePro", method = RequestMethod.POST)
	public String adminFaqWritePro(HttpServletRequest request) {
		System.out.println("BoardFaqController - adminFaqWritePro()");
		
		BoardFaqDTO boardFaqDTO = new BoardFaqDTO();
		boardFaqDTO.setFaq_category(request.getParameter("faq_category"));
		boardFaqDTO.setFaq_subject(request.getParameter("faq_subject"));
		boardFaqDTO.setFaq_content(request.getParameter("faq_content"));
		
		boardFaqService.insertFaq(boardFaqDTO);
		
		return "redirect:/admin/adminBoardFaq";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글보기
	@RequestMapping(value = "/admin/adminFaqContent", method = RequestMethod.GET)
	public String adminFaqContent(HttpServletRequest request, Model model) {
		System.out.println("BoardFaqController - adminFaqContent()");

		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		BoardFaqDTO boardFaqDTO = boardFaqService.getBoardFaq(faq_idx);

		model.addAttribute("boardFaqDTO", boardFaqDTO);
		
		return "admin/adminBoardFaqContent";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글수정
	@RequestMapping(value = "/admin/adminFaqUpdate", method = RequestMethod.GET)
	public String adminFaqUpdate(HttpServletRequest request, Model model) {
		System.out.println("BoardFaqController - adminFaqUpdate()");
		
		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		BoardFaqDTO boardFaqDTO = boardFaqService.getBoardFaq(faq_idx);

		model.addAttribute("boardFaqDTO", boardFaqDTO);
		
		return "admin/adminBoardFaqUpdate";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글수정 완료클릭
	@RequestMapping(value = "/admin/adminFaqUpdatePro", method = RequestMethod.POST)
	public String adminFaqUpdatePro(HttpServletRequest request) {
		System.out.println("BoardFaqController - adminFaqUpdatePro()");

		BoardFaqDTO boardFaqDTO = new BoardFaqDTO();
		boardFaqDTO.setFaq_idx(Integer.parseInt(request.getParameter("faq_idx")));
		boardFaqDTO.setFaq_category(request.getParameter("faq_category"));
		boardFaqDTO.setFaq_subject(request.getParameter("faq_subject"));
		boardFaqDTO.setFaq_content(request.getParameter("faq_content"));
		
		// DB작업 > UPDATE
		boardFaqService.updateBoardFaq(boardFaqDTO);
		
		return "redirect:/admin/adminBoardFaq";
	}
	
	// 관리자 - 자주묻는질문(FAQ) 게시글 삭제
	@RequestMapping(value = "/admin/adminFaqDeletePro", method = RequestMethod.GET)
	public String adminFaqDeletePro(HttpServletRequest request, Model model) {
		System.out.println("BoardFaqController - adminFaqDeletePro()");
		
		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		
		boardFaqService.deleteBoardFaq(faq_idx);
		
		return "redirect:/admin/adminBoardFaq";
	}
}
