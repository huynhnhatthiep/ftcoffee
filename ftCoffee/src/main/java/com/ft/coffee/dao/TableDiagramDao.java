package com.ft.coffee.dao;

import java.util.List;

import com.ft.coffee.entities.Area;
import com.ft.coffee.entities.PriceType;
import com.ft.coffee.entities.SoDo;
import com.ft.coffee.entities.TableDiagram;

public interface TableDiagramDao {
	
	public List<TableDiagram> getAll();
	public void addSoDo(SoDo soDo);
	/// update
	public SoDo updateSoDo(SoDo soDo0);
	public SoDo getId(String tableNumber);
	/// delete
	public void deleteSoDo(String tableNumber);
	public boolean findTableName(String tableNumber);
	
	/// option
	public List<Area> getId();
	public List<PriceType> getIdPriceType();
	
}
