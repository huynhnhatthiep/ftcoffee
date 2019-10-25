package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.Customer;
import com.ft.coffee.entities.CustomerGroup;

public interface CustomerDao {
	
	public List<Customer> getAllCustomer();
	public void addCustomer(Customer customer);
	public Customer updateCustomer(Customer customer);
	public void deleteCustomer(String idCustomer);
	public Customer getCustomer(String idCustomer);
	public boolean findCustomer(String idCustomer);
	
	public List<Customer> loadIdGroupCustomer(String idGroup);
	public List<Customer> searchNameCustomer(String CustomerName);
}
