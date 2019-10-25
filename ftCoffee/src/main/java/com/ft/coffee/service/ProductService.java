package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.ProductDaoImpl;
import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.Product;
import com.ft.coffee.entities.ProductGroup;

@Service
public class ProductService {
	
	@Autowired
	private ProductDaoImpl productDaoImpl;

	public List<Product> getAll(){
		
		return productDaoImpl.getAllProducts();
	}
	public void addProduct(Product product) {
		productDaoImpl.addProduct(product);
	}
	
	public Product updateProduct(Product product) {
		return productDaoImpl.updateProduct(product);
	}

	public void deleteProduct(String idProduct) {
		productDaoImpl.deleteProduct(idProduct);	
	}
	public Product getProduct(String idProduct) {
		
	 return productDaoImpl.getProduct(idProduct);	
	}
	public boolean findProduct(String idProduct) {
	return productDaoImpl.findProduct(idProduct);
	}
	
	public List< Product > loadIdGrouProducts(String idGroup){
		return productDaoImpl.loadIdGrouProducts(idGroup);
	}
	public List< Product > searchNameProducts(String nameProduct){
		return productDaoImpl.searchNameProducts(nameProduct);
}
	public List<PriceList> loadListProduct() {
		return productDaoImpl.loadListProduct();
	}
	
	public List<ProductGroup> getOptionProductGroup(){
		
		return productDaoImpl.getOptionProductGroup();
	}
	
	public List<DVT> getOptionDVT(){
		
		return productDaoImpl.getOptionDVT();
	}
	public List<Product> showProducts(){
		return productDaoImpl.showProducts();
	}
	
	public void delete(String idProduct) {
		
		productDaoImpl.delete(idProduct);
	}
	
	public boolean find(String idProduct) {
		
		return productDaoImpl.find(idProduct);
	}
}
