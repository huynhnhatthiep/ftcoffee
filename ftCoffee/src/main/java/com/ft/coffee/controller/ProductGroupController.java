package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.ProductGroup;
import com.ft.coffee.service.ProductGroupService;
import com.google.gson.Gson;
	
@Controller
public class ProductGroupController {
 
	@Autowired
	private ProductGroupService productGroupService;

	@RequestMapping(value="1", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String option() {

		return new Gson().toJson(productGroupService.getAllProductGroups());

	}

	@RequestMapping(value="loadViewProductGroup", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getProductGroup() {
		
		return new Gson().toJson(productGroupService.getAllProductGroups());

	}

	@RequestMapping(value="addProductGroup", method = RequestMethod.POST)
	public @ResponseBody String addProductGroup(
			@RequestParam("idGroup")String idGroup,
			@RequestParam("groupName")String groupName
			) {
			
		ProductGroup productGroup = new ProductGroup();
		
		productGroup.setIdGroup(idGroup);
		productGroup.setGroupName(groupName);
		
		try {
			productGroupService.addProductGroup(productGroup);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="idGroupProductGroup/{idGroup}",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getIdGroup(@PathVariable("idGroup")String idGroup) {
		
		return new Gson().toJson(productGroupService.getIdProductGroup(idGroup));
		
	}
	

	@RequestMapping(value="updateProductGroup", method = RequestMethod.POST)
	public @ResponseBody String updateProductGroup(
			@RequestParam(required = true)String idGroup,
			@RequestParam(required = true)String groupName
			){
		ProductGroup productGroup = new ProductGroup();
		productGroup.setIdGroup(idGroup);
		productGroup.setGroupName(groupName);
		try {
			productGroupService.updateProductGroup(productGroup);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="deleteProductGroup/{idGroup}", method = RequestMethod.GET)
	public @ResponseBody String deleteProductGroup(@PathVariable("idGroup")String idGroup) {
		
		if (productGroupService.findIdProductGroup(idGroup)) {
			
			productGroupService.deleteProductGroup(idGroup);
			return "success";
		}
		return "failed";
		}
		
	}
