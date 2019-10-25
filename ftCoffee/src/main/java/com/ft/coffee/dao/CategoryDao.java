package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceType;

public interface CategoryDao {
	public List<PriceType> getAllPriceType();
	public List<Area> getAllArea();
	public List<DVT> getAllDvt();
	public void deletePriceType(String idPrice);
	public PriceType getPriceType(String idPrice);
	public boolean findPriceType(String idPrice);
	public void saveOrUpdatePriceType(PriceType priceType);
	
	
}
