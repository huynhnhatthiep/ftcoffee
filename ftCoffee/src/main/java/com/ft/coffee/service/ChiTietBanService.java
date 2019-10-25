package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.ChiTietBanDaoIpm;
import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;

@Service
public class ChiTietBanService {

	@Autowired
	private ChiTietBanDaoIpm chiTietBanDaoIpm;
	
	public List<PriceList> getPriceList(){
		
		return chiTietBanDaoIpm.getPriceList();
	}
	
	public void addVoucher(voucher voucher) {
		
		chiTietBanDaoIpm.addVoucher(voucher);
	}
	
	public voucher getTableNumberVoucher(String tableNumber) {
		
		return chiTietBanDaoIpm.getIdTableNumber(tableNumber);
	}
	
	public PriceList getIdProduct(String id) {
		
		return chiTietBanDaoIpm.getIdProduct(id);
	}
	
	public List<voucher> getVoucherNumber(){
		
		return chiTietBanDaoIpm.getVoucherNumber();
	}
	
	public void addVoucherLine(voucherLine voucherLine) {
		
		chiTietBanDaoIpm.addVoucherLine(voucherLine);
	}
	
	public List<voucherLine> getne(){
		
		return chiTietBanDaoIpm.getvcc();
	}
}
