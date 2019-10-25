package com.ft.coffee.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="part")
public class Part {
	
	@Id
	private String idPart;
	private String idCha;
	private String partName;
	
	public Part() {
		
	}

	public Part(String idPart, String idCha, String partName) {
		super();
		this.idPart = idPart;
		this.idCha = idCha;
		this.partName = partName;
	}

	public String getIdPart() {
		return idPart;
	}

	public void setIdPart(String idPart) {
		this.idPart = idPart;
	}

	public String getIdCha() {
		return idCha;
	}

	public void setIdCha(String idCha) {
		this.idCha = idCha;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}
	
	
	
}
