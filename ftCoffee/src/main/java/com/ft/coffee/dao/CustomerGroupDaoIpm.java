package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.CustomerGroup;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CustomerGroupDaoIpm implements CustomerGroupDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<CustomerGroup> getCustomerGroup() {
		
		return sessionFactory.getCurrentSession().createQuery("from CustomerGroup").list();
	}

	public void addCustomerGroup(CustomerGroup customerGroup) {
		
		sessionFactory.getCurrentSession().save(customerGroup);
		
	}

	public CustomerGroup updateCustomerGroup(CustomerGroup customerGroup) {
		
		sessionFactory.getCurrentSession().update(customerGroup);
		return customerGroup;
	}

	public void deleteCustomerGroup(String idGroup) {
		
		CustomerGroup customerGroup = sessionFactory.getCurrentSession().load(CustomerGroup.class, idGroup);
		if (null != customerGroup) {
			
			sessionFactory.getCurrentSession().delete(customerGroup);
		}
	}

	public CustomerGroup getIdCustomerGroup(String idGroup) {
		
		return sessionFactory.getCurrentSession().get(CustomerGroup.class, idGroup);
	 
	}

	public boolean findIdCustomerGroup(String idGroup) {
		
		CustomerGroup customerGroup = sessionFactory.getCurrentSession().load(CustomerGroup.class, idGroup);
		
		return null != customerGroup;
	}
}
