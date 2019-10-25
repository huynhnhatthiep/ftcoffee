package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "table_diagram")
public class SoDo {
	
	@Id
	private String tableNumber;
	private String idPrice;
	private String idArea;
	
	public SoDo() {
		
	}

	public SoDo(String tableNumber, String idPrice, String idArea) {
		super();
		this.tableNumber = tableNumber;
		this.idPrice = idPrice;
		this.idArea = idArea;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public String getIdPrice() {
		return idPrice;
	}

	public void setIdPrice(String idPrice) {
		this.idPrice = idPrice;
	}

	public String getIdArea() {
		return idArea;
	}

	public void setIdArea(String idArea) {
		this.idArea = idArea;
	}
	
	
}
