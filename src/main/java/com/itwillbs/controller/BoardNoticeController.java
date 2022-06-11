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

import com.itwillbs.domain.BoardNoticeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardNoticeService;

@Controller
public class BoardNoticeController {
	@Inject
	private BoardNoticeService boardNoticeService;
	
	// 업로드 경로
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//====================================== 고객 영역 ======================================
	
	// 고객용 - 공지사항
	@RequestMapping(value = "/board/notice", method = RequestMethod.GET)
	public String notice(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - 고객/notice()");
		
		// 데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(15);
		if(request.getParameter("pageNum") == null) {
			// 페이지가 없을경우 pageNum = 1설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<BoardNoticeDTO> boardNoticeList = boardNoticeService.getBoardNoticeList(pageDTO);
		
		pageDTO.setCount(boardNoticeService.getBoardNoticeCount());
		
		model.addAttribute("boardNoticeList", boardNoticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "board/notice";
	}
	
	// 고객용 - 공지사항 게시글보기
	@RequestMapping(value = "/board/noticeContent", method = RequestMethod.GET)
	public String noticeContent(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - 고객/noticeContent()");
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		BoardNoticeDTO boardNoticeDTO = boardNoticeService.getBoardNotice(notice_idx);
		// 클릭할때마다 조회수 업데이트
		boardNoticeService.updateReadcount(notice_idx);
		
		model.addAttribute("boardNoticeDTO", boardNoticeDTO);
		
		return "board/noticeContent";
	}
	
	//====================================== 관리자 영역 ======================================
	
	// 관리자 - 공지사항(공지사항게시물 리스트 보여주기)
	@RequestMapping(value = "/admin/adminBoardNotice", method = RequestMethod.GET)
	public String adminBoardNotice(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - adminBoardNotice()");
		
		// 데이터 가져오기
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(15);
		if(request.getParameter("pageNum") == null) {
			// 페이지가 없을경우 pageNum = 1 설정
			pageDTO.setPageNum("1");
		} else {
			pageDTO.setPageNum(request.getParameter("pageNum"));
		}
		List<BoardNoticeDTO> boardNoticeList = boardNoticeService.getBoardNoticeList(pageDTO);
		
		pageDTO.setCount(boardNoticeService.getBoardNoticeCount());
		
		model.addAttribute("boardNoticeList", boardNoticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/adminBoardNotice";
	}
	
	// 관리자 - 공지사항 게시글쓰기
	@RequestMapping(value = "/admin/adminNoticeWrite", method = RequestMethod.GET)
	public String adminNoticeWrite() {
		System.out.println("BoardNoticeController - adminNoticeWrite()");
		return "admin/adminBoardNoticeWrite";
	}
	
	
	// 관리자 - 공지사항 글작성후 > 글쓰기버튼클릭(게시물 작성)
	@RequestMapping(value = "/admin/adminNoticeWritePro", method = RequestMethod.POST)
	public String adminNoticeWritePro(HttpServletRequest request, MultipartFile notice_file) throws Exception {
		System.out.println("BoardNoticeController - adminNoticeWritePro()");
		
		// 첨부파일 > 업로드 폴더 파일이름 랜덤문자_파일이름(file.getOriginalFilename();)복사
		// 랜덤 파일이름
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + notice_file.getOriginalFilename();
		
		// 파일끝에서 4번째 자리가 .이 있을경우!
		if(fileName.substring(fileName.length()-4, fileName.length()-3).equals(".")) {
			
			// upload폴더경로 xml에서 가져옴 + 파일이름
			File uploadFile = new File(uploadPath, fileName);
			// 파일복사
			FileCopyUtils.copy(notice_file.getBytes(), uploadFile);
			
			BoardNoticeDTO boardNoticeDTO = new BoardNoticeDTO();
			boardNoticeDTO.setNotice_subject(request.getParameter("notice_subject"));
			boardNoticeDTO.setNotice_content(request.getParameter("notice_content"));
			//file
			boardNoticeDTO.setNotice_file(fileName);
			
			boardNoticeService.insertNotice(boardNoticeDTO);
			
			System.out.println("공지사항 제목 : " + boardNoticeDTO.getNotice_subject());
			System.out.println("공지사항 내용 : " + boardNoticeDTO.getNotice_content());
			System.out.println("공지사항 파일 : " + boardNoticeDTO.getNotice_file());
			System.out.println("공지사항 idx : " + boardNoticeDTO.getNotice_idx());
			System.out.println("공지사항 date : " + boardNoticeDTO.getNotice_date());
			System.out.println("공지사항 readcount : " + boardNoticeDTO.getNotice_readcount());
		} else {
			BoardNoticeDTO boardNoticeDTO = new BoardNoticeDTO();
			boardNoticeDTO.setNotice_subject(request.getParameter("notice_subject"));
			boardNoticeDTO.setNotice_content(request.getParameter("notice_content"));
			System.out.println(fileName.substring(fileName.length()-4, fileName.length()-3));
			boardNoticeService.insertNotice(boardNoticeDTO);
		}
		
		return "redirect:/admin/adminBoardNotice";
	}

	
	// 관리자 - 공지사항 게시글보기
	@RequestMapping(value = "/admin/adminNoticeContent", method = RequestMethod.GET)
	public String adminNoticeContent(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - adminNoticeContent()");
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		BoardNoticeDTO boardNoticeDTO = boardNoticeService.getBoardNotice(notice_idx);
		// 클릭할때마다 조회수 업데이트필요
		boardNoticeService.updateReadcount(notice_idx);
		
		model.addAttribute("boardNoticeDTO", boardNoticeDTO);
		
		return "admin/adminBoardNoticeContent";
	}
	
	
	// 관리자 - 공지사항 게시글수정하기
	@RequestMapping(value = "/admin/adminNoticeUpdate", method = RequestMethod.GET)
	public String adminNoticeUpdate(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - adminNoticeUpdate()");
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		BoardNoticeDTO boardNoticeDTO = boardNoticeService.getBoardNotice(notice_idx);
		
		System.out.println("게시물번호" + boardNoticeDTO.getNotice_idx());
		System.out.println("게시물제목" + boardNoticeDTO.getNotice_subject());
		System.out.println("게시물내용" + boardNoticeDTO.getNotice_content());
		System.out.println("게시물파일" + boardNoticeDTO.getNotice_file());
		System.out.println("게시물조회수" + boardNoticeDTO.getNotice_readcount());
		System.out.println("게시물날짜" + boardNoticeDTO.getNotice_date());
		
		model.addAttribute("boardNoticeDTO", boardNoticeDTO);
		
		return "admin/adminBoardNoticeUpdate";
	}
	
	// 관리자 - 공지사항 수정 완료 클릭
	@RequestMapping(value = "/admin/adminNoticeUpdatePro", method = RequestMethod.POST)
	public String adminNoticeUpdatePro(HttpServletRequest request, MultipartFile notice_file) throws Exception {
		System.out.println("BoardNoticeController - adminNoticeUpdatePro()");
		
		// 첨부파일 > 업로드 폴더 파일이름 랜덤문자_파일이름(file.getOriginalFilename();)복사
		// 랜덤 파일이름
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + notice_file.getOriginalFilename();
		
		if(fileName.substring(fileName.length()-4, fileName.length()-3).equals(".")) {
			// upload폴더경로 xml에서 가져옴 + 파일이름
			File uploadFile = new File(uploadPath, fileName);
			// 파일복사
			FileCopyUtils.copy(notice_file.getBytes(), uploadFile);
			
			BoardNoticeDTO boardNoticeDTO = new BoardNoticeDTO();
			
			boardNoticeDTO.setNotice_idx(Integer.parseInt(request.getParameter("notice_idx")));
			boardNoticeDTO.setNotice_subject(request.getParameter("notice_subject"));
			boardNoticeDTO.setNotice_content(request.getParameter("notice_content"));
			//file
			boardNoticeDTO.setNotice_file(fileName);
			
			System.out.println("수정쓰 idx = " + boardNoticeDTO.getNotice_idx());
			System.out.println("수정쓰 제목 = " + boardNoticeDTO.getNotice_subject());
			System.out.println("수정쓰 내용 = " + boardNoticeDTO.getNotice_content());
			System.out.println("수정쓰 파일 = " + boardNoticeDTO.getNotice_file());
			
			// DB작업 > UPDATE
			boardNoticeService.updateBoardNotice(boardNoticeDTO);
		} else {
			BoardNoticeDTO boardNoticeDTO = new BoardNoticeDTO();
			boardNoticeDTO.setNotice_idx(Integer.parseInt(request.getParameter("notice_idx")));
			boardNoticeDTO.setNotice_subject(request.getParameter("notice_subject"));
			boardNoticeDTO.setNotice_content(request.getParameter("notice_content"));
			
			// DB작업 > UPDATE
			boardNoticeService.updateBoardNotice(boardNoticeDTO);
		}
		return "redirect:/admin/adminBoardNotice";
	}
	
	
	// 관리자 - 공지사항 게시글 삭제
	@RequestMapping(value = "/admin/adminNoticeDeletePro", method = RequestMethod.GET)
	public String adminNoticeDeletePro(HttpServletRequest request, Model model) {
		System.out.println("BoardNoticeController - adminNoticeDeletePro()");
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		
		boardNoticeService.deleteBoardNotice(notice_idx);
		
		return "redirect:/admin/adminBoardNotice";
	}
	
	
	
}
