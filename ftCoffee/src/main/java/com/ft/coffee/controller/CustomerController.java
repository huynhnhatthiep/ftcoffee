package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.Customer;
import com.ft.coffee.service.CustomerService;
import com.google.gson.Gson;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value="KhachHang", method = RequestMethod.GET)
	public String viewCustomer() {

		return "KhachHang";

	}

	@RequestMapping(value="/loadViewCustomer",  method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loadViewListCustomer() {
		
		return new Gson().toJson(customerService.getAllCustomer());

	}

	@RequestMapping(value="addCustomer", method = RequestMethod.POST)
	public @ResponseBody String addCustomer(@ModelAttribute("customer")Customer customer) {

		try {
			customerService.addCustomer(customer);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}

	}
	
	@RequestMapping(value="KhachHang/{idCustomer}",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getId(@PathVariable(value="idCustomer") final String id) {
		
		return new Gson().toJson(customerService.getCustomer(id));
		
	}
	
	@RequestMapping(value="updateCustomer", method = RequestMethod.POST)
	public @ResponseBody String updateCustomer(
			@RequestParam(required = true) String idCustomer,
			@RequestParam(required = true) String idGroup,
			@RequestParam(required = true) String customerName,
			@RequestParam(required = true) String adress,
			@RequestParam(required = true) String phone,
			@RequestParam(required = true) String taxCode,
			@RequestParam(required = true) Float thuDK,
			@RequestParam(required = true) Float traDK
			) {
		Customer customer = new Customer();
//		CustomerGroup customerGroup = new CustomerGroup(idGroup, null, null, true);
		
		customer.setIdCustomer(idCustomer);
//		customer.setCustomerGroup(customerGroup);
		customer.setIdGroup(idGroup);
		customer.setCustomerName(customerName);
		customer.setAdress(adress);
		customer.setPhone(phone);
		customer.setTaxCode(taxCode);
		customer.setThuDK(thuDK);
		customer.setTraDK(traDK);
		
		try {
			customerService.updateCustomer(customer);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}

	@RequestMapping(value="deleteCustomer/{idCustomer}", method = RequestMethod.GET)
	public @ResponseBody String deleteCustomer(@PathVariable(value="idCustomer") final String id) {

		if (customerService.findCustomer(id)) {
			customerService.deleteCustomer(id);
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping(value="loadViewGroup/{idGroup}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loadIdGroupCustomer(@PathVariable(value="idGroup") String idGroup) {
		
		if (idGroup != null) {
			String json = new Gson().toJson(customerService.loadIdGroupCustomer(idGroup));
			
			return json;
		}
		return "failed";
	}
	
	@RequestMapping(value="search", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String searchNameCustomer(@RequestParam(value="keyword", required=false) String CustomerName) {
		
		if (CustomerName != null) {
			String search = new Gson().toJson(customerService.searchNameCustomerName(CustomerName));
			return search;
		}
		return "{message:fail}";
	}
	
}
