package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.CustomerGroup;

public interface CustomerGroupDao {
	
	public List<CustomerGroup> getCustomerGroup();
	public void addCustomerGroup(CustomerGroup customerGroup);
	public CustomerGroup updateCustomerGroup(CustomerGroup customerGroup);
	public void deleteCustomerGroup(String idGroup);
	public CustomerGroup getIdCustomerGroup(String idGroup);
	public boolean findIdCustomerGroup(String idGroup);	
}
