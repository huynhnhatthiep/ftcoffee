package com.ft.coffee.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.SoDo;
import com.ft.coffee.entities.TableDiagram;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class indexDaoImp implements IndexDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<TableDiagram> getAll() {

		return sessionFactory.getCurrentSession().createQuery("from TableDiagram").list();
	}

	@SuppressWarnings("unchecked")
	public List<Area> getArea() {
		
		return sessionFactory.getCurrentSession().createQuery("from Area").list();
	}

	@SuppressWarnings("unchecked")
	public List<TableDiagram> loadIdAreaTable(String idArea) {
		
		List<TableDiagram> tableDiagram = new ArrayList<TableDiagram>();
		
		if (idArea.equals("Tất cả")) {
			return sessionFactory.getCurrentSession().createQuery("from TableDiagram").list();
		}
		
		tableDiagram = this.sessionFactory.getCurrentSession().createQuery("from TableDiagram where idArea=:idArea").setParameter("idArea", idArea).list();
		if (tableDiagram.size() > 0) {
			return tableDiagram;
		} else {
			return null;
		}
	}

	public TableDiagram getId(String tableNumber) {
		
		return sessionFactory.getCurrentSession().get(TableDiagram.class, tableNumber);
	}
	
}
