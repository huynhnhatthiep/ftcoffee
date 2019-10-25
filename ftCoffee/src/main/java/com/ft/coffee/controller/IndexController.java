package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.service.indexService;
import com.google.gson.Gson;

@Controller
public class IndexController {
	
	@Autowired
	private indexService indexService;
	
	@RequestMapping(value="viewlistIndex", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String viewList() {

		return new Gson().toJson(indexService.getAll());
	}
	
	@RequestMapping(value="optionArea", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String optionArea() {
		
		return new Gson().toJson(indexService.getArea());
	}
	
	@RequestMapping(value="loadViewIdArea1", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loadIdGroupCustomer(@RequestParam(value="keyword")String idArea) {
		
		if (idArea != null) {
			String json = new Gson().toJson(indexService.getIdAreaTable(idArea));
			
			return json;
		}
		return "failed";
	}
	
	@RequestMapping(value="getTableNumberAddVoucher/{tableNumBer}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getId(@PathVariable("tableNumBer")String tableNumBer) {
		
		return new Gson().toJson(indexService.getTableNumber(tableNumBer));
	}
	
}
