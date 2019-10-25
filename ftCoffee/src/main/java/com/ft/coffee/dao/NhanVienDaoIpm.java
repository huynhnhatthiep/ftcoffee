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
public class NhanVienDaoIpm implements NhanVienDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<NhanVien> ViewListStaff() {
		
		return sessionFactory.getCurrentSession().createQuery("from NhanVien").list();
	}

	public void addStaff(NhanVien nhanVien) {
		
		sessionFactory.getCurrentSession().save(nhanVien);
	}

	@SuppressWarnings("unchecked")
	public List<Part> getOptionIdPart() {
		
		return sessionFactory.getCurrentSession().createQuery("from Part").list();
	}
	
	public NhanVien updateStaff(NhanVien nhanVien) {
		
		sessionFactory.getCurrentSession().update(nhanVien);
		return nhanVien;
	}
	
	public NhanVien getIdStaff(int idStaff) {
		
		return sessionFactory.getCurrentSession().get(NhanVien.class, idStaff);
	}

	public void deleteStaff(int staffId) {
	
		NhanVien nhanVien = sessionFactory.getCurrentSession().load(NhanVien.class, staffId);
		if (null != nhanVien) {
			sessionFactory.getCurrentSession().delete(nhanVien);
		}
	}

	public boolean findIdStaff(int staffId) {
		
		NhanVien nhanVien = sessionFactory.getCurrentSession().load(NhanVien.class, staffId);
		
		return null != nhanVien;
	}

	@SuppressWarnings("unchecked")
	public List<NhanVien> searchName(String name) {
		
		List<NhanVien> nhanViens = new ArrayList<NhanVien>();
		
		nhanViens = sessionFactory.getCurrentSession()
				.createQuery("from NhanVien  WHERE username LIKE '%"+name+"%'")
				.list();
		
		if (nhanViens.size() > 0) {
			return nhanViens;
		} else {
			return null;
		}
	}

}
