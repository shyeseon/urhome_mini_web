package com.mycompany.urihome_mini_web.controller;


import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.urihome_mini_web.dto.Board;
import com.mycompany.urihome_mini_web.dto.Pager;
import com.mycompany.urihome_mini_web.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardController {
	@Autowired
	public BoardService service;

	@GetMapping("/boardWriteForm")
	public String boardWriteForm(Model model) {
		model.addAttribute("side", "boardManage");
		return "admin/boardWriteForm";
	}

	@PostMapping("/writeBoard")
	public String writeBoard(Board board, Model model, HttpServletRequest request) {
		if (board.getBattach() != null && !board.getBattach().isEmpty()) {
			// DTO 추가 설정
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				board.setBattachdata(board.getBattach().getBytes());
			} catch (Exception e) {
			}
		}

		service.writeBoard(board);
		model.addAttribute("side", "boardManage");
		return "redirect:/admin/adminNotice";
	}
	
	@GetMapping("/adminNotice")
	public String adminNotice(String pageNo, HttpSession session, Model model) {
		if(pageNo==null) {
				pageNo="1";
		}
		int intpageNo=Integer.parseInt(pageNo);
		model.addAttribute("pageNo", pageNo);
		
		int rowsPagingTarget = service.getTotalRows();
		Pager pager = new Pager(10,10,rowsPagingTarget, intpageNo);
		List<Board> notice= service.getBoardList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("notice", notice);
		model.addAttribute("side", "boardManage");
		
		return "admin/adminNotice";
	}
	@GetMapping("/adminNoticeView")
	public String detailBoard(int bnumber, Model model) {
		Board board = service.getBoard(bnumber);
		model.addAttribute("board", board);
		model.addAttribute("side", "boardManage");
		return "admin/adminNoticeView";
	}

	@GetMapping("/attachDownload")
	public void attachDownload(int bnumber, HttpServletResponse response) throws Exception {
		Board board = service.getBoard(bnumber);
		byte[] data = service.getAttachData(bnumber);
		response.setContentType(board.getBattachtype());
		String fileName = new String(board.getBattachoname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-disposition", "attachment; filename\"" + fileName + "\"");
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	@GetMapping("/boardUpdateForm")
	public String boardUpdateForm(int bnumber, Model model) {
		Board board = service.getBoard(bnumber);
		model.addAttribute("board", board);
		model.addAttribute("side", "boardManage");
		return "admin/boardUpdateForm";
	}

	@PostMapping("/updateBoard")
	public String updateBoard(Board board) {
		if (board.getBattach() != null && !board.getBattach().isEmpty()) {
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				board.setBattachdata(board.getBattach().getBytes());
			} catch (Exception e) {
			}
		}
		service.updateBoard(board);
		return "redirect:/admin/adminNoticeView?bnumber=" + board.getBnumber();
	}

	@GetMapping("/deleteBoard")
	public String deleteBoard(int bnumber) {
		service.removeBoard(bnumber);
		return "redirect:/admin/adminNotice";
	}

	@RequestMapping("/FAQ")
	public String FAQboard() {
		return "board/FAQ";
	}

	@RequestMapping("/questionBoard")
	public String questionBoard() {
		return "board/questionBoard";
	}

}
