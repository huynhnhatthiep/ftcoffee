package com.ft.coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaseController {
	
	@RequestMapping( value= {"/login","/"})
	public String login(@RequestParam(value = "error", required = false) final String error, final ModelMap model) {
		if (error != null) {
			model.addAttribute("message", "Đăng nhập thất bại!");
		}
		return "login";
	}

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "login";
	}

}
