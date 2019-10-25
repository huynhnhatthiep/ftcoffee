package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.indexDaoImp;
import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.TableDiagram;

@Service
public class indexService {

	@Autowired
	private indexDaoImp indexDaoImp;

	public List<TableDiagram> getAll(){

		return indexDaoImp.getAll();
	}

	public List<Area> getArea(){

		return indexDaoImp.getArea();
	}
	
	public List<TableDiagram> getIdAreaTable(String idArea){
		
		return indexDaoImp.loadIdAreaTable(idArea);
	}
	
	public TableDiagram getTableNumber(String tableNumber) {
		
		return indexDaoImp.getId(tableNumber);
	}

}
