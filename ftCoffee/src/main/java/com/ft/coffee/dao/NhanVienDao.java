package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.entities.Part;

public interface NhanVienDao {
	
	public List<NhanVien> ViewListStaff();
	
	public void addStaff(NhanVien nhanVien);
	
	public List<Part> getOptionIdPart();
	
	public NhanVien updateStaff(NhanVien nhanVien);
	public NhanVien getIdStaff(int idStaff);
	
	public void deleteStaff(int staffId);
	public boolean findIdStaff(int staffId);
	
	public List<NhanVien> searchName(String name);
}
