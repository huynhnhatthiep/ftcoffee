package com.ft.coffee.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ft.coffee.entities.Staff;

@Repository
@Transactional(rollbackFor = Exception.class)
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SessionFactory sessionFactory;

	public Staff loadUserByUsernameSercurity(final String username) {
		
		List<Staff> staff = new ArrayList<Staff>();
		staff = this.sessionFactory.getCurrentSession().createQuery("from Staff where username=?0", Staff.class).setParameter(0, username).list();
		if (staff.size() > 0) {
			return staff.get(0);
		} else {
			return null;
		}
	}

}
