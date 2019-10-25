package com.ft.coffee.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.DVT;
import com.ft.coffee.entities.PriceList;
import com.ft.coffee.entities.Product;
import com.ft.coffee.entities.ProductGroup;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;
		
	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts(){
		
		return sessionFactory.getCurrentSession().createQuery("from Product").list();
	}

	

	public void deleteProduct(String idProduct) {
		Product product = sessionFactory.getCurrentSession().load(Product.class,idProduct);
		if (null != product) {
			sessionFactory.getCurrentSession().delete(product);
		}
	}

	public Product updateProduct(Product product) {
		sessionFactory.getCurrentSession().update(product);
		return product;
	}

	public Product getProduct(String idProduct) {
		return sessionFactory.getCurrentSession().get(Product.class, idProduct);
	}

	public boolean findProduct(String idProduct) {
		Product product = sessionFactory.getCurrentSession().load(Product.class, idProduct);
		return null != product;
	}

	@SuppressWarnings("unchecked")
	public List<Product> loadIdGrouProducts(String idProduct) { 
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = this.sessionFactory.getCurrentSession().createQuery("from Product where idGroup=:idGroup ")
				.setParameter("idGroup", idProduct).list();
		if (listProduct.size() > 0) {
			return listProduct;
		} else {
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public List<Product> searchNameProducts(String nameProduct) {
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = sessionFactory.getCurrentSession().createQuery("from product WHERE nameProduct LIKE'%"+nameProduct+"%'").list();
		if (listProduct.size() > 0) {
			return listProduct;
			
		}else {
			return null;
		}
		
	}

	public void addProduct(Product product) {
	sessionFactory.getCurrentSession().save(product);
		
	}



	public List<PriceList> loadListProduct() {
		
		return sessionFactory.getCurrentSession().createQuery("from PriceList").list();
	}



	public List<ProductGroup> getOptionProductGroup() {
		
		return sessionFactory.getCurrentSession().createQuery("from ProductGroup").list();
	}



	public List<DVT> getOptionDVT() {
		
		return sessionFactory.getCurrentSession().createQuery("from DVT").list();
	}



	public List<Product> showProducts() {
		return sessionFactory.getCurrentSession().createQuery("from Product").list();
	}



	public void delete(String idProduct) {
		
		Product product = sessionFactory.getCurrentSession().load(Product.class, idProduct);
		if (null != product) {
			sessionFactory.getCurrentSession().delete(product);
		}
	}



	public boolean find(String idProduct) {
		
		Product product = sessionFactory.getCurrentSession().load(Product.class, idProduct);
		return null != product;
	}

}
