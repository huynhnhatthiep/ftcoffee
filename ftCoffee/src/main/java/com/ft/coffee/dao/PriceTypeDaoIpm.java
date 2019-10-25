package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.PriceType;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PriceTypeDaoIpm implements PriceTypeDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<PriceType> getAllPriceType() {
		
		return sessionFactory.getCurrentSession().createQuery("from PriceType").list();
	}

	public void addPriceType(PriceType priceType) {
		
		sessionFactory.getCurrentSession().save(priceType);
	}

	public PriceType updatePriceType(PriceType priceType) {
		
		sessionFactory.getCurrentSession().update(priceType);
		return priceType;
	}

	public void deletePriceType(String id) {
		
		PriceType priceType = sessionFactory.getCurrentSession().load(PriceType.class, id);
		if (null != priceType) {
			sessionFactory.getCurrentSession().delete(priceType);
		}
	}

	public PriceType getId(String id) {
		
		return sessionFactory.getCurrentSession().get(PriceType.class, id);
	}

	public boolean findId(String id) {
		
		PriceType priceType = sessionFactory.getCurrentSession().load(PriceType.class, id);
		return null != priceType;
	}

}
