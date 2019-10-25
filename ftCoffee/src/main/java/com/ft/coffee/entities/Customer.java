package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class Customer {

	@Id
	private String idCustomer;

	/*@ManyToOne
	@JoinColumn(name = "idGroup")
	private CustomerGroup customerGroup;*/
	
	private String idGroup;
	private String CustomerName;
	private String adress;
	private String phone;
	private String taxCode;
	private float thuDK;
	private float traDK;

	public Customer() {

	}
	

	public Customer(String idCustomer, String idGroup, String customerName, String adress, String phone, String taxCode,
			float thuDK, float traDK) {
		super();
		this.idCustomer = idCustomer;
		this.idGroup = idGroup;
		CustomerName = customerName;
		this.adress = adress;
		this.phone = phone;
		this.taxCode = taxCode;
		this.thuDK = thuDK;
		this.traDK = traDK;
	}

	public String getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(String idCustomer) {
		this.idCustomer = idCustomer;
	}

	public String getIdGroup() {
		return idGroup;
	}


	public void setIdGroup(String idGroup) {
		this.idGroup = idGroup;
	}


	public String getCustomerName() {
		return CustomerName;
	}

	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public float getThuDK() {
		return thuDK;
	}

	public void setThuDK(float thuDK) {
		this.thuDK = thuDK;
	}

	public float getTraDK() {
		return traDK;
	}

	public void setTraDK(float traDK) {
		this.traDK = traDK;
	}

}
