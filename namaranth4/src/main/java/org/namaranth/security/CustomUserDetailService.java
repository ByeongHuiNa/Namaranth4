package org.namaranth.security;

import org.namaranth.domain.CustomUser;
import org.namaranth.domain.UsersVO;
import org.namaranth.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersVO vo = mapper.readUser(username);
		log.warn(vo);
		return vo == null ? null : new CustomUser(vo);
	}
	
}
