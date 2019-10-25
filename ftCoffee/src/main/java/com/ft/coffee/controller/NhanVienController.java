package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.service.NhanVienService;
import com.google.gson.Gson;

@Controller
public class NhanVienController {

	@Autowired
	private NhanVienService NhanVienService;

	@RequestMapping(value="NhanVien", method = RequestMethod.GET)
	public String NhanVien() {

		return "NhanVien";
	}

	@RequestMapping(value="viewListStaff", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String ViewList() {

		return new Gson().toJson(NhanVienService.ViewListStaff());
	}

	@RequestMapping(value="addStaff", method = RequestMethod.POST)
	public @ResponseBody String addStaff(@ModelAttribute("staff")NhanVien nhanVien) {

		try {
			NhanVienService.addStaff(nhanVien);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}

	@RequestMapping(value="optionIdPart", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getOptionIdPart() {

		return new Gson().toJson(NhanVienService.getOptionIdPart());
	}

	@RequestMapping(value="getIdStaff/{staffId}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getIdStaff(@PathVariable(value="staffId")  int id) {

		return new Gson().toJson(NhanVienService.getIdStaff(id));
	}

	@RequestMapping(value="updateStaff", method = RequestMethod.POST)
	public @ResponseBody String updateStaff(
			@RequestParam(required = true) int staffId,
			@RequestParam(required = true) String username,
			@RequestParam(required = true) String password,
			@RequestParam(required = true) String staffCode,
			@RequestParam(required = true) String idPart,
			@RequestParam(required = true) String firstName,
			@RequestParam(required = true) String lastName,
			@RequestParam(required = true) String address,
			@RequestParam(required = true) int phone,
			@RequestParam(required = true) int taxCode,
			@RequestParam(required = true) String email,
			@RequestParam(required = true) int isKeToan,
			@RequestParam(required = true) int isThuNgan
			){

		NhanVien nhanVien = new NhanVien();
		nhanVien.setStaffId(staffId);
		nhanVien.setUsername(username);
		nhanVien.setPassword(password);
		nhanVien.setStaffCode(staffCode);
		nhanVien.setIdPart(idPart);
		nhanVien.setFirstName(firstName);
		nhanVien.setLastName(lastName);
		nhanVien.setAddress(address);
		nhanVien.setPhone(phone);
		nhanVien.setTaxCode(taxCode);
		nhanVien.setEmail(email);
		nhanVien.setIsKeToan(isKeToan);
		nhanVien.setIsThuNgan(isThuNgan);

		try {
			NhanVienService.updateNhanVien(nhanVien);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}

	@RequestMapping(value="deleteStaff/{staffId}", method = RequestMethod.GET)
	public @ResponseBody String deleteStaff(@PathVariable("staffId")int id) {

		if (NhanVienService.findStaffId(id)) {
			NhanVienService.deleteStaff(id);
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping(value="searchNameStaff", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String searchName(
			@RequestParam(value="keyword", required=false) String name
			){
		if (name != null) {
			String search = new Gson().toJson(NhanVienService.searchNameStaff(name));
			return search;
		}
		return "{message:fail}";
	}
	
}
