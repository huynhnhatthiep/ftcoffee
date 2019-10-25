package com.ft.coffee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.LoginDaoImpl;
import com.ft.coffee.entities.Staff;


@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private LoginDaoImpl loginDaoImpl;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Staff staff = loginDaoImpl.loadUserByUsernameSercurity(username);
		if (staff == null) {
			return null;
		}
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		
		return new User(username, staff.getPassword(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, staff.getAuthorities());
	}

}

