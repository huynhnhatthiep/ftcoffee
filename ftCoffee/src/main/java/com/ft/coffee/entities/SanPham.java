package com.ft.coffee.entities;

import javax.persistence.Table;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Table(name="product")
public class SanPham {
	@Id
	private String idProduct;
	private String idGroup;
	private String nameProduct;
	private String idDVT;
	private float SLDK;
	private float GTDK;
	private int IsMenu;
	
	public SanPham() {
		
	}

	public SanPham(String idProduct, String idGroup, String nameProduct, String idDVT, float sLDK, float gTDK,
			int isMenu) {
		super();
		this.idProduct = idProduct;
		this.idGroup = idGroup;
		this.nameProduct = nameProduct;
		this.idDVT = idDVT;
		SLDK = sLDK;
		GTDK = gTDK;
		IsMenu = isMenu;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getIdGroup() {
		return idGroup;
	}

	public void setIdGroup(String idGroup) {
		this.idGroup = idGroup;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public String getIdDVT() {
		return idDVT;
	}

	public void setIdDVT(String idDVT) {
		this.idDVT = idDVT;
	}

	public float getSLDK() {
		return SLDK;
	}

	public void setSLDK(float sLDK) {
		SLDK = sLDK;
	}

	public float getGTDK() {
		return GTDK;
	}

	public void setGTDK(float gTDK) {
		GTDK = gTDK;
	}

	public int getIsMenu() {
		return IsMenu;
	}

	public void setIsMenu(int isMenu) {
		IsMenu = isMenu;
	}
	
}
