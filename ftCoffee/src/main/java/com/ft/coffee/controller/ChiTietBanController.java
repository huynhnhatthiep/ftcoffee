package com.ft.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ft.coffee.entities.voucher;
import com.ft.coffee.entities.voucherLine;
import com.ft.coffee.service.ChiTietBanService;
import com.google.gson.Gson;

@Controller
public class ChiTietBanController {

	@Autowired 
	private ChiTietBanService chiTietBanService;

	/// show bản giá sản phẩm
	@RequestMapping(value="getPriceList",  method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getPriceList() {

		return new Gson().toJson(chiTietBanService.getPriceList());
	}

	/// add chứng từ từ index
	@RequestMapping(value="addVoucher", method = RequestMethod.POST)
	public @ResponseBody String addVoucher(@ModelAttribute("voucher")voucher voucher
			) {

		try {
			chiTietBanService.addVoucher(voucher);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failed";
		}
	}

	/// add dong chung tu
		@RequestMapping(value="addVoucherLine", method = RequestMethod.POST)
		public @ResponseBody String addVoucherLine(
				@RequestParam(required = true) int voucherNumber,
				@RequestParam(required = true) String idProduct,
				@RequestParam(required = true) String idDVT,
				@RequestParam(required = true) Float amount,
				@RequestParam(required = true) Float price
				) {
			
			voucherLine vc = new voucherLine();
			vc.setVoucherNumber(voucherNumber);
			vc.setIdProduct(idProduct);
			vc.setIdDVT(idDVT);
			vc.setAmount(amount);
			vc.setPrice(price); 
	
			try {
				chiTietBanService.addVoucherLine(vc);
				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}

	
	@RequestMapping(value="cmm",  method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String cmm() {

		return new Gson().toJson(chiTietBanService.getne());
	}

	/// get tableNumber để lấy dữ liệu

	@RequestMapping(value="getTableNumberVoucherChiTietBan/{tableNumber}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getTableNumber(@PathVariable("tableNumber")String tableNumber) {

		return new Gson().toJson(chiTietBanService.getTableNumberVoucher(tableNumber));
	}

	/// get ID Product

	@RequestMapping(value="getIdProduct/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String getIdProduct(@PathVariable("id")String id) {

		return new Gson().toJson(chiTietBanService.getIdProduct(id));
	}


	@RequestMapping(value="length", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String legth() {
		int number = chiTietBanService.getVoucherNumber().get(chiTietBanService.getVoucherNumber().size() - 1).getVoucherNumber();
		number++;
		return new Gson().toJson(number);
	}
}
