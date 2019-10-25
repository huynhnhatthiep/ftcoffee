package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.entities.Part;

public interface PartDao {
	
	public List<Part> getTreeViewPart();
	
	public List<NhanVien> loadIdPart(String idPart);
	
	public void addPart(Part part);
	
	public Part updatePart(Part part);
	public Part getIdPart(String idPart);
	
	public void deletePart(String idPart);
	public boolean findIdPart(String idPart);
	
}
