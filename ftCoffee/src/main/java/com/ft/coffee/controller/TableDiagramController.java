package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.SoDo;
import com.ft.coffee.service.TableDiagramService;
import com.google.gson.Gson;

@Controller
public class TableDiagramController {

	@Autowired
	private TableDiagramService TableDiagramService;

	@RequestMapping(value="soDo", method = RequestMethod.GET)
	public String ViewListSoDo() {
		return "soDo";
	}

	@RequestMapping(value="viewlistSoDo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String viewList() {

		return new Gson().toJson(TableDiagramService.getAll());
	}

	@RequestMapping(value="addSoDo", method = RequestMethod.POST)
	public @ResponseBody String addSoDo(@ModelAttribute("table_diagram")SoDo soDo) {

		try {
			TableDiagramService.addSoDo(soDo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="optionIdArea", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String optionIdArea() {
		
		return new Gson().toJson(TableDiagramService.getIdArea());
	}
	
	@RequestMapping(value="optionIdPriceType", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String optionIdPriceType() {
		
		return new Gson().toJson(TableDiagramService.getIdPriceType());
	}
	
	@RequestMapping(value="getTableNumber/{tableNumBer}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getId(@PathVariable("tableNumBer")String tableNumBer) {
		
		return new Gson().toJson(TableDiagramService.getTableName(tableNumBer));
	}
	
	@RequestMapping(value="updateSoDoBanPhong", method = RequestMethod.POST)
	public @ResponseBody String updateSoDo(
			@RequestParam(required = true)String tableNumber,
			@RequestParam(required = true)String idArea,
			@RequestParam(required = true)String idPrice
			){
		SoDo soDo = new SoDo();
		
		soDo.setTableNumber(tableNumber);
		soDo.setIdArea(idArea);
		soDo.setIdPrice(idPrice);
		
		try {
			TableDiagramService.updateSoDo(soDo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="deleteSoDo/{tableNumber}", method = RequestMethod.GET)
	public @ResponseBody String deleteSoDo(@PathVariable("tableNumber")String tableNumBer) {
		
		if (TableDiagramService.findTableNumber(tableNumBer)) {
			TableDiagramService.deleteSodo(tableNumBer);
			return "success";
		}
		return "failed";
	}
}
