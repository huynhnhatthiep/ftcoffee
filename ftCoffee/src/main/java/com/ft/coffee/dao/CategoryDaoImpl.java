package com.ft.coffee.dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceType;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<PriceType> getAllPriceType() {
		return sessionFactory.getCurrentSession().createQuery("from PriceType").list();
	}

	@SuppressWarnings("unchecked")
	public List<Area> getAllArea() {
		return sessionFactory.getCurrentSession().createQuery("from Area").list();
	}

	@SuppressWarnings("unchecked")
	public List<DVT> getAllDvt() {
		return sessionFactory.getCurrentSession().createQuery("from DVT").list();
	}

	public void deletePriceType(String idPrice) {
		PriceType priceType = sessionFactory.getCurrentSession().load(PriceType.class, idPrice);
		if (priceType != null) {
			this.sessionFactory.getCurrentSession().remove(priceType);
		}
	}

	public PriceType getPriceType(String idPrice) {
		return (PriceType) sessionFactory.getCurrentSession().get(PriceType.class, idPrice);
	}

	public boolean findPriceType(String idPrice) {
		PriceType priceType = (PriceType) sessionFactory.getCurrentSession().load(PriceType.class, idPrice);
		return priceType != null;
	}

	public void saveOrUpdatePriceType(PriceType priceType) {
		sessionFactory.getCurrentSession().saveOrUpdate(priceType);
	}

}
