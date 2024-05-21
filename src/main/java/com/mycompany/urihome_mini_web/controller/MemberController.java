package com.mycompany.urihome_mini_web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.urihome_mini_web.dto.Member;
import com.mycompany.urihome_mini_web.dto.MemberValidator;
import com.mycompany.urihome_mini_web.dto.MyPageOrderHistory;
import com.mycompany.urihome_mini_web.dto.OnumberOrderHistory;
import com.mycompany.urihome_mini_web.security.UriHomeUserDetails;
import com.mycompany.urihome_mini_web.service.MemberService;
import com.mycompany.urihome_mini_web.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		memberService.join(member);
		return "redirect:/member/login";
	}

	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	@GetMapping("/idFind")
	public String idFind() {	
		return "member/idFind";
	}	
	

	@GetMapping("/passwordFind")
	public String passwordFind() {
		return "member/passwordFind";
	}

	@GetMapping("/mypage")
	@Secured("ROLE_USER")
	public String mypage(Authentication authentication, Model model) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		model.addAttribute("member", member);
		return "member/mypage";
	}	
	
	@GetMapping("/memberInfo")
	@Secured("ROLE_USER")
	public String memberInfo(Model model, Authentication authentication) {
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = userDetails.getMember();
		model.addAttribute("member", member);
		
		if(member.getMtel() != null) {
			String[] mtel = member.getMtel().split("-");
			model.addAttribute("mtel", mtel);
		}else {
			String[] mtel = {"", "", ""};
			model.addAttribute("mtel", mtel);
		}
		
		String[] mphone = member.getMphone().split("-");
		model.addAttribute("mphone", mphone);
		
		return "member/memberInfo";
	}

	@GetMapping("/myPageOrderList")
	@Secured("ROLE_USER")
	public String mypageOrderList(Model model, Authentication authentication) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		List<MyPageOrderHistory> myPageOrderList = orderService.getmyPageOrderList(mid);
	    model.addAttribute("myPageOrderList", myPageOrderList);
	    return "member/myPageOrderList";
	}
	
	@GetMapping("/orderHistoryDetail")
	@Secured("ROLE_USER")
	public String orderHistoryDetail(int onumber, Model model, Authentication authentication) {
		UriHomeUserDetails uriHomeUserDetails = (UriHomeUserDetails) authentication.getPrincipal();
		Member member = uriHomeUserDetails.getMember();
		String mid = authentication.getName();
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("mid", mid);
		param.put("onumber", onumber);
		
		List<OnumberOrderHistory> myPageOrderList = orderService.getOnumberOrderHistory(param);
		
	    model.addAttribute("myPageOrderList", myPageOrderList);
	    return "member/orderHistoryDetail";
	}

	@GetMapping("/error403")
	public String error403() {
		return "error/error403";
	}
	
	
	/*member라는 이름의 폼 데이터를 검증하는 데에 MemberValidator 클래스의 검증 규칙을 사용하겠다고 선언하는 것입니다.*/
	@InitBinder("member")
	public void memberFormValidator(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}
	
	
	@PostMapping("/updateMember")
	public String updateMember(Model model, @Valid Member member, Authentication authentication,Errors errors) {			
		//유효성 검사 에러시 마이페이지로 이동시킨다.
		if(errors.hasErrors()) {
			return "/member/memberInfo";
		}
		
		memberService.updateMember(member);		
		
		//DB 내용을 수정했을 경우 Spring Security 정보도 수정
		Member dbMember = memberService.getMember(member.getMid());
		UriHomeUserDetails userDetails = (UriHomeUserDetails) authentication.getPrincipal();
		userDetails.setMember(dbMember);
		
		//
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/deleteMember")
	@Secured("ROLE_USER")
	@ResponseBody
	public Map<String, String> deleteMember(@RequestParam("mid") String mid) {
		memberService.deleteMember(mid);
		Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        return response;		
	}
	
	
	
	
}
