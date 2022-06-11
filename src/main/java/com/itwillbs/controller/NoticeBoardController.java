package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.NoticeBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	@Inject
	private NoticeBoardService noticeBoardService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/sub/notice", method = RequestMethod.GET)
	public String noticeList(HttpServletRequest request, Model model) {
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(3);
		if(request.getParameter("pageNum")==null) {
			pageDTO.setPageNum("1");
		}else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<NoticeBoardDTO> noticeList = noticeBoardService.getNoticeList(pageDTO);
		pageDTO.setCount(noticeBoardService.getNoticeCount());
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "sub/notice";
	}

	@RequestMapping(value = "/sub/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {
		return "sub/noticeWrite";
	}

	
	@RequestMapping(value = "/sub/noticeWritePro", method = RequestMethod.POST)
	public String noticeWritePro(HttpServletRequest request, MultipartFile notice_file) throws Exception {
	
		UUID uuid = UUID.randomUUID();
		String notice_filename = uuid.toString()+"_"+notice_file.getOriginalFilename();
		File uploadFile = new File(uploadPath, notice_filename);
		FileCopyUtils.copy(notice_file.getBytes(), uploadFile);
		NoticeBoardDTO noticeBoardDTO = new NoticeBoardDTO();
		noticeBoardDTO.setNotice_subject(request.getParameter("notice_subject"));
		noticeBoardDTO.setNotice_content(request.getParameter("notice_content"));
	
		noticeBoardDTO.setNotice_file(notice_filename);

		noticeBoardService.insertNotice(noticeBoardDTO);
	
		return "redirect:/sub/notice";
	}
	

	@RequestMapping(value = "/sub/noticeContent", method = RequestMethod.GET)
	public String noticeContent(HttpServletRequest request, Model model) {
		int notice_idx=Integer.parseInt(request.getParameter("notice_idx"));
		NoticeBoardDTO noticeBoardDTO = noticeBoardService.getNotice(notice_idx);
		noticeBoardService.updateReadcount(notice_idx);
		
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);
		return "sub/noticeContent";
	}
	

	@RequestMapping(value = "/sub/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(HttpServletRequest request, Model model) {
	    int num =Integer.parseInt(request.getParameter("notice_idx"));
		System.out.println(num);
		NoticeBoardDTO noticeBoardDTO = noticeBoardService.getNotice(num);
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);
		return "sub/noticeUpdate";
	}
	
	
	@RequestMapping(value = "/sub/noticeUpdatePro", method = RequestMethod.POST)
	public String noticeUpdatePro(NoticeBoardDTO noticeBoardDTO) throws Exception {

		noticeBoardService.updateNotice(noticeBoardDTO);

		return "redirect:/sub/notice";
	}
	

    @RequestMapping(value = "/sub/noticeDelete", method = RequestMethod.GET)
    public String noticeDelete(HttpServletRequest request) {

       int num =Integer.parseInt(request.getParameter("notice_idx"));
       System.out.println(num);
       noticeBoardService.deleteNotice(num);

       return "redirect:/sub/notice";
    }
	 
    
}
