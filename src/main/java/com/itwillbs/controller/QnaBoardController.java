package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.service.QnaBoardService;

@Controller
public class QnaBoardController {
	@Inject
	private QnaBoardService qnaBoardService;
	
	@RequestMapping(value = "/sub/qna", method = RequestMethod.GET)
	public String qna(HttpServletRequest request, Model model) {
		//데이터가져오기 
				PageDTO pageDTO = new PageDTO();
				pageDTO.setPageSize(3);
				if(request.getParameter("pageNum")==null) {
					//pageNum=1
					pageDTO.setPageNum("1");
				}else {
					//pageNum=2
					pageDTO.setPageNum(request.getParameter("pageNum"));
				}
				List<QnaBoardDTO> qnaBoardList = qnaBoardService.getQnaBoardList(pageDTO);
				pageDTO.setCount(qnaBoardService.getQnaBoardCount());
				
				model.addAttribute("qnaBoardList", qnaBoardList);
				model.addAttribute("pageDTO", pageDTO);
		
		
		return "sub/qna";
	}
	
	@RequestMapping(value = "/sub/qnaWrite", method = RequestMethod.GET)
	public String qnaWrite() {
		return "sub/qnaWrite";
	}
	
	@RequestMapping(value = "/sub/qnaWritePro", method = RequestMethod.POST)
	public String qnaWritePro(QnaBoardDTO qnaBoardDTO, HttpSession session) {
		System.out.println(qnaBoardDTO.getQna_idx());
		String member_id=(String)session.getAttribute("member_id");
		qnaBoardDTO.setMember_id(member_id);
		qnaBoardService.insertQnaBoard(qnaBoardDTO);
		return "redirect:/sub/qna";
	}
	
	@RequestMapping(value = "/sub/qnaContent", method = RequestMethod.GET)
	public String qnaContent(HttpServletRequest request, Model model) {
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		QnaBoardDTO qnaBoardDTO = qnaBoardService.getQnaBoard(qna_idx);
		model.addAttribute("qnaBoardDTO",qnaBoardDTO);
		
		return "sub/qnaContent";
	}
	
	@RequestMapping(value = "/sub/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(HttpServletRequest request, Model model) {
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		QnaBoardDTO qnaBoardDTO = qnaBoardService.getQnaBoard(qna_idx);
		model.addAttribute("qnaBoardDTO",qnaBoardDTO);
		
		return "sub/qnaUpdate";
	}
	
	@RequestMapping(value = "/sub/qnaUpdatePro", method = RequestMethod.POST)
	public String qnaUpdatePro(HttpServletRequest request,QnaBoardDTO qnaBoardDTO) {
		String qna_pass = request.getParameter("qna_pass");
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		
		if(qna_pass.equals(qnaBoardService.getQnaPass(qna_idx))) {
			qnaBoardService.updateQnaBoard(qnaBoardDTO);
			return "redirect:/sub/qna"; 
		}else {
			return "sub/qnaMsg";
		}
		
	}
	
	@RequestMapping(value = "/sub/qnaDeletePro", method = RequestMethod.GET)
	   public String qnaDeletePro(HttpServletRequest request) {
	      int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
	      qnaBoardService.deleteQnaBoard(qna_idx);
	      return "redirect:/sub/qna";
	   }
	
	@RequestMapping(value = "/sub/qnaReply", method = RequestMethod.GET)
	public String qnaReply(HttpServletRequest request, Model model) {
		int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
		QnaBoardDTO qnaBoardDTO = qnaBoardService.getQnaBoard(qna_idx);
		model.addAttribute("qnaBoardDTO",qnaBoardDTO);
		
		return "sub/qnaReply";
	}
	
	@RequestMapping(value = "/sub/qnaReplyPro", method = RequestMethod.POST)
	public String qnaReplyPro(QnaBoardDTO qnaBoardDTO) {
		qnaBoardService.insertQnaReply(qnaBoardDTO);
		return "redirect:/sub/qna";
	}
	
	
}
