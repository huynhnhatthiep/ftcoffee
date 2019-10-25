package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;
@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietBanDaoIpm implements ChiTietBanDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<PriceList> getPriceList() {
		
		return sessionFactory.getCurrentSession().createQuery("from PriceList").list();
	}

	public void addVoucher(voucher voucher) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(voucher);
	}

	public voucher getIdTableNumber(String tableNumber) {
		
		return sessionFactory.getCurrentSession().get(voucher.class, tableNumber);
	}

	public PriceList getIdProduct(String idProduct) {
		
		return sessionFactory.getCurrentSession().get(PriceList.class, idProduct);
	}

	@SuppressWarnings("unchecked")
	public List<voucher> getVoucherNumber() {
		
		return sessionFactory.getCurrentSession().createQuery("from voucher").list();
	}

	public void addVoucherLine(voucherLine voucherLine) {
	
		sessionFactory.getCurrentSession().saveOrUpdate(voucherLine);
	}


	@SuppressWarnings({ "unchecked" })
	public List<voucherLine> getvcc() {
		
		return sessionFactory.getCurrentSession().createQuery("from voucherLine").list();
	}
	
}
