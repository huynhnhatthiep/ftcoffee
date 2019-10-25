package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.NhanVienDaoIpm;
import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.entities.Part;

@Service
public class NhanVienService {
	
	@Autowired
	private NhanVienDaoIpm nhanVienDaoIpm;
	
	public List<NhanVien> ViewListStaff(){
		
		return nhanVienDaoIpm.ViewListStaff();
	}
	
	public void addStaff(NhanVien nhanVien) {
		
		nhanVienDaoIpm.addStaff(nhanVien);
	}
	
	public List<Part> getOptionIdPart(){
		
		return nhanVienDaoIpm.getOptionIdPart();
	}
	
	public NhanVien updateNhanVien(NhanVien nhanVien) {
		
		return nhanVienDaoIpm.updateStaff(nhanVien);
	}
	
	public NhanVien getIdStaff(int idStaff) {
		
		return nhanVienDaoIpm.getIdStaff(idStaff);
	}
	
	public void deleteStaff(int staffId) {
		
		nhanVienDaoIpm.deleteStaff(staffId);
	}
	public boolean findStaffId(int staffId) {
		
	 return	nhanVienDaoIpm.findIdStaff(staffId);
	}
	
	public List<NhanVien> searchNameStaff(String name){
		
		return nhanVienDaoIpm.searchName(name);
	}
}
