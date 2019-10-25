package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.voucher;
import com.ft.coffee.service.DemoService;
import com.google.gson.Gson;

@Controller
public class DemoController {

	@Autowired
	private DemoService demoService;


	/// show so do
	@RequestMapping(value="getListSoDo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String viewList() {

		return new Gson().toJson(demoService.getListSoDo());
	}
	

	/// show bản giá sản phẩm
	@RequestMapping(value="getListBangGiaSanPham",  method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getPriceList() {

		return new Gson().toJson(demoService.getPriceList());
	}
	
	/// get vouchetNumber 
	@RequestMapping(value="getVoucherNumber/{voucherNumber}",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getVoucherNumber(@PathVariable("voucherNumber")int voucherNumber) {
		
		return new Gson().toJson(demoService.getVoucherNumber(voucherNumber));
	}
	
	/// get tableNumber
	@RequestMapping(value="getTableNumberDiagram/{tableNumber}",method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getTableNumber(@PathVariable("tableNumber")String tableNumber) {
		
		return new Gson().toJson(demoService.getTableNumber(tableNumber));
	}
	
	/// add voucher
	@RequestMapping(value="addVoucherDemo", method = RequestMethod.POST)
	public @ResponseBody String addVoucher(@ModelAttribute("voucher")voucher voucher) {

		try {
			demoService.addVoucher(voucher);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
}
