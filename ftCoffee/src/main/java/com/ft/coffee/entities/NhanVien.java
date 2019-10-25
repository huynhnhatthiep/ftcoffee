package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="staff")
public class NhanVien {
	
	@Id
	private int staffId;
	private String username;
	private String password;
	private String staffCode;
	private String idPart;
	private String firstName;
	private String lastName;
	private String address;
	private int phone;
	private int taxCode;
	private String email;
	private int isKeToan;
	private int isThuNgan;
	
	public NhanVien() {
		
	}
	
	public NhanVien(int staffId, String username, String password, String staffCode, String idPart, String firstName,
			String lastName, String address, int phone, int taxCode, String email, int isKeToan, int isThuNgan) {
		this.staffId = staffId;
		this.username = username;
		this.password = password;
		this.staffCode = staffCode;
		this.idPart = idPart;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phone = phone;
		this.taxCode = taxCode;
		this.email = email;
		this.isKeToan = isKeToan;
		this.isThuNgan = isThuNgan;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStaffCode() {
		return staffCode;
	}

	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}

	public String getIdPart() {
		return idPart;
	}

	public void setIdPart(String idPart) {
		this.idPart = idPart;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(int taxCode) {
		this.taxCode = taxCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIsKeToan() {
		return isKeToan;
	}

	public void setIsKeToan(int isKeToan) {
		this.isKeToan = isKeToan;
	}

	public int getIsThuNgan() {
		return isThuNgan;
	}

	public void setIsThuNgan(int isThuNgan) {
		this.isThuNgan = isThuNgan;
	}
	
}
