package com.ft.coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrangChuController {
	
	@RequestMapping("/chitietban")
	public String ChiTietBan() {
		return "chitietban";
	}
}
