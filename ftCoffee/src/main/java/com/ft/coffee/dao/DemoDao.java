package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.TableDiagram;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;

public interface DemoDao {
	
	public List<TableDiagram> getAll();
	
	
	public List<PriceList> getPriceList();
	
	public voucherLine getVoucherNumber(int voucherNumber);
	
	public TableDiagram getTableNumber(String tableNumber);
	
	public void addVoucher(voucher voucher);
	
}
