package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.ProductGroup;

public interface ProductGroupDao {
	public List<ProductGroup> getAllProductGroups(); 
	
	public void addProductGroup(ProductGroup productGroup);
	
	public ProductGroup updateProductGroup(ProductGroup productGroup);
	
	public void deleteProductGroup (String idGroup);
	
	public ProductGroup getIdProductGroup(String idGroup);
	public boolean findIdProductGroup(String idGroup);
	
	
	
}
