package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.RevenueDaoImpl;
import com.ft.coffee.entities.DongChungTu;

@Service
public class RevenueService {
	
	@Autowired
	private RevenueDaoImpl revenueDaoImpl;
	
	public List<DongChungTu> getList(String time_start, String time_end, String staffId) {
		return revenueDaoImpl.getList(time_start, time_end, staffId);
	}
	
//	public List<NhanVien> getId() {
//		return revenueDaoImpl.getId();
//	}
}
