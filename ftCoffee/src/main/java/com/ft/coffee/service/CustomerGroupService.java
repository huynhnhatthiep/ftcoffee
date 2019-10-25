package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.CustomerGroupDaoIpm;
import com.ft.coffee.entities.CustomerGroup;

@Service
public class CustomerGroupService {
	
	@Autowired
	private CustomerGroupDaoIpm customerGroupDaoIpm;
	
	public List<CustomerGroup> getCustomerGroup(){
		
		return customerGroupDaoIpm.getCustomerGroup();
		
	}
	
	public void addCustomerGroup(CustomerGroup customerGroup) {
		
		customerGroupDaoIpm.addCustomerGroup(customerGroup);
		
	}
	
	public CustomerGroup updateCustomerGroup(CustomerGroup customerGroup) {
		
		return customerGroupDaoIpm.updateCustomerGroup(customerGroup);
		
	}
	
	public void deleteCustomerGroup(String idGroup) {
		
		customerGroupDaoIpm.deleteCustomerGroup(idGroup);
		
	}
	
	public CustomerGroup getIdCustomerGroup(String idGroup) {
		
		return customerGroupDaoIpm.getIdCustomerGroup(idGroup);
		
	}
	
	public boolean findIdCustomerGroup(String idGroup) {
		
		return customerGroupDaoIpm.findIdCustomerGroup(idGroup);
		
	}
	
}
