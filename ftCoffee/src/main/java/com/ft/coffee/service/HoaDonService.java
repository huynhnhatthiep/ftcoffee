package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.HoaDonDaoImpl;
import com.ft.coffee.entities.ChungTu;

@Service
public class HoaDonService {
	
	@Autowired
	private HoaDonDaoImpl hoaDonDaoImpl;
	
	public List<ChungTu> viewListHoaDon(){
		return hoaDonDaoImpl.viewListHoaDon();
	}
}
