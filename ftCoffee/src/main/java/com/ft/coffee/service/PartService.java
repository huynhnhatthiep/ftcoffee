package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.PartDaoIpm;
import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.entities.Part;

@Service
public class PartService {
	
	@Autowired
	private PartDaoIpm partDaoIpm;
	
	public List<Part> getTreeViewPart(){
		
		return partDaoIpm.getTreeViewPart();
	}
	
	public List<NhanVien> getIdPart(String idPart){
		
		return partDaoIpm.loadIdPart(idPart);
	}
	
	public void addPart(Part part) {
		
		partDaoIpm.addPart(part);
	}
	
	public Part getIdPartUpdate(String idPart) {
		
		return partDaoIpm.getIdPart(idPart);
	}
	public Part update(Part part) {
		
		return partDaoIpm.updatePart(part);
	}
	
	public void deletePart(String idPart) {
		
		partDaoIpm.deletePart(idPart);
	}
	
	public boolean findIdPart(String idPart) {
		
		return partDaoIpm.findIdPart(idPart);
	}
}
