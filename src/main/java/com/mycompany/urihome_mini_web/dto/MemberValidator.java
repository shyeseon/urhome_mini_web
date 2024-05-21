package com.mycompany.urihome_mini_web.dto;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class MemberValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {		
		log.info("실행");
		return Member.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Member member = (Member) target;

		//아이디 검사
		String mid = member.getMid();
		String midPattern ="[A-Za-z]{4,20}";
		if(mid==null || mid.equals("")) {
			errors.rejectValue("mid", null, "아이디는 반드시 입력해야 합니다.");
		} else if(mid.length() < 4 || mid.length() > 12) {
			errors.rejectValue("mid", null, "아이디는  6자 이상 20자 이하로 입력해야 합니다.");
		} else if(!Pattern.matches(midPattern, mid)) {
			errors.rejectValue("mid", null, "아이디는 알파벳, 숫자를 포함해야 합니다.");
		}
		

		//비밀번호 검사
		String mpassword = member.getMpassword();
		String mpasswordPattern = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
		if(mpassword==null || mpassword.equals("")) {
			errors.rejectValue("mpassword", null, "비밀번호는 반드시 입력해야 합니다.");
		} else if(mpassword.length() < 8 || mpassword.length() > 15) {
			errors.rejectValue("mpassword", null, "비밀번호는 8자이상 15자 이하로 입력 되어야 합니다.");
		}else if(!Pattern.matches(mpasswordPattern, mpassword)) {
			errors.rejectValue("mpassword", null, "비밀번호는 알파벳 대소문자 및 숫자를 포함해야 합니다..");
		}
		
		
		//이름 확인 검사
		String mname = member.getMname();
		String mnamePattern= "[가-힣]{2,4}";
		if(mname == null || mname.equals("")) {
			errors.rejectValue("mname", null, "이름은 반드시 입력해야 합니다.");			
		} else if(mname.length()<2 || mname.length() >4) {
			errors.reject("mname", null, "이름은 2자이상 4자이하로 입력 되어야 합니다.");
		} else if(!Pattern.matches(mnamePattern, mname)) {
			errors.rejectValue("mname", null, "이름은 한글만 포함해야 합니다..");
		}
		
		
		//우편번호 확인 검사
		String mzip = member.getMzip();
		String mzipPattern= "\\d{5}";	
		if(mzip == null || mzip.equals("")) {
			errors.rejectValue("mzip", null, "우편번호는 반드시 입력해야 합니다.");
		} else if(!Pattern.matches(mzipPattern, mzip)) {
			errors.rejectValue("mzip", null, "우편번호가 형식에 맞지 않습니다..");
		}
		

		//집상세주소 확인 검사
		String mdetailAddress = member.getMdetailAddress();
		String mdetailAddressPattern= "^[ㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z\\\\s]+$";
		if(mdetailAddress == null || mdetailAddress.equals("")) {
			errors.rejectValue("maddress", null, "집주소는 반드시 입력해야 합니다.");
		} else if(!Pattern.matches(mdetailAddressPattern, mdetailAddress)) {
			errors.rejectValue("mdetailAddress", null, "상세집주소가 형식에 맞지 않습니다..");
		}
		
		
		//일반전화 확인 검사
		String mtel2 = member.getMtel2();
		String mtelPattern2= "\\d{3}";			
		if(mtel2 != null && !Pattern.matches(mtelPattern2, mtel2)) {
			errors.rejectValue("mtel2", null, "중간 번호 자리수는 최대 3자리 입니다.");
		}
		
		String mtel3 = member.getMtel3();
		String mtelPattern3= "\\d{4}";			
		if(mtel3 != null && !Pattern.matches(mtelPattern3, mtel3)) {
			errors.rejectValue("mtel3", null, "끝 번호 자리수는 최대 4자리 입니다.");
		}
				
		//휴대전화번호 확인 검사
		String mphone2 = member.getMphone2();
		String mphone2Pattern= "\\d{3,4}";
		if(mphone2==null || mphone2.equals("")) {
			errors.rejectValue("mphone2", null, "중간번호 입력은 필수입니다.");
		} else if(!Pattern.matches(mphone2Pattern, mphone2)) {
			errors.rejectValue("mphone2", null, "중간번호는 3자리 또는 4자리여야 합니다.");
		}
		
		String mphone3 = member.getMphone3();
		String mphone3Pattern= "\\d{4}";
		if(mphone3==null || mphone3.equals("")) {
			errors.rejectValue("mphone3", null, "마지막번호 입력은 필수 입니다.");
		} else if(!Pattern.matches(mphone3Pattern, mphone3)) {
			errors.rejectValue("mphone3", null, "마지막번호는 4자리여야 합니다.");
		}
		

		//이메일 확인 검사
		String memail = member.getMemail();
		String memailPattern= "[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";		
		if(memail==null || memail.equals("")) {
			errors.rejectValue("memail", null, "이메일은 반드시 입력해야 합니다.");
		} else if(!Pattern.matches(memailPattern, memail)) {
			errors.rejectValue("memail", null, "잘못된 이메일입니다.");
		}
	}
	
}
