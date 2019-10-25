package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;

public interface ChiTietBanDao {

	public List<PriceList> getPriceList();
	
	public void addVoucher(voucher voucher);
	
	public voucher getIdTableNumber(String tableNumber);
	
	public PriceList getIdProduct(String idProduct);
	
	public List<voucher> getVoucherNumber();
	
	public void addVoucherLine(voucherLine voucherLine);
	
	
	public List<voucherLine> getvcc();
}
