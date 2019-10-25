package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customer_group")
public class CustomerGroup {
	
	@Id
	private String idGroup;
	private String idCha;
	private String nameGroup;
	private boolean GroupType;
	
	public CustomerGroup() {
		
	}

	public CustomerGroup(String idGroup, String idCha, String nameGroup, boolean groupType) {
		this.idGroup = idGroup;
		this.idCha = idCha;
		this.nameGroup = nameGroup;
		GroupType = groupType;
	}

	public String getIdGroup() {
		return idGroup;
	}

	public void setIdGroup(String idGroup) {
		this.idGroup = idGroup;
	}

	public String getIdCha() {
		return idCha;
	}

	public void setIdCha(String idCha) {
		this.idCha = idCha;
	}

	public String getNameGroup() {
		return nameGroup;
	}

	public void setNameGroup(String nameGroup) {
		this.nameGroup = nameGroup;
	}

	public boolean isGroupType() {
		return GroupType;
	}

	public void setGroupType(boolean groupType) {
		GroupType = groupType;
	}
	
	
	
}
