package com.ft.coffee.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.PriceType;
import com.ft.coffee.entities.SoDo;
import com.ft.coffee.entities.TableDiagram;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class TableDiagramDaoIpm implements TableDiagramDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<TableDiagram> getAll() {
		
		return sessionFactory.getCurrentSession().createQuery("from TableDiagram").list();
	}

	public void addSoDo(SoDo soDo) {
		
		sessionFactory.getCurrentSession().save(soDo);
		
	}

	@SuppressWarnings("unchecked")
	public List<Area> getId() {
		
		return sessionFactory.getCurrentSession().createQuery("from Area").list();
	}

	@SuppressWarnings("unchecked")
	public List<PriceType> getIdPriceType() {
		
		return sessionFactory.getCurrentSession().createQuery("from PriceType").list();
	}

	public SoDo updateSoDo(SoDo soDo) {
		
		sessionFactory.getCurrentSession().update(soDo);
		return soDo;
	}

	public SoDo getId(String tableNumber) {
		
		return sessionFactory.getCurrentSession().get(SoDo.class, tableNumber);
	}

	public void deleteSoDo(String tableNumber) {
		
		SoDo soDo = sessionFactory.getCurrentSession().load(SoDo.class, tableNumber);
		if (soDo != null) {
			
			sessionFactory.getCurrentSession().delete(soDo);
		}
	}

	public boolean findTableName(String tableNumber) {
		
		SoDo soDo = sessionFactory.getCurrentSession().load(SoDo.class, tableNumber);
		return soDo != null;
	}

}
