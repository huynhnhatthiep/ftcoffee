package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "table_diagram")
public class TableDiagram {
	
	@Id
	private String tableNumber;
	
	@ManyToOne
	@JoinColumn(name="idPrice")
	private PriceType priceType;
	
	@ManyToOne
	@JoinColumn(name="idArea")
	private Area area;

	
	public TableDiagram() {
		
	}
	public TableDiagram(String tableNumber, PriceType priceType, Area area) {
		this.tableNumber = tableNumber;
		this.priceType = priceType;
		this.area = area;
	}

	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	public PriceType getPriceType() {
		return priceType;
	}

	public void setPriceType(PriceType priceType) {
		this.priceType = priceType;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
}
