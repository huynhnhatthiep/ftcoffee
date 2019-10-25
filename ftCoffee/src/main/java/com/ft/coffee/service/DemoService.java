package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.DemoDaoIpm;
import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.TableDiagram;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;

@Service
public class DemoService {

	@Autowired
	private DemoDaoIpm demoDaoIpm;

	/// show List Sơ đồ bàn
	public List<TableDiagram> getListSoDo(){

		return demoDaoIpm.getAll();
	}

	/// Show list Sản phẩm
	public List<PriceList> getPriceList(){

		return demoDaoIpm.getPriceList();
	}

	/// show List voucherLine in voucherNumber
	public voucherLine getVoucherNumber(int voucherNumber) {

		return demoDaoIpm.getVoucherNumber(voucherNumber);
	}

	/// get tableName tableDiagram
	public TableDiagram getTableNumber(String tableNumber) {

		return demoDaoIpm.getTableNumber(tableNumber);
	}

	/// add voucher
	public void addVoucher(voucher voucher) {
		demoDaoIpm.addVoucher(voucher);
	}


}
