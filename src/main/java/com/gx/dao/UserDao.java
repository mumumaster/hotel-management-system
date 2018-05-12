package com.gx.dao;

import com.gx.po.UserPo;;

public interface UserDao {
	
	public UserPo selectLogin(UserPo user);
	
}
