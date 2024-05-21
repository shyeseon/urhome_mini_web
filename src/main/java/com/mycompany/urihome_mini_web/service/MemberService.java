package com.mycompany.urihome_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.MemberDao;
import com.mycompany.urihome_mini_web.dto.Member;
import com.mycompany.urihome_mini_web.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	@Resource
	private MemberDao memberDao;

	public void join(Member member) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMpassword(passwordEncoder.encode(member.getMpassword()));

		if ((member.getMtel2() == "" || member.getMtel2() == null) || (member.getMtel3() == "" || member.getMtel3() == null)) {
			member.setMtel(null);
		}else {
			member.setMtel(member.getMtel1() + "-" + member.getMtel2() + "-" + member.getMtel3());
		}
		
		if(member.getAgree3()==null) member.setAgree3(false);
		
		member.setMphone(member.getMphone1() + "-" + member.getMphone2() + "-" + member.getMphone3());
		member.setMrole("ROLE_USER");
		memberDao.insert(member);
	}
	
	public List<Member> getMemberList(Pager pager) {
		List<Member> memberList=memberDao.selectByPage(pager);
		return memberList;
	}

	public int getTotalRows() {
		int totalRows = memberDao.count();
		return totalRows;
	}	

	public void deleteMember(String mid) {
		memberDao.deleteByMid(mid);
	}

	public Member getMember(String mid) {
		Member member = memberDao.selectByMid(mid);
		return member;
	}

	public void updateMember(Member member) {
		if(member.getMtel2() != null && member.getMtel3() != null) {
			member.setMtel(member.getMtel1() + "-" + member.getMtel2() + "-" + member.getMtel3());
		}
		member.setMphone(member.getMphone1() + "-" + member.getMphone2() + "-" + member.getMphone3());

		if(member.getMpassword() != null && !member.getMpassword().equals("")) {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			member.setMpassword(passwordEncoder.encode(member.getMpassword()));
		}
		
		int rowNum = memberDao.update(member);
	}

	public int getMemberCount() {
		int memberCount = memberDao.getMemberCount();
		return memberCount;
	}

	/*public String find_id(String mname, String mphone) {
		String memberId = memberDao.getMemberId(mname, mphone);
		return memberId;
	}*/
	

}
