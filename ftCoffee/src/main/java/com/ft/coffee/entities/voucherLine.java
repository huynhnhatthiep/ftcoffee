package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="voucher_line")
public class voucherLine {
	
	@Id
	private int id;
	private int voucherNumber;
	private String idProduct;
	private String idDVT;
	private float amount;
	private float price;
	
	public voucherLine() {
		
	}

	public voucherLine(int id, int voucherNumber, String idProduct, String idDVT, float amount, float price) {
		super();
		this.id = id;
		this.voucherNumber = voucherNumber;
		this.idProduct = idProduct;
		this.idDVT = idDVT;
		this.amount = amount;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(int voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getIdDVT() {
		return idDVT;
	}

	public void setIdDVT(String idDVT) {
		this.idDVT = idDVT;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	
}
