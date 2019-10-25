package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "price_type")
public class PriceType {
	
	@Id
	private String idPrice;
	private String priceName;
	private boolean macDinh;
	
	public PriceType() {
	}
	public String getIdPrice() {
		return idPrice;
	}
	public void setIdPrice(String idPrice) {
		this.idPrice = idPrice;
	}
	public String getPriceName() {
		return priceName;
	}
	public void setPriceName(String priceName) {
		this.priceName = priceName;
	}
	public boolean getMacDinh() {
		return macDinh;
	}
	public void setMacDinh(boolean macDinh) {
		this.macDinh = macDinh;
	}
	public PriceType(String idPrice, String priceName, boolean macDinh) {
		super();
		this.idPrice = idPrice;
		this.priceName = priceName;
		this.macDinh = macDinh;
	}
}
