package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.Part;
import com.ft.coffee.service.PartService;
import com.google.gson.Gson;

@Controller
public class PartController {
	
	@Autowired
	private PartService partService;
	
	@RequestMapping(value="getListTreeView", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getList() {
		
		return new Gson().toJson(partService.getTreeViewPart());
	}
	
	@RequestMapping(value="loadViewIdPart/{idPart}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String loadIdPart(@PathVariable(value="idPart") String idPart) {
		
		if (idPart != null) {
			String json = new Gson().toJson(partService.getIdPart(idPart));
			return json;
		}
		return "failed";
	}
	
	@RequestMapping(value="addPart", method = RequestMethod.POST)
	public @ResponseBody String addPart(
			@RequestParam("idPart")String idPart,
			@RequestParam("partName")String partName
			){
		Part part = new Part();
		part.setIdPart(idPart);
		part.setPartName(partName);
		
		try {
			partService.addPart(part);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="getIdPart/{idPart}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getIdPart(@PathVariable("idPart")String idPart) {
		
		return new Gson().toJson(partService.getIdPartUpdate(idPart));
	}
	
	@RequestMapping(value="updatePartStaff", method = RequestMethod.POST)
	public @ResponseBody String updatePartStaff(
			@RequestParam(required=true)String idPart,
			@RequestParam(required=true)String partName
			) {
		
		Part part = new Part();
		part.setIdPart(idPart);
		part.setPartName(partName);
		try {
			partService.update(part);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value="deletePart/{idPart}", method = RequestMethod.GET)
	public @ResponseBody String deletePart(@PathVariable("idPart")String idPart) {
		
		if (partService.findIdPart(idPart)) {
			partService.deletePart(idPart);
			return "success";
		}
		return "failed";
	}
	
}
