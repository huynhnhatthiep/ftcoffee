package com.ft.coffee.entities;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "voucher_line")
public class DongChungTu {
	
	public DongChungTu() {
		super();
	}
	@Id
	private int id;
	
	@OneToOne
	@JoinColumn(name = "voucherNumber")
	private ChungTu voucher;
	
	@OneToOne
	@JoinColumn(name = "idProduct")
	private Product product;
	
	public DongChungTu(int id, ChungTu voucher, Product product, DVT dvt, int amount, float price, String startTime,
			String endTime) {
		super();
		this.id = id;
		this.voucher = voucher;
		this.product = product;
		this.dvt = dvt;
		this.amount = amount;
		this.price = price;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ChungTu getVoucher() {
		return voucher;
	}
	public void setVoucher(ChungTu voucher) {
		this.voucher = voucher;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public DVT getDvt() {
		return dvt;
	}
	public void setDvt(DVT dvt) {
		this.dvt = dvt;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@OneToOne
	@JoinColumn(name = "idDVT")
	private DVT dvt;
	
	private int amount;
	private float price;
	private String startTime;
	private String endTime;
	
	
}
