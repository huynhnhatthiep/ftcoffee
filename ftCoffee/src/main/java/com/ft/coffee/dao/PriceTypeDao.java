package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.PriceType;

public interface PriceTypeDao {
	
	public List<PriceType> getAllPriceType();
	public void addPriceType(PriceType priceType);
	public PriceType updatePriceType(PriceType priceType);
	public void deletePriceType(String id);
	public PriceType getId(String id);
	public boolean findId(String id);
	
}
