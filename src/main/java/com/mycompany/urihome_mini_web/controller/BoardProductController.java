package com.mycompany.urihome_mini_web.controller;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.urihome_mini_web.dto.BoardProduct;
import com.mycompany.urihome_mini_web.dto.Member;
import com.mycompany.urihome_mini_web.dto.OrderHistory;
import com.mycompany.urihome_mini_web.dto.Pager;
import com.mycompany.urihome_mini_web.security.UriHomeUserDetails;
import com.mycompany.urihome_mini_web.service.BoardProductService;
import com.mycompany.urihome_mini_web.service.OrderService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/boardProduct")
public class BoardProductController {
	@Autowired
	public BoardProductService bpService;
	@Autowired
	public OrderService orderService;
	
	// 리뷰 폼
	@Secured("ROLE_USER")
	@GetMapping("/writeReviewForm")
	public String writeReviewForm(String pid, Model model) {
		model.addAttribute("pid", pid);
		return "boardProduct/writeReviewForm";
	}

	@Secured("ROLE_USER")
	@PostMapping("/writeReview")
	public String writeReview(BoardProduct boardProduct, Authentication authentication) {
		// 로그인한 회원의 id 가져오기
		String mid = authentication.getName();

		// mid를 회원의 id로 설정
		boardProduct.setMid(mid);
		// 게시판을 review 타입으로 설정
		boardProduct.setBptype("review");

		String pid = boardProduct.getPid();

		// 첨부 파일 유무
		if (boardProduct.getBpattach() != null && !boardProduct.getBpattach().isEmpty()) {
			// DTO 설정
			boardProduct.setBpattachoname(boardProduct.getBpattach().getOriginalFilename());
			boardProduct.setBpattachtype(boardProduct.getBpattach().getContentType());
			// 예외 처리
			try {
				boardProduct.setBpattachdata(boardProduct.getBpattach().getBytes());
			} catch (Exception e) {

			}
		}

		// 비즈니스 로직 처리 위임
		bpService.writeBoardProduct(boardProduct);
		// 목록으로 돌아감
		return "redirect:/product/product_detail?pid=" + pid;
	}

