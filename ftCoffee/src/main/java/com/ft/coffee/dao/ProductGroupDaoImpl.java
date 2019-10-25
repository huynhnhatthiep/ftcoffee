package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.ft.coffee.entities.ProductGroup;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductGroupDaoImpl implements ProductGroupDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<ProductGroup> getAllProductGroups() {
		return sessionFactory.getCurrentSession().createQuery("from ProductGroup").list();
	}

	public void addProductGroup(ProductGroup productGroup) {
		sessionFactory.getCurrentSession().save(productGroup);
	}

	public ProductGroup updateProductGroup(ProductGroup productGroup) {
		sessionFactory.getCurrentSession().update(productGroup);
		return productGroup;
	}

	public void deleteProductGroup(String idGroup) {
		ProductGroup productGroup = sessionFactory.getCurrentSession().load(ProductGroup.class, idGroup);
		if (null != productGroup) {
			sessionFactory.getCurrentSession().delete(productGroup);
		}
	}

	public ProductGroup getIdProductGroup(String idGroup) {

		return sessionFactory.getCurrentSession().get(ProductGroup.class, idGroup);

	}

	public boolean findIdProductGroup(String idGroup) {
		ProductGroup productGroup = sessionFactory.getCurrentSession().load(ProductGroup.class, idGroup);
		return null != productGroup;
	}

}
