package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "unit")
public class DVT {
	
	@Id
	private String idDVT;
	private boolean macDinh;
	
	public String getIdDVT() {
		return idDVT;
	}
	public void setIdDVT(String idDVT) {
		this.idDVT = idDVT;
	}
	
	public DVT() {
	}
	public String getId() {
		return idDVT;
	}
	public void setId(String idDVT) {
		this.idDVT = idDVT;
	}
	public DVT(String idDVT, boolean macDinh) {
		super();
		this.idDVT = idDVT;
		this.macDinh = macDinh;
	}
	public boolean getMacDinh() {
		return macDinh;
	}
	public void setMacDinh(boolean macDinh) {
		this.macDinh = macDinh;
	}
	
	
}
