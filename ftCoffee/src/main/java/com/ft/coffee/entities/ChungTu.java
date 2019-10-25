package com.ft.coffee.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "voucher")
public class ChungTu {
	@Id
	private int voucherNumber;
	private Date voucherDate;
	private boolean	type;
	private String tableNumber;
	private String idCustomer;
	private String content;
	private String staffId;
	private Float reduce;
	private Float taxVAT;	
	private Float phiPV;
	private Float	moneyAmount;
	private Float prepay;
	private Float owe;
	private Date setDate;
	private boolean status;
	private Float moneygoods;

	public ChungTu() {
	}


	public ChungTu(int voucherNumber, Date voucherDate, boolean type, String tableNumber, String idCustomer,
			String content, String staffId, Float reduce, Float taxVAT, Float phiPV, Float moneyAmount, Float prepay,
			Float owe, Date setDate, boolean status, Float moneygoods) {
		super();
		this.voucherNumber = voucherNumber;
		this.voucherDate = voucherDate;
		this.type = type;
		this.tableNumber = tableNumber;
		this.idCustomer = idCustomer;
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
		this.moneygoods = moneygoods;
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


	public boolean isType() {
		return type;
	}


	public void setType(boolean type) {
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


	public Float getReduce() {
		return reduce;
	}


	public void setReduce(Float reduce) {
		this.reduce = reduce;
	}


	public Float getTaxVAT() {
		return taxVAT;
	}


	public void setTaxVAT(Float taxVAT) {
		this.taxVAT = taxVAT;
	}


	public Float getPhiPV() {
		return phiPV;
	}


	public void setPhiPV(Float phiPV) {
		this.phiPV = phiPV;
	}


	public Float getMoneyAmount() {
		return moneyAmount;
	}


	public void setMoneyAmount(Float moneyAmount) {
		this.moneyAmount = moneyAmount;
	}


	public Float getPrepay() {
		return prepay;
	}


	public void setPrepay(Float prepay) {
		this.prepay = prepay;
	}


	public Float getOwe() {
		return owe;
	}


	public void setOwe(Float owe) {
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


	public Float getMoneygoods() {
		return moneygoods;
	}


	public void setMoneygoods(Float moneygoods) {
		this.moneygoods = moneygoods;
	}



}
