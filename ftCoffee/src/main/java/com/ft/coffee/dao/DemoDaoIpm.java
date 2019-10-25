package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.TableDiagram;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DemoDaoIpm implements DemoDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<TableDiagram> getAll() {
		
		return sessionFactory.getCurrentSession().createQuery("from TableDiagram").list();
	}

	@SuppressWarnings("unchecked")
	public List<PriceList> getPriceList() {
		
		return sessionFactory.getCurrentSession().createQuery("from PriceList").list();
	}

	public voucherLine getVoucherNumber(int voucherNumber) {
		
		return sessionFactory.getCurrentSession().get(voucherLine.class, voucherNumber);
	}

	public TableDiagram getTableNumber(String tableNumber) {
		
		return sessionFactory.getCurrentSession().get(TableDiagram.class, tableNumber);
	}

	public void addVoucher(voucher voucher) {
		sessionFactory.getCurrentSession().save(voucher);
		
	}


	
	
}
