package com.mycompany.urihome_mini_web.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.urihome_mini_web.dto.Member;

public class UriHomeUserDetails extends User{
	private Member member;
	
	public UriHomeUserDetails(Member member, List<GrantedAuthority> authorities) {
		super(member.getMid(), member.getMpassword(), true, true, true, true, authorities);
		
		this.member = member;
	}
	
	public Member getMember() {
		return member;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

}
