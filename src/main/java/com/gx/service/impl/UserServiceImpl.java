package com.gx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.UserDao;
import com.gx.po.UserPo;
import com.gx.service.UserService;

@Transactional
@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserPo selectLogin(UserPo user) {
		// TODO Auto-generated method stub
		return userDao.selectLogin(user);
	}

}
