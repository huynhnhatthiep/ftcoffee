package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.CustomerDaoIpm;
import com.ft.coffee.entities.Customer;

@Service
public class CustomerService{

	@Autowired
	private CustomerDaoIpm customerDaoIpm;

	public List<Customer> getAllCustomer() {
		return customerDaoIpm.getAllCustomer();
	}

	public void addCustomer(Customer customer) {

		customerDaoIpm.addCustomer(customer);
	}

	public Customer updateCustomer(Customer customer) {

		return customerDaoIpm.updateCustomer(customer);
	}

	public void deleteCustomer(String idCustomer) {

		customerDaoIpm.deleteCustomer(idCustomer);
	}

	public Customer getCustomer(String idCustomer) {

		return customerDaoIpm.getCustomer(idCustomer);
	}

	public boolean findCustomer(String idCustomer) {

		return customerDaoIpm.findCustomer(idCustomer);
	}
	
	public List<Customer> loadIdGroupCustomer(String idGroup) {
		
		return customerDaoIpm.loadIdGroupCustomer(idGroup);
		
	}
	
	public List<Customer> searchNameCustomerName(String CustomerName){
		
		return customerDaoIpm.searchNameCustomer(CustomerName);
		
	}
}
