package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "price_list")
public class PriceList {
	
	@Id
	@GeneratedValue
	/// id
	private int id;
	
	/// Tên hàng hóa
	/// DVT
	@ManyToOne
	@JoinColumn(name = "idProduct")
	private SanPham SanPham;
	
	private String idPrice;
	
	/// Đơn giá
	private float price;
	
	private float sale;	
	
	public PriceList() {
		
	}
	
	public PriceList(int id, com.ft.coffee.entities.SanPham sanPham, String idPrice, float price, float sale) {
		this.id = id;
		SanPham = sanPham;
		this.idPrice = idPrice;
		this.price = price;
		this.sale = sale;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SanPham getSanPham() {
		return SanPham;
	}

	public void setSanPham(SanPham sanPham) {
		SanPham = sanPham;
	}

	public String getIdPrice() {
		return idPrice;
	}

	public void setIdPrice(String idPrice) {
		this.idPrice = idPrice;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getSale() {
		return sale;
	}

	public void setSale(float sale) {
		this.sale = sale;
	}

}
