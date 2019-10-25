package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.Product;
import com.ft.coffee.entities.ProductGroup;
import com.ft.coffee.service.ProductService;
import com.google.gson.Gson;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@RequestMapping(value = "SanPham", method = RequestMethod.GET)
	public String getPage() {
		return "sanpham";
	}

	@RequestMapping(value = "showListProduct",  method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getAll() {
		
		return new Gson().toJson(productService.showProducts());
	}

	@RequestMapping(value = "addproduct", method = RequestMethod.POST)
	public @ResponseBody String addProduct(@ModelAttribute("product") Product product) {
		try {
			productService.addProduct(product);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}

	@RequestMapping(value = "SanPham/{idProduct}", method = RequestMethod.GET)
	public @ResponseBody String getId(@PathVariable(value = "idProduct") final String id) {
		return new Gson().toJson(productService.getProduct(id));
	}
	
	

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public @ResponseBody String updateProduct(
			@RequestParam(required = true) String idProduct,
			@RequestParam(required = true) String idGroup,
			@RequestParam(required = true) String nameProduct,
			
			@RequestParam(required = true) String idDVT,
			@RequestParam(required = true) Float SLDK,
			@RequestParam(required = true) Float GTDK,
			@RequestParam(required = true) Boolean notEnter,
			@RequestParam(required = true) Boolean notExport,
			@RequestParam(required = true) Boolean IsMenu

	) {

		Product product = new Product();
		
		product.setIdProduct(idProduct);
		product.setIdGroup(idGroup);
		product.setNameProduct(nameProduct);
		product.setIdDVT(idDVT);
		product.setSLDK(SLDK);
		product.setGTDK(GTDK);
		product.setNotEnter(notEnter);
		product.setNotExport(notExport);
		product.setIsMenu(IsMenu);
		try {
			productService.updateProduct(product);
			return "sueccs";
		} catch (Exception e) {
			e.printStackTrace();
			return " failed";
		}
	
	} 

	
	@RequestMapping(value="loadGroup/{idGroup}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loadIdGroupProducts(@PathVariable(value="idGroup") String idGroup) {
		
		if (idGroup != null) {
			String json = new Gson().toJson(productService.loadIdGrouProducts(idGroup));
			
			return json;
			
		}
		return "failed";
	}
	
	
	
//	@RequestMapping(value="deleteProduct/{idProduct}", method = RequestMethod.GET)
//	public @ResponseBody String deleteProduct(@PathVariable(value="idProduct")String id) {
//
//		if (productService.findProduct(id)) {
//			productService.deleteProduct(id);
//			return "success";
//		}
//		return "failed";
//	}
	
	@RequestMapping(value="delete111/{idProduct}", method = RequestMethod.GET)
	public @ResponseBody String deleteProduct(@PathVariable(value="idProduct")String idProduct) {

		if (productService.find(idProduct)) {
			productService.delete(idProduct);
			return "success";
		}
		return "failed";
	}
	
	
	@RequestMapping(value="optionIdGroupProductGroup", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String option() {

		return new Gson().toJson(productService.getOptionProductGroup());
	}
	
	@RequestMapping(value="optionIdGroupDVT", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String optionDVT() {

		return new Gson().toJson(productService.getOptionDVT());
	}

//	@RequestMapping(value = "search", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	public @ResponseBody String searchNameProduct(
//			@RequestParam(value = " Keyword", required = false) String nameProduct) {
//		if (nameProduct != null) {
//			String search = new Gson().toJson(productService.searchNameProducts(nameProduct));
//			return search;
//		}
//		return "{message:fail}";
//
//	}
}
