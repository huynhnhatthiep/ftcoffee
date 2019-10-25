	package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.service.RevenueService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/doanhthu")
public class RevenueController {
	
	@Autowired
	private RevenueService revenueService;
	
	@GetMapping
	public String getPage() {
		return "doanhthu";
	}
	
	@GetMapping(value = "/getThucDon", produces = "application/json;charset=UTF-8")
	public @ResponseBody String getThucDon(@RequestParam(name = "startTime",required = true) String startTime, 
			@RequestParam(name = "endTime",required = true) String endTime,
			@RequestParam(name = "staffId",required = true) String staffId) {
		return new Gson().toJson(revenueService.getList(startTime, endTime, staffId));
	}
	
//	@GetMapping(value="/optionIdArea", produces = "application/json;charset=UTF-8")
//	public @ResponseBody String optionIdArea() {
//		return new Gson().toJson(revenueService.getId());
//	}
}
