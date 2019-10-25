package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "staff_role")
public class StaffRole {

	@Id
	private Integer id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "role")
	private Role role;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "staff")
	private Staff staff;
	
	public StaffRole() {
		
	}
	
	public StaffRole(Integer id, Role role, Staff staff) {
		this.id = id;
		this.role = role;
		this.staff = staff;
	}

	public int getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	
	
}
