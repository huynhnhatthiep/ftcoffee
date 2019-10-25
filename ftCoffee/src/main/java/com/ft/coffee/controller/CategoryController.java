package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ft.coffee.entities.PriceType;
import com.ft.coffee.service.CategoryService;
import com.google.gson.Gson;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/danhmuc", method = RequestMethod.GET)
	public String getPage() {
		return "danhmuc";
	}

	@RequestMapping(value = "/listPrice", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String listPriceType() {
		return new Gson().toJson(categoryService.getAllPriceType());
	}

	@RequestMapping(value = "/listArea", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String listArea() {
		return new Gson().toJson(categoryService.getAllArea());
	}

	@RequestMapping(value = "/listDVT", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String listUnit() {
		return new Gson().toJson(categoryService.getAllDvt());
	}

	@RequestMapping(value = "/deletePrice", method = RequestMethod.POST)
	public @ResponseBody String deletePriceList(@RequestParam(value = "idPrice") String idPrice) throws Exception {
		if (categoryService.findPriceType(idPrice)) {
			categoryService.deletePriceType(idPrice);
			return "success";
		}
		return "failed";
	}

	@RequestMapping(value = "/saveOrUpdatePrice", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String addPriceList(@ModelAttribute("priceType") PriceType priceType) {
		try {
			categoryService.saveOrUpdatePriceType(priceType);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
}
