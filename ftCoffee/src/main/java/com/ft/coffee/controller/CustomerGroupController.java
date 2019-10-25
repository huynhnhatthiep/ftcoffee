package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.CustomerGroup;
import com.ft.coffee.service.CustomerGroupService;
import com.google.gson.Gson;

@Controller
public class CustomerGroupController {

	@Autowired
	private CustomerGroupService CustomerGroupService;

	@RequestMapping(value="optionIdGroup", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String option() {

		return new Gson().toJson(CustomerGroupService.getCustomerGroup());

	}

	@RequestMapping(value="loadViewCustomerGroup", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getCustomerGroup() {

		return new Gson().toJson(CustomerGroupService.getCustomerGroup());

	}

	@RequestMapping(value="addCustomerGroup", method = RequestMethod.POST)
	public @ResponseBody String addCustomerGroup(
			@RequestParam("idGroup")String idGroup,
			@RequestParam("nameGroup")String nameGroup
			) {
			
		CustomerGroup customerGroup = new CustomerGroup();
		
		customerGroup.setIdGroup(idGroup);
		customerGroup.setNameGroup(nameGroup);
		
		try {
			CustomerGroupService.addCustomerGroup(customerGroup);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="idGroupCustomerGroup/{idGroup}",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getIdGroup(@PathVariable("idGroup")String idGroup) {
		
		return new Gson().toJson(CustomerGroupService.getIdCustomerGroup(idGroup));
		
	}
	

	@RequestMapping(value="updateCustomerGroup", method = RequestMethod.POST)
	public @ResponseBody String updateCustomerGroup(
			@RequestParam(required = true)String idGroup,
			@RequestParam(required = true)String nameGroup
			){
		CustomerGroup customerGroup = new CustomerGroup();
		customerGroup.setIdGroup(idGroup);
		customerGroup.setNameGroup(nameGroup);
		try {
			CustomerGroupService.updateCustomerGroup(customerGroup);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="deleteCustomerGroup/{idGroup}", method = RequestMethod.GET)
	public @ResponseBody String deleteCustomerGroup(@PathVariable("idGroup")String idGroup) {
		
		if (CustomerGroupService.findIdCustomerGroup(idGroup)) {
			
			CustomerGroupService.deleteCustomerGroup(idGroup);
			return "success";
		}
		return "failed";
		}
		
	}
