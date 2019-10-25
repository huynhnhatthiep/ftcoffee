package com.ft.coffee.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.Customer;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CustomerDaoIpm implements CustomerDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomer() {

		return sessionFactory.getCurrentSession().createQuery("from Customer").list();
	}

	public void addCustomer(Customer customer) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(customer);
		
	}

	public Customer updateCustomer(Customer customer) {
		
		sessionFactory.getCurrentSession().update(customer);
		return customer;
	}

	public void deleteCustomer(String idCustomer) {
		
		Customer customer = sessionFactory.getCurrentSession().load(Customer.class, idCustomer);
		if (null != customer) {
			
			sessionFactory.getCurrentSession().delete(customer);
		}
	}

	public Customer getCustomer(String idCustomer) {
		
		return sessionFactory.getCurrentSession().get(Customer.class, idCustomer);
	}

	public boolean findCustomer(String idCustomer) {

		Customer customer = sessionFactory.getCurrentSession().load(Customer.class, idCustomer);
		return null != customer;
	}
	
	@SuppressWarnings("unchecked")
	public List<Customer> loadIdGroupCustomer(String idGroup) {
		
		List<Customer> customers = new ArrayList<Customer>();
		
		customers = this.sessionFactory.getCurrentSession().createQuery("from Customer where idGroup=:idGroup").setParameter("idGroup", idGroup).list();
		if (customers.size() > 0) {
			return customers;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Customer> searchNameCustomer(String CustomerName) {
		
		List<Customer> customers = new ArrayList<Customer>();
		
		customers = sessionFactory.getCurrentSession()
				.createQuery("from Customer  WHERE CustomerName LIKE '%"+CustomerName+"%'")
				.list();
		
		if (customers.size() > 0) {
			return customers;
		} else {
			return null;
		}
	}


}
