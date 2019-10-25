package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.PriceTypeDaoIpm;
import com.ft.coffee.entities.PriceType;

@Service
public class PriceTypeService {
	
	@Autowired
	private PriceTypeDaoIpm priceTypeDaoIpm;
	
	public List<PriceType> getAllPriceType(){
		
		return priceTypeDaoIpm.getAllPriceType();
	}
	
	public void addPriceType(PriceType priceType) {
		
		priceTypeDaoIpm.addPriceType(priceType);
	}
	
	public PriceType updatePriceType(PriceType priceType) {
		
		return priceTypeDaoIpm.updatePriceType(priceType);
	}
	
	public PriceType getId(String id) {
		
		return priceTypeDaoIpm.getId(id);
	}
	
	public boolean findId(String id) {
		
		return priceTypeDaoIpm.findId(id);
	}
}
