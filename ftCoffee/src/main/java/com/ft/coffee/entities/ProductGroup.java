package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product_group")
public class ProductGroup {
	
	@Id
	private String idGroup;
	private String idCha;
	private String groupName;
	private boolean groupType;
	
	public ProductGroup() {
	}

	public ProductGroup(String idGroup, String idCha, String groupName, boolean groupType) {
		super();
		this.idGroup = idGroup;
		this.idCha = idCha;
		this.groupName = groupName;
		this.groupType = groupType;
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

	

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public boolean isGroupType() {
		return groupType;
	}

	public void setGroupType(boolean groupType) {
		this.groupType = groupType;
	}
	
	
}
