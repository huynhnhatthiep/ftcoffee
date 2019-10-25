package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.Product;
import com.ft.coffee.entities.ProductGroup;

public interface ProductDao {
	
	public void addProduct(Product product);
	public void deleteProduct(String idProduct);
	public Product updateProduct (Product product);
	public Product getProduct(String idProduct);
	public boolean findProduct(String idProduct);
	
	public List< Product > loadIdGrouProducts(String idGroup);
	public List< Product > searchNameProducts(String nameProduct);
	public List<PriceList> loadListProduct();
	public List<Product> showProducts();
	
	public List<ProductGroup> getOptionProductGroup();
	public List<DVT> getOptionDVT();
	
	public void delete(String idProduct);
	public boolean find(String idProduct);
}
