package com.ft.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ft.coffee.dao.TableDiagramDaoIpm;
import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.PriceType;
import com.ft.coffee.entities.SoDo;
import com.ft.coffee.entities.TableDiagram;

@Service
public class TableDiagramService {
	
	@Autowired
	private TableDiagramDaoIpm tableDiagramDaoIpm;
	
	public List<TableDiagram> getAll(){
		
		return tableDiagramDaoIpm.getAll();
	}
	
	public void addSoDo(SoDo soDo) {
		
		tableDiagramDaoIpm.addSoDo(soDo);
	}
	
	public List<Area> getIdArea(){
		
		return tableDiagramDaoIpm.getId();
	}
	
	public List<PriceType> getIdPriceType(){
		
		return tableDiagramDaoIpm.getIdPriceType();
	}
	
	public SoDo updateSoDo(SoDo soDo) {
		
		return tableDiagramDaoIpm.updateSoDo(soDo);
	}
	
	public SoDo getTableName(String tableName) {
		
		return tableDiagramDaoIpm.getId(tableName);
	}
	
	public void deleteSodo(String tableNumber) {
		
		tableDiagramDaoIpm.deleteSoDo(tableNumber);
	}
	
	public boolean findTableNumber(String tableNumber) {
		
		return tableDiagramDaoIpm.findTableName(tableNumber);
	}
}
