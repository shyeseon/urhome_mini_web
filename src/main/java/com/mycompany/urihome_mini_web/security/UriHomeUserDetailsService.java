package com.mycompany.urihome_mini_web.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.urihome_mini_web.dao.MemberDao;
import com.mycompany.urihome_mini_web.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UriHomeUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberDao.selectByMid(username);
		if(member==null) {
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		List<GrantedAuthority>  authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(member.getMrole()));
		
		UserDetails userDetails = new UriHomeUserDetails(member, authorities);
		return userDetails;
	}
	
}
