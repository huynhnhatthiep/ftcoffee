package com.ft.coffee.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="voucher")
public class voucher {
	
	@Id
	private int voucherNumber;
	private Date voucherDate;
	private int type;
	private String tableNumber;
	private String idCustomer;
	private int customerAmount;
	private String content;
	private String staffId;
	private float reduce;
	private float taxVAT;
	private float phiPV;
	private float moneyAmount;
	private float prepay;
	private float owe;
	private Date setDate;
	private boolean status;
	
	public voucher() {
		
	}

	public voucher(int voucherNumber, Date voucherDate, int type, String tableNumber, String idCustomer,
			int customerAmount, String content,  String staffId, float reduce, float taxVAT,
			float phiPV, float moneyAmount, float prepay, float owe, Date setDate, boolean status) {
		this.voucherNumber = voucherNumber;
		this.voucherDate = voucherDate;
		this.type = type;
		this.tableNumber = tableNumber;
		this.idCustomer = idCustomer;
		this.customerAmount = customerAmount;
		this.content = content;
		this.staffId = staffId;
		this.reduce = reduce;
		this.taxVAT = taxVAT;
		this.phiPV = phiPV;
		this.moneyAmount = moneyAmount;
		this.prepay = prepay;
		this.owe = owe;
		this.setDate = setDate;
		this.status = status;
	}

	public int getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(int voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public Date getVoucherDate() {
		return voucherDate;
	}

	public void setVoucherDate(Date voucherDate) {
		this.voucherDate = voucherDate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public String getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(String idCustomer) {
		this.idCustomer = idCustomer;
	}

	public int getCustomerAmount() {
		return customerAmount;
	}

	public void setCustomerAmount(int customerAmount) {
		this.customerAmount = customerAmount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public float getReduce() {
		return reduce;
	}

	public void setReduce(float reduce) {
		this.reduce = reduce;
	}

	public float getTaxVAT() {
		return taxVAT;
	}

	public void setTaxVAT(float taxVAT) {
		this.taxVAT = taxVAT;
	}

	public float getPhiPV() {
		return phiPV;
	}

	public void setPhiPV(float phiPV) {
		this.phiPV = phiPV;
	}

	public float getMoneyAmount() {
		return moneyAmount;
	}

	public void setMoneyAmount(float moneyAmount) {
		this.moneyAmount = moneyAmount;
	}

	public float getPrepay() {
		return prepay;
	}

	public void setPrepay(float prepay) {
		this.prepay = prepay;
	}

	public float getOwe() {
		return owe;
	}

	public void setOwe(float owe) {
		this.owe = owe;
	}

	public Date getSetDate() {
		return setDate;
	}

	public void setSetDate(Date setDate) {
		this.setDate = setDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
