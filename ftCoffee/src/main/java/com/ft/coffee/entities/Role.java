package com.ft.coffee.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {

	@Id
	private Integer id;
	private String name;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	private Set<StaffRole> staffRoles = new HashSet<StaffRole>(0);
	
	public Role() {
		
	}
	
	public Role(Integer id, String name, Set<StaffRole> staffRoles) {
		this.id = id;
		this.name = name;
		this.staffRoles = staffRoles;
	}

	public int getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<StaffRole> getStaffRoles() {
		return staffRoles;
	}

	public void setStaffRoles(Set<StaffRole> staffRoles) {
		this.staffRoles = staffRoles;
	}
	
	
}
