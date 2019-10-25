package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	
	@Id
	private String idProduct;

	private String idGroup;
	
	private String nameProduct;
	
	private String idDVT;
	
	private float SLDK; 
	
	private float GTDK;
	
	private boolean IsMenu;
		
	private boolean notEnter ;
	private boolean notExport ;
	

	
	public Product() {
		
	}



	public Product(String idProduct, String idGroup, String nameProduct, String idDVT, float sLDK, float gTDK,
			boolean isMenu, boolean notEnter, boolean notExport) {
		super();
		this.idProduct = idProduct;
		this.idGroup = idGroup;
		this.nameProduct = nameProduct;
		this.idDVT = idDVT;
		SLDK = sLDK;
		GTDK = gTDK;
		IsMenu = isMenu;
		this.notEnter = notEnter;
		this.notExport = notExport;
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



	public boolean isIsMenu() {
		return IsMenu;
	}



	public void setIsMenu(boolean isMenu) {
		IsMenu = isMenu;
	}



	public boolean isNotEnter() {
		return notEnter;
	}



	public void setNotEnter(boolean notEnter) {
		this.notEnter = notEnter;
	}



	public boolean isNotExport() {
		return notExport;
	}



	public void setNotExport(boolean notExport) {
		this.notExport = notExport;
	}






}