	@GetMapping("/reviewList")
	public String reviewList(String pid, String rpageNo, Model model) {
		// pageNo를 받지 못했을 경우 (처음 접근)
		if (rpageNo == null) {
			// 세션에 pageNo가 있는지 확인하고 String으로 받아옴 (돌아가기)
			rpageNo = (String) model.getAttribute("rpageNo");

			// 세션에 저장되어 있지 않은 경우
			if (rpageNo == null) {
				// 강제 1로 세팅 (첫 페이지)
				rpageNo = "1";
			}
		}

		// 문자열인 pageNo를 int형으로 변환
		int intPageNo = Integer.parseInt(rpageNo);
		// 세션에서 pageNo 저장 (되돌아가기)
		model.addAttribute("rpageNo", rpageNo);

		// Page 객체 생성
		HashMap<String, String> rowParam = new HashMap<>();
		rowParam.put("pid", pid);
		rowParam.put("bptype", "review");
		int rowPagingTarget = bpService.getTotalRows(rowParam);
		Pager pager = new Pager(5, 5, rowPagingTarget, intPageNo);

		// Service에서 리뷰 목록 요청
		HashMap<String, Object> param = new HashMap<>();
		param.put("pager", pager);
		param.put("pid", pid);
		param.put("bptype", "review");

		List<BoardProduct> reviewList = bpService.getBoardProductList(param);
		
		model.addAttribute("pager", pager);
		model.addAttribute("pid", pid);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", rowPagingTarget);
		return "boardProduct/reviewListForm";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/removeReview")
	public String removeReview(int bpnumber, String pid, String rpageNo,
			Model model) {
		bpService.removeBoardProduct(bpnumber);
		// pageNo를 받지 못했을 경우 (처음 접근)
		if (rpageNo == null) {
			// 세션에 pageNo가 있는지 확인하고 String으로 받아옴 (돌아가기)
			rpageNo = (String) model.getAttribute("rpageNo");

			// 세션에 저장되어 있지 않은 경우
			if (rpageNo == null) {
				// 강제 1로 세팅 (첫 페이지)
				rpageNo = "1";
			}
		}
		
		// 문자열인 pageNo를 int형으로 변환
		int intPageNo = Integer.parseInt(rpageNo);
		// 세션에서 pageNo 저장 (되돌아가기)
		model.addAttribute("rpageNo", rpageNo);

		// Page 객체 생성
		HashMap<String, String> rowParam = new HashMap<>();
		rowParam.put("pid", pid);
		rowParam.put("bptype", "review");
		int rowPagingTarget = bpService.getTotalRows(rowParam);
		Pager pager = new Pager(5, 5, rowPagingTarget, intPageNo);

		// Service에서 리뷰 목록 요청
		HashMap<String, Object> param = new HashMap<>();
		param.put("pager", pager);
		param.put("pid", pid);
		param.put("bptype", "review");

		List<BoardProduct> reviewList = bpService.getBoardProductList(param);
		
		model.addAttribute("pager", pager);
		model.addAttribute("pid", pid);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", rowPagingTarget);
		
		return "boardProduct/reviewListForm";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/updateReviewForm")
	public String updateReviewForm(int bpnumber, Model model) {
		BoardProduct boardProduct = bpService.getBoardProduct(bpnumber);
		model.addAttribute("boardProduct", boardProduct);
		return "boardProduct/updateReviewForm";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/updateReview")
	public String updateReview(BoardProduct boardProduct, Authentication authentication) {
		// 로그인한 회원의 id 가져오기
		String mid = authentication.getName();

		// mid를 회원의 id로 설정
		boardProduct.setMid(mid);
		// 게시판을 review 타입으로 설정
		boardProduct.setBptype("review");
		String pid = boardProduct.getPid();
		
		// 첨부 파일 유무
		if (boardProduct.getBpattach() != null && !boardProduct.getBpattach().isEmpty()) {
			// DTO 설정
			boardProduct.setBpattachoname(boardProduct.getBpattach().getOriginalFilename());
			boardProduct.setBpattachtype(boardProduct.getBpattachtype());
			// 예외 처리
			try {
				boardProduct.setBpattachdata(boardProduct.getBpattach().getBytes());
			} catch (Exception e) {

			}
		}

		// 비즈니스 로직 처리 위임
		bpService.updateBoardProduct(boardProduct);

		return "redirect:/product/product_detail?pid=" + pid;
	}

	// QnA 폼
	@Secured("ROLE_USER")
	@GetMapping("/writeQnaForm")
	public String writeQnaForm(String pid, Model model) {
		model.addAttribute("pid", pid);
		return "boardProduct/writeQnaForm";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/writeQna")
	public String writeQna(BoardProduct boardProduct, Authentication authentication) {
		// 로그인한 회원의 id 가져오기
		String mid = authentication.getName();
		// mid를 회원의 id로 설정
		boardProduct.setMid(mid);
		// 게시판을 review 타입으로 설정
		boardProduct.setBptype("qna");

		String pid = boardProduct.getPid();

		// 첨부 파일 유무
		if (boardProduct.getBpattach() != null && !boardProduct.getBpattach().isEmpty()) {
			// DTO 설정
			boardProduct.setBpattachoname(boardProduct.getBpattach().getOriginalFilename());
			boardProduct.setBpattachtype(boardProduct.getBpattach().getContentType());
			// 예외 처리
			try {
				boardProduct.setBpattachdata(boardProduct.getBpattach().getBytes());
			} catch (Exception e) {

			}
		}

		// 비즈니스 로직 처리 위임
		bpService.writeBoardProduct(boardProduct);
		// 목록으로 돌아감
		return "redirect:/product/product_detail?pid=" + pid;
	}
	

	@Secured("ROLE_USER")
	@GetMapping("/removeQna")
	public String removeQna(int bpnumber, String pid, String qpageNo,
			Model model) {
		bpService.removeBoardProduct(bpnumber);
		// pageNo를 받지 못했을 경우 (처음 접근)
		if (qpageNo == null) {
			// 세션에 pageNo가 있는지 확인하고 String으로 받아옴 (돌아가기)
			qpageNo = (String) model.getAttribute("qpageNo");

			// 세션에 저장되어 있지 않은 경우
			if (qpageNo == null) {
				// 강제 1로 세팅 (첫 페이지)
				qpageNo = "1";
			}
		}
		
		// 문자열인 pageNo를 int형으로 변환
		int intPageNo = Integer.parseInt(qpageNo);
		// 세션에서 pageNo 저장 (되돌아가기)
		model.addAttribute("rpageNo", qpageNo);

		// Page 객체 생성
		HashMap<String, String> rowParam = new HashMap<>();
		rowParam.put("pid", pid);
		rowParam.put("bptype", "qna");
		int rowPagingTarget = bpService.getTotalRows(rowParam);
		Pager pager = new Pager(5, 5, rowPagingTarget, intPageNo);

		// Service에서 리뷰 목록 요청
		HashMap<String, Object> param = new HashMap<>();
		param.put("pager", pager);
		param.put("pid", pid);
		param.put("bptype", "qna");

		List<BoardProduct> qnaList = bpService.getBoardProductList(param);
		
		model.addAttribute("pager", pager);
		model.addAttribute("pid", pid);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaCount", rowPagingTarget);
		
		return "boardProduct/qnaListForm";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/updateQnaForm")
	public String updateQnaForm(int bpnumber, Model model) {
		BoardProduct boardProduct = bpService.getBoardProduct(bpnumber);
		model.addAttribute("boardProduct", boardProduct);
		return "boardProduct/updateQnaForm";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/updateQna")
	public String updateQna(BoardProduct boardProduct, Authentication authentication) {
		// 로그인한 회원의 id 가져오기
		String mid = authentication.getName();

		// mid를 회원의 id로 설정
		boardProduct.setMid(mid);
		// 게시판을 review 타입으로 설정
		boardProduct.setBptype("qna");
		String pid = boardProduct.getPid();
		
		// 첨부 파일 유무
		if (boardProduct.getBpattach() != null && !boardProduct.getBpattach().isEmpty()) {
			// DTO 설정
			boardProduct.setBpattachoname(boardProduct.getBpattach().getOriginalFilename());
			boardProduct.setBpattachtype(boardProduct.getBpattachtype());
			// 예외 처리
			try {
				boardProduct.setBpattachdata(boardProduct.getBpattach().getBytes());
			} catch (Exception e) {

			}
		}

		// 비즈니스 로직 처리 위임
		bpService.updateBoardProduct(boardProduct);

		return "redirect:/product/product_detail?pid=" + pid;
	}
	
	@GetMapping("/qnaList")
	public String qnaList(String pid, String qpageNo, Model model) {
		// pageNo를 받지 못했을 경우 (처음 접근)
		if (qpageNo == null) {
			// 세션에 pageNo가 있는지 확인하고 String으로 받아옴 (돌아가기)
			qpageNo = (String) model.getAttribute("qpageNo");

			// 세션에 저장되어 있지 않은 경우
			if (qpageNo == null) {
				// 강제 1로 세팅 (첫 페이지)
				qpageNo = "1";
			}
		}
		
		// 문자열인 pageNo를 int형으로 변환
		int intPageNo = Integer.parseInt(qpageNo);
		// 세션에서 pageNo 저장 (되돌아가기)
		model.addAttribute("qpageNo", qpageNo);

		// Page 객체 생성
		HashMap<String, String> rowParam = new HashMap<>();
		rowParam.put("pid", pid);
		rowParam.put("bptype", "qna");
		int rowPagingTarget = bpService.getTotalRows(rowParam);
		Pager pager = new Pager(5, 5, rowPagingTarget, intPageNo);

		// Service에서 리뷰 목록 요청
		HashMap<String, Object> param = new HashMap<>();
		param.put("pager", pager);
		param.put("pid", pid);
		param.put("bptype", "qna");

		List<BoardProduct> qnaList = bpService.getBoardProductList(param);
		
		model.addAttribute("pager", pager);
		model.addAttribute("pid", pid);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaCount", rowPagingTarget);
		return "boardProduct/qnaListForm";
	}
	
	@GetMapping("/boardProductImageDownload")
	public void boardProductImageDownload(int bpnumber, HttpServletResponse response) throws Exception {
		BoardProduct boardProductImage = bpService.getBoardProductImage(bpnumber);
		byte[] data = bpService.getBoardProductImageData(bpnumber);
		
		response.setContentType(boardProductImage.getBpattachtype());
		String fileName = new String(boardProductImage.getBpattachoname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");

		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/isWriteReview")
	public ResponseEntity<Boolean> isWriteReview(String pid, Authentication authentication) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		
		List<OrderHistory> ohistoryList = orderService.getOrderHistory(mid);
		List<String> ohistoryPidList = orderService.getOrderHistoryPid(ohistoryList);
		
		Boolean isBoughtPid = ohistoryPidList.contains(pid) ? true : false;
		
		return ResponseEntity.ok(isBoughtPid);
	}
}
