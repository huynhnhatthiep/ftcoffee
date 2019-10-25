package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.DongChungTu;

public interface RevenueDao {
	public List<DongChungTu> getList(String time_start, String time_end, String staffId);
	/// option
//	public List<NhanVien> getId();
}
