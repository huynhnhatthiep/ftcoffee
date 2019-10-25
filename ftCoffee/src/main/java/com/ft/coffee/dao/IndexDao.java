package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.TableDiagram;

public interface IndexDao {
	
	public List<TableDiagram> getAll();
	
	public List<Area> getArea();
	public List<TableDiagram> loadIdAreaTable(String idArea);
	
	public TableDiagram getId(String tableNumber);
	
}
