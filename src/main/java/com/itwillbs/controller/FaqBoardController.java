package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FaqBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.FaqBoardService;
import com.itwillbs.service.FaqBoardServiceImpl;

@Controller
public class FaqBoardController {
	@Inject
	private FaqBoardService faqBoardservice;
	
	@RequestMapping(value = "/sub/faq", method = RequestMethod.GET)
	public String faq(HttpServletRequest request, Model model) {
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
				List<FaqBoardDTO> faqBoardList = faqBoardservice.getFaqBoardList(pageDTO);
				pageDTO.setCount(faqBoardservice.getFaqBoardCount());
				
				model.addAttribute("faqBoardList", faqBoardList);
				model.addAttribute("pageDTO", pageDTO);
		
		
		return "sub/faq";
	}
	
	@RequestMapping(value = "/sub/faqWrite", method = RequestMethod.GET)
	public String faqWrite() {
		return "sub/faqWrite";
	}
	
	@RequestMapping(value = "/sub/faqWritePro", method = RequestMethod.POST)
	public String faqWritePro(FaqBoardDTO faqBoardDTO) {
		faqBoardservice.insertFaqBoard(faqBoardDTO);
		return "redirect:/sub/faq";
	}
	
	
	@RequestMapping(value = "/sub/faqContent", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		FaqBoardDTO faqBoardDTO = faqBoardservice.getFaqBoard(faq_idx);
		model.addAttribute("faqBoardDTO",faqBoardDTO);
		
		return "sub/faqContent";
	}
	
	@RequestMapping(value = "/sub/faqUpdate", method = RequestMethod.GET)
	public String faqUpdate(HttpServletRequest request, Model model) {
		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		FaqBoardDTO faqBoardDTO = faqBoardservice.getFaqBoard(faq_idx);
		model.addAttribute("faqBoardDTO",faqBoardDTO);
		
		return "sub/faqUpdate";
	}
	
	@RequestMapping(value = "/sub/faqUpdatePro", method = RequestMethod.POST)
	public String faqUpdatePro(FaqBoardDTO faqBoardDTO) {
		faqBoardservice.updateFaqBoard(faqBoardDTO);
		return "redirect:/sub/faq";
	}
	
	@RequestMapping(value = "/sub/faqDeletePro", method = RequestMethod.GET)
	public String faqDeletePro(HttpServletRequest request) {
		int faq_idx = Integer.parseInt(request.getParameter("faq_idx"));
		faqBoardservice.deleteFaqBoard(faq_idx);
		
		return "redirect:/sub/faq";
	}
	
}
