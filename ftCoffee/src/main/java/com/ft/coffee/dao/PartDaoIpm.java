package com.ft.coffee.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.NhanVien;
import com.ft.coffee.entities.Part;

@Repository
@Transactional
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class PartDaoIpm implements PartDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Part> getTreeViewPart() {
		
		return sessionFactory.getCurrentSession().createQuery("from Part").list();
	}

	@SuppressWarnings("unchecked")
	public List<NhanVien> loadIdPart(String idPart) {
		
		List<NhanVien> nhanViens = new ArrayList<NhanVien>();
		
		nhanViens = sessionFactory.getCurrentSession().createQuery("from NhanVien where idPart=:idPart").setParameter("idPart", idPart).list();
		if (nhanViens.size() > 0) {
			return nhanViens;
		} else {
			return null;
		}
	}

	public void addPart(Part part) {
		
		sessionFactory.getCurrentSession().save(part);
	}

	public Part updatePart(Part part) {
		sessionFactory.getCurrentSession().update(part);
		return part;
	}

	public Part getIdPart(String idPart) {
		
		return sessionFactory.getCurrentSession().get(Part.class, idPart);
	}

	public void deletePart(String idPart) {
		
		Part part = sessionFactory.getCurrentSession().load(Part.class, idPart);
		if (part != null) {
			sessionFactory.getCurrentSession().delete(part);
		}
	}

	public boolean findIdPart(String idPart) {
		
		Part part = sessionFactory.getCurrentSession().load(Part.class, idPart);
		return part != null;
	}

}
