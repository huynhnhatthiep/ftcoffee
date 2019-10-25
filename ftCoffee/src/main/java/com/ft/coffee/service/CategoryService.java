package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ft.coffee.dao.CategoryDaoImpl;
import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceType;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDaoImpl categoryDaoImpl;
	
	public List<PriceType> getAllPriceType() {
		return categoryDaoImpl.getAllPriceType();
		
	}
	
	public List<Area> getAllArea() {
		return categoryDaoImpl.getAllArea();
		
	}
	
	public List<DVT> getAllDvt(){
		return categoryDaoImpl.getAllDvt();
	}

	public void deletePriceType(String idPrice) {
		categoryDaoImpl.deletePriceType(idPrice);
	}

	public PriceType getPriceType(String idPrice) {
		return categoryDaoImpl.getPriceType(idPrice);
	}

	public boolean findPriceType(String idPrice) {
		return categoryDaoImpl.findPriceType(idPrice);
	}
	
	public void saveOrUpdatePriceType(PriceType priceType) {
		categoryDaoImpl.saveOrUpdatePriceType(priceType);
	}
}
