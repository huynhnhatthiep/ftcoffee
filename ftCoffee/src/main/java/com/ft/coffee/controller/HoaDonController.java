package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.service.HoaDonService;
import com.google.gson.Gson;

@Controller
public class HoaDonController {
	@Autowired
	private HoaDonService hoaDonService;
	
	@RequestMapping(value="hoadon", method = RequestMethod.GET)
	public String NhanVien() {

		return "hoadon";
	}
	@RequestMapping(value="viewListHoaDon", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String ViewList() {

		return new Gson().toJson(hoaDonService.viewListHoaDon());
	}

}
