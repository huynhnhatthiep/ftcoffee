package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ft.coffee.dao.ProductGroupDaoImpl;
import com.ft.coffee.entities.ProductGroup;

@Service
public class ProductGroupService {

	@Autowired
	private ProductGroupDaoImpl productGroupDaoImpl;

	public List<ProductGroup> getAllProductGroups() {
		return productGroupDaoImpl.getAllProductGroups();

	}

	public void addProductGroup(ProductGroup productGroup) {
		productGroupDaoImpl.addProductGroup(productGroup);
	}

	public ProductGroup updateProductGroup(ProductGroup productGroup) {
		return productGroupDaoImpl.updateProductGroup(productGroup);
		

	}

	public void deleteProductGroup(String idGroup) {
		productGroupDaoImpl.deleteProductGroup(idGroup);
	}

	public ProductGroup getIdProductGroup(String idGroup) {
		return productGroupDaoImpl.getIdProductGroup(idGroup);
		}

	public boolean findIdProductGroup(String idGroup) {
		return productGroupDaoImpl.findIdProductGroup(idGroup);
	}

}
