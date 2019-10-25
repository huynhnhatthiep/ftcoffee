package com.ft.coffee.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controller403 {
	
	@RequestMapping(value="/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {
		 
		   ModelAndView model = new ModelAndView();
		   if (user != null) {
		    model.addObject("msg", "Hi " + user.getName()
		    + ", You can not access this page!");
		   } else {
		    model.addObject("msg",
		    "You can not access this page!");
		   }
		 
		   model.setViewName("403");
		   return model;
		  }
	
}
