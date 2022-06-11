package com.itwillbs.controller;

import java.security.Provider.Service;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardQnaDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.service.BoardQnaService;

@Controller
public class BoardQnaController {
	@Inject
	private BoardQnaService boardQnaService;
	
	//====================================== 고객 영역 ======================================
	
	// 고객용 - Q&A
	@RequestMapping(value = "/board/qna", method = RequestMethod.GET)
	public String qna(HttpServletRequest request, Model model) {
		//데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(20);
		if(request.getParameter("pageNum")==null) {
			// pageNum = 1
			pageDTO.setPageNum("1");
		} else {
			// pageNum > 1
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<BoardQnaDTO> boardQnaList = boardQnaService.getBoardQnaList(pageDTO);
		pageDTO.setCount(boardQnaService.getBoardQnaCount());
		
		model.addAttribute("boardQnaList", boardQnaList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "board/qna";
	}
	
	// 고객용 - Q&A 게시글쓰기
	@RequestMapping(value = "/board/qnaWrite", method = RequestMethod.GET)
	public String qnaWrite() {
		System.out.println("BoardQnaController.qnaWrite()");
		return "board/qnaWrite";
	}
	
	// 고객용 - Q&A 게시글쓰기 > 버튼클릭
	@RequestMapping(value = "/board/qnaWritePro", method = RequestMethod.POST)
	public String qnaWritePro(BoardQnaDTO boardQnaDTO, HttpSession session) {
		System.out.println("BoardQnaController.qnaWritePro()");
		
		String member_id=(String)session.getAttribute("member_id");
		boardQnaDTO.setMember_id(member_id);
		boardQnaService.insertBoardQna(boardQnaDTO);
		return "redirect:/board/qna";
	}
	
	// 고객용 - Q&A 게시글보기
	@RequestMapping(value = "/board/qnaContent", method = RequestMethod.GET)
	public String qnaContent(HttpServletRequest request, Model model) {
		System.out.println("BoardQnaController.qnaContent()");
		
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		BoardQnaDTO boardQnaDTO = boardQnaService.getBoardQna(qna_idx);
		model.addAttribute("boardQnaDTO",boardQnaDTO);
		
		return "board/qnaContent";
	}
	
	// 고객용 - Q&A 게시글 수정
	@RequestMapping(value = "/board/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(HttpServletRequest request, Model model) {
		System.out.println("BoardQnaController.qnaUpdate()");
		
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		System.out.println("아이디 액스!"+qna_idx);
		BoardQnaDTO boardQnaDTO = boardQnaService.getBoardQna(qna_idx);
		model.addAttribute("boardQnaDTO", boardQnaDTO);
		
		return "board/qnaUpdate";
	}
	
	// 고객용 - Q&A 게시글 수정 > 버튼클릭
	@RequestMapping(value = "/board/qnaUpdatePro", method = RequestMethod.POST)
	public String qnaUpdatePro(BoardQnaDTO boardQnaDTO, HttpServletRequest request) {
		System.out.println("BoardQnaController.qnaUpdatePro()");
		
		String qna_pass = request.getParameter("qna_pass");
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		
		BoardQnaDTO boardQnaDTO2 = boardQnaService.getBoardQna(qna_idx);
		boardQnaDTO2.getQna_pass();
		
		System.out.println("겟큐엔에이 패스"+boardQnaDTO2.getQna_pass());
		
		if(qna_pass.equals(boardQnaDTO2.getQna_pass())) {
			boardQnaService.updateBoardQna(boardQnaDTO);
			return "redirect:/board/qna"; 
		}else {
			return "board/qnaMsg";
		}
	}
	
	// 고객용 - Q&A 게시글 삭제
	@RequestMapping(value = "/board/qnaDeletePro", method = RequestMethod.GET)
	public String qnaDeletePro(HttpServletRequest request, Model model) {
		System.out.println("BoardQnaController.qnaDeletePro()");
		
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		
		boardQnaService.deleteBoardQna(qna_idx);
		
		return "redirect:/board/qna";
	}
	
	@RequestMapping(value = "/board/qnaReply", method = RequestMethod.GET)
	public String qnaReply(HttpServletRequest request, Model model) {
		System.out.println("BoardQnaController.qnaUpdate()");
		
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		BoardQnaDTO boardQnaDTO = boardQnaService.getBoardQna(qna_idx);
		model.addAttribute("boardQnaDTO", boardQnaDTO);
		
		return "board/qnaReply";
	}
	
	@RequestMapping(value = "/board/qnaReplyPro", method = RequestMethod.POST)
	public String qnaReplyPro(BoardQnaDTO boardQnaDTO, HttpServletRequest request) {
		int re_req = boardQnaDTO.getQna_req();
		int re_lev = boardQnaDTO.getQna_lev();
		int re_seq = boardQnaDTO.getQna_seq();
		boardQnaDTO.setQna_req(re_req );
		boardQnaDTO.setQna_lev(re_lev+1 );
		
		if(re_lev != 0) {
			//대댓글 일 경우
			boardQnaDTO.setQna_subject("　　"+ boardQnaDTO.getQna_subject());
			System.out.println(boardQnaDTO.getQna_subject());
			boardQnaDTO.setQna_seq(re_seq );
			boardQnaService.insertBoardQnaReply(boardQnaDTO);
		} else {
			// 댓글일 경우
			int re_seq2 = boardQnaService.getBoardQnaReply(re_req);
			System.out.println(re_seq2);
			boardQnaDTO.setQna_subject("└ 답변 : " + boardQnaDTO.getQna_subject());
			System.out.println(boardQnaDTO.getQna_subject());
			boardQnaDTO.setQna_seq(re_seq2 +1);
			boardQnaService.insertBoardQnaReply(boardQnaDTO);
		}
		System.out.println(boardQnaDTO.getQna_req());
		System.out.println(boardQnaDTO.getQna_lev());
		System.out.println(boardQnaDTO.getQna_seq());
		return "redirect:/board/qna";
	}
	
	
	//====================================== 관리자 영역 ======================================
	
	// 관리자 - Q&A
	@RequestMapping(value = "/admin/adminBoardQna", method = RequestMethod.GET)
	public String adminBoardQna() {
		return "admin/adminBoardQna";
	}
	
	// 관리자 - Q&A 게시물보기
	@RequestMapping(value = "/admin/adminQnaContent", method = RequestMethod.GET)
	public String adminBoardQnaContent() {
		return "admin/adminBoardQnaContent";
	}
}
