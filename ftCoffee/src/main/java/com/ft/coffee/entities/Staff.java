package com.ft.coffee.entities;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

@Entity
@Table(name = "staff")
public class Staff {

	@Id
	private Integer staffId;
	private String username;
	private String password;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "staff")
	private Set<StaffRole> staffRoles = new HashSet<StaffRole>(0);

	public Integer getStaffId() {
		return staffId;
	}

	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<StaffRole> getStaffRoles() {
		return staffRoles;
	}

	public void setStaffRoles(Set<StaffRole> staffRoles) {
		this.staffRoles = staffRoles;
	}

	public List<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (StaffRole staffRole : this.staffRoles) {
			authorities.add(new SimpleGrantedAuthority(staffRole.getRole().getName()));
		}
		return authorities;
	}

}
