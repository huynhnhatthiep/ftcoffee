package com.ft.coffee.dao;

import com.ft.coffee.entities.Staff;

public interface LoginDao {

	public Staff loadUserByUsernameSercurity(String username);
}
